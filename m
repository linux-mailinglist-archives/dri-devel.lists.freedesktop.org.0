Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5028131EC62
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 17:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F836E849;
	Thu, 18 Feb 2021 16:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E4C6E849;
 Thu, 18 Feb 2021 16:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItZGOYylANGKYaWlLqNfDUvX1uz3NIZHn0p81GZgmiIj8Vdj3nPVJgjckqSo9zpTa7GROYDmPqiXRIHkw+xKglfxiHk1wHxNfYHR4VF+2YilRLhBlwZtwNT3rmStooEsrlrteS+XWQuygoDLoyQPVMcdkUPDzg7tWMB2XwGnrvQb8tqpAMS0FwKWIFpBcsd3Gkf9aDS9q00Od/iGJ5FK6kI45UbKmIblKZTFlQGc3Mohpga4Vd2M30CV+zEyGkH7L9OQ0C5EooOdBlwMw7aVdVHWOxzFFZeNuiM1O/Wp0ekqxd2ihPxl9SDGoU17zxxVKxAVkNyso2cpfpGDF8ZPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKQ7TGX340dwCykz240+HASA94aur2OpxkkfIKr+R8o=;
 b=boWxl2Ik4Pxe7R6Jv/6v1S2f/0qcJ4vXJYldMr0mKoiLq8urZxyh3FL37pg21YAZekazbQ6HcbBysa35lv2XLhvbtOVrzXAWdiSChg1D4yRoAaHmIZeG2Hu3/hsqypE13hnvQvRaCnExSvn44BAJFhdJsVQQ8IJjiKT1at+NJ+TMX1ILbmzcpbD9N/CkqAnuWeIgYpSH0So36z5V5prn81Hj8d5wktIET4LpZHoQLk5VS2w2B2B9P0D9ZrHLOZwXBJh4UwFsE9JdydwSAHj105hxRDAMgHHIWCI8IygGWb20qL3aSbYd2XOI2pYO6Z9xjhRsSDilJp57m00V7seVLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKQ7TGX340dwCykz240+HASA94aur2OpxkkfIKr+R8o=;
 b=yibDGyek1Y/Z00Djb4XZRryzxbxq8Zigwnrx95BitWlRkUunD1l1ikRgPEwkd0TmANKQE9C9nqU8N1+H1kC5XO5ovZGaF+qOxJJiipd2BfZgjrXO7Vh/fNhsSDCS5FgR8zgpF8nrPdcm6yI08FMMG3cKpjf4pirGz4NGnWru4Ow=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 16:42:02 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Thu, 18 Feb 2021
 16:42:02 +0000
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
 <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
 <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
 <abcb8ea9-fcb4-a781-bf87-d12f3910e484@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <74c4a9e1-f1e0-03e5-3c99-755f3cf1b60f@amd.com>
Date: Thu, 18 Feb 2021 11:41:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <abcb8ea9-fcb4-a781-bf87-d12f3910e484@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:d9fa:5842:b5a8:9b5]
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d9fa:5842:b5a8:9b5]
 (2607:fea8:3edf:49b0:d9fa:5842:b5a8:9b5) by
 YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.38 via Frontend Transport; Thu, 18 Feb 2021 16:42:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 713af165-3e8d-4251-c21a-08d8d42c1dfb
X-MS-TrafficTypeDiagnostic: SA0PR12MB4448:
X-Microsoft-Antispam-PRVS: <SA0PR12MB44484B0561B58404CDF221EDEA859@SA0PR12MB4448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WLLUN+EqysURcM0HqOSwrGCfBrSh4K3edHI5pZzIDQIWgnuImRlRIjhc/iJa33LlYvz58cPWEaz4gi8641GBiY/nyDmM0mRj3IrmNHirgiDMIEa/BNm/4LDvTIAuPCH7B6+9m0hSCrDnDLC8aj/dgaKkoVapo2EOXTH2nhvj2iaCI6lHslrXqnIsDkU52E9q2kcakHfCEI187UNTvVvP1jtn74PkX7eE4E5tuzcl/5eC3PrI2wVQSmia8tII5eLNM130m5M3AfwB2+dt7zRoN0SgDQSxGWfi0kLxIYHeXANXhPfpKcPm+9XMA+8IV6uFSgl6b8fDBrBDdo1yslefIPYmYrQkrlcuMVInP/lpHvHtKK8bMCIG4lH34Sj+x5Ap+C6kdTO1w6sz0D6on0mx/qzFgrYa39Vmf/LfyoFwVbayclHtQ0Y6mJHcVBj2lobunOGNjrxPKMcX4z6dTKxAmX21CU7ahw5GwaCe9nkt0kwa7j1TwlJ6jJT9N1vBoF1Cqrts3UxXEE46mRIWpmGng7fZRakOlJPldzX0vtuBVSgpXDnGshmf7pPJUd+MPpXFW0a9d8hKswPvAD0zpIpdkDeBT/Ry3T3vz4iTvaLJkto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(2906002)(66476007)(6486002)(53546011)(16526019)(66556008)(36756003)(52116002)(66946007)(186003)(2616005)(8936002)(31686004)(66574015)(31696002)(8676002)(86362001)(5660300002)(478600001)(316002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUJFK2g4YjcrNzlmRDhTVzNJWVMyUEh4dmI1bEdjZk9mNGt2ekJGR1NaNTl1?=
 =?utf-8?B?RjFrWEhIMGMyWDFyclhabkxzcnRYc3gxMU5qVno0ZjhrcjY1WjZJYVJYRVlP?=
 =?utf-8?B?NzdHZ0l3L1FOdWpPMmcwUkFydXlwS3dXSGI1azdMSHBHTStwckJZWTU1N1ZS?=
 =?utf-8?B?eEZIOEt2NDBNNnlGL2lHWjJXR05zZ2pZNkl2bFhOYWdhQ1h5dVJXUThheWJq?=
 =?utf-8?B?aDBvMG5mV3pkSWs1dGIrb0Rhdmx5ejErL1V1WSs5OUkrVFhPd012bzdpWmJX?=
 =?utf-8?B?THJGYU8vanQ2ME41c1pqaHBOMkZjdDFzNWN3ZWFFWVJXNE5wN0JDYy8rQThp?=
 =?utf-8?B?dDgzR29wTjJjSVFiTHNiMGtQS3h6dnR5WnJIbmkxQmhhT2RMK2o0RDVzQkNy?=
 =?utf-8?B?RGt5dVAxWEVERTBxcCtSdFUxdEtRWHZDaGc0dzBadW11T2hORHgyRXdldnNq?=
 =?utf-8?B?TXZiaHZHVVhoTk5XbjFUL2JRcGZXUFVaWG5zOVFHVjBSa0IvaytmYVppM1FH?=
 =?utf-8?B?Y2JITFYvK0ZheXlaRmE0R2NpRGZFOTkweVZXcWhKWnRWUVMxVkx0S0tmOUdU?=
 =?utf-8?B?cnkwQ2VBZktHUjhlelRTYWVRYkhoTXM0YzVBQlF6Rkc3c1R4RU5COHJHR3lw?=
 =?utf-8?B?UGYxUGphZEVOUVB2TnpWRHF2bjNXOXlwUEVCZUN3NDZoS2hSZTdCU0JGMzl5?=
 =?utf-8?B?c1FhUlBUZGQrWVFIdUhWamlYZ0JERzlQV3Z6M2hQYXpMTDRvRG10eE9PQ1VD?=
 =?utf-8?B?MW56MXcraTZXZDlJd3oyREJNMmJSMDMyNUt3QU0wejBOOGRjNHhFcUtad2R4?=
 =?utf-8?B?dFpta2dzVWZPRUtXcWlvRkpoYjh1eGdIWUgxbXRxK1ZCRmtGOFNqcjAydXg3?=
 =?utf-8?B?bGZqcG4wSzdoSFN1cUZEUm1CVG5VSlZOY3dpOTRVeE9Sd3hyeVdOZ0lQdjMz?=
 =?utf-8?B?N1JjWWdGcUk0Vzl1YVBKZTBxM3ZTNVV3V1VPWGYwdmRkVDVmNi9nRzRUVHo3?=
 =?utf-8?B?VnVsYXBhemEzbzZMZFl2ckNTZ21WVjRsbXlwR0dKeFlRM09Xa2FGUWQ4Nmxt?=
 =?utf-8?B?aWwvbk1FQXhnMFBrVDBNYUN4MEhtQWl1eDRGWFErbUxRd0cyUjM0WWQ1VGk4?=
 =?utf-8?B?WXpqWHI0QVBoMStVcWZWbWtDdldOVmlsSjk3QUxXQWN2TUdPWWRDcE93eWp4?=
 =?utf-8?B?ZHVZSmZ0Z3h4bk4zcy8rUVppTGFJWVdlQUZsZXlGTisxWUJrb0Z2blpTekQv?=
 =?utf-8?B?d250dC80YjVmcmsrVWt2ODhPa3o4MXA1RjFadDQwcllWbUVCdjFPZTRWQ0tv?=
 =?utf-8?B?MFU2dzUrSGRBbDcxekNCQzUyeWZ3b2tObG9zY1p5d2s4NEFQelVra1hHZVoy?=
 =?utf-8?B?STF5azRoTDRTU2xXa01CVFA4eHlsdnMzM1RZTnA1aWl4TjA0aEMwU2xZVTNv?=
 =?utf-8?B?Q3hOMFM1ME95bmd5SjZWNTdzaEhzMGNaTThsdUZ6Z3UvSjJreE94ZTRpZ0NC?=
 =?utf-8?B?YW56NWVGL3lZQ3dtQXpjMWpxR0JTZ2RSaDRQV3RLd2k3RXhWYWMvSGRmRzYr?=
 =?utf-8?B?T2g2NDgwYUJwUmVaenZKNjlleUFoQ0VBZFM0MkRaYWE0L01QVTBXanpIQ0g1?=
 =?utf-8?B?dEZaQU40Ry9DbC9OSHkyaUlvMkx6dTlFeHU4WkVQYXBWZGxrdTYySjRsb3U3?=
 =?utf-8?B?K3duMVhiZS9iR053dnpvY2hLZEhnV2R4bXRmZUV0SXRaTXVFdXgzNW1MNWNX?=
 =?utf-8?B?NUpwZStPcCsralFOa2R6TmZJRE82ZzJPUUNkajNadk1iOHFvbk9taU1Hbjd4?=
 =?utf-8?B?ZncwU2U5WlJWcXkyYXVBMjlKQ0V6UkVMdmk3MmllVE9CZzllL3lRNXpiU2tl?=
 =?utf-8?Q?omZxRzUZ84rX2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713af165-3e8d-4251-c21a-08d8d42c1dfb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 16:42:02.0962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArfDlmA4ESr+WakMSCd3SourO+ZyGS9ByUB8bqsBE3rhYepOYz53lNcBO6NZaCqKsbZNiSGzggcEDvGsL+rYyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMTgvMjEgMTA6MTUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTguMDIu
MjEgdW0gMTY6MDUgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4KPj4gT24gMi8xOC8yMSAz
OjA3IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4KPj4+Cj4+PiBBbSAxNy4wMi4yMSB1
bSAyMjo1OSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+IFByb2JsZW06IElmIHNjaGVk
dWxlciBpcyBhbHJlYWR5IHN0b3BwZWQgYnkgdGhlIHRpbWUgc2NoZWRfZW50aXR5Cj4+Pj4gaXMg
cmVsZWFzZWQgYW5kIGVudGl0eSdzIGpvYl9xdWV1ZSBub3QgZW1wdHkgSSBlbmNvdW50cmVkCj4+
Pj4gYSBoYW5nIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2guIFRoaXMgaXMgYmVjYXVzZSBkcm1f
c2NoZWRfZW50aXR5X2lzX2lkbGUKPj4+PiBuZXZlciBiZWNvbWVzIGZhbHNlLgo+Pj4+Cj4+Pj4g
Rml4OiBJbiBkcm1fc2NoZWRfZmluaSBkZXRhY2ggYWxsIHNjaGVkX2VudGl0aWVzIGZyb20gdGhl
Cj4+Pj4gc2NoZWR1bGVyJ3MgcnVuIHF1ZXVlcy4gVGhpcyB3aWxsIHNhdGlzZnkgZHJtX3NjaGVk
X2VudGl0eV9pc19pZGxlLgo+Pj4+IEFsc28gd2FrZXVwIGFsbCB0aG9zZSBwcm9jZXNzZXMgc3R1
Y2sgaW4gc2NoZWRfZW50aXR5IGZsdXNoaW5nCj4+Pj4gYXMgdGhlIHNjaGVkdWxlciBtYWluIHRo
cmVhZCB3aGljaCB3YWtlcyB0aGVtIHVwIGlzIHN0b3BwZWQgYnkgbm93Lgo+Pj4+Cj4+Pj4gdjI6
Cj4+Pj4gUmV2ZXJzZSBvcmRlciBvZiBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSBhbmQgbWFy
a2luZwo+Pj4+IHNfZW50aXR5IGFzIHN0b3BwZWQgdG8gcHJldmVudCByZWluc2VyaW9uIGJhY2sg
dG8gcnEgZHVlCj4+Pj4gdG8gcmFjZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBH
cm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIGRy
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMzEgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCsp
Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMgCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+
IGluZGV4IDkwOGIwYjUuLmM2Yjc5NDcgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYwo+Pj4+IEBAIC04OTcsOSArODk3LDQwIEBAIEVYUE9SVF9TWU1CT0wo
ZHJtX3NjaGVkX2luaXQpOwo+Pj4+IMKgwqAgKi8KPj4+PiDCoCB2b2lkIGRybV9zY2hlZF9maW5p
KHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCj4+Pj4gwqAgewo+Pj4+ICvCoMKgwqAg
aW50IGk7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqc19lbnRpdHk7Cj4+
Pgo+Pj4gQlRXOiBQbGVhc2Ugb3JkZXIgdGhhdCBzbyB0aGF0IGkgaXMgZGVjbGFyZWQgbGFzdC4K
Pj4+Cj4+Pj4gwqDCoMKgwqDCoCBpZiAoc2NoZWQtPnRocmVhZCkKPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAga3RocmVhZF9zdG9wKHNjaGVkLT50aHJlYWQpOwo+Pj4+IMKgICvCoMKgwqAgLyogRGV0
YWNoIGFsbCBzY2hlZF9lbnRpdGVzIGZyb20gdGhpcyBzY2hlZHVsZXIgb25jZSBpdCdzIHN0b3Bw
ZWQgKi8KPj4+PiArwqDCoMKgIGZvciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9DT1VOVCAtIDE7
IGkgPj0gRFJNX1NDSEVEX1BSSU9SSVRZX01JTjsgCj4+Pj4gaS0tKSB7Cj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxID0gJnNjaGVkLT5zY2hlZF9ycVtpXTsKPj4+
PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghcnEpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29udGludWU7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBMb29wIHRoaXMg
d2F5IGJlY2F1c2UgcnEtPmxvY2sgaXMgdGFrZW4gaW4gCj4+Pj4gZHJtX3NjaGVkX3JxX3JlbW92
ZV9lbnRpdHkgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHdoaWxlICgoc19lbnRpdHkgPSBsaXN0X2ZpcnN0X2VudHJ5X29y
X251bGwoJnJxLT5lbnRpdGllcywKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHks
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGxpc3QpKSkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaW5f
dW5sb2NrKCZycS0+bG9jayk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8q
IFByZXZlbnQgcmVpbnNlcnRpb24gYW5kIHJlbW92ZSAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNwaW5fbG9jaygmc19lbnRpdHktPnJxX2xvY2spOwo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNfZW50aXR5LT5zdG9wcGVkID0gdHJ1ZTsKPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eShycSwgc19lbnRpdHkpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZzX2VudGl0eS0+cnFfbG9jayk7Cj4+
Pgo+Pj4gV2VsbCB0aGlzIHNwaW5fdW5sb2NrL2xvY2sgZGFuY2UgaGVyZSBkb2Vzbid0IGxvb2sg
Y29ycmVjdCBhdCBhbGwgbm93Lgo+Pj4KPj4+IENocmlzdGlhbi4KPj4KPj4KPj4gSW4gd2hhdCB3
YXkgPyBJdCdzIGluIHRoZSBzYW1lIHNhbWUgb3JkZXIgYXMgaW4gb3RoZXIgY2FsbCBzaXRlcyAo
c2VlIAo+PiBkcm1fc2NoZWRfZW50aXR5X3B1c2hfam9iIGFuZCBkcm1fc2NoZWRfZW50aXR5X2Zs
dXNoKS4KPj4gSWYgaSBqdXN0IGxvY2tlZCBycS0+bG9jayBhbmQgZGlkIGxpc3RfZm9yX2VhY2hf
ZW50cnlfc2FmZSB3aGlsZSBtYW51YWxseSAKPj4gZGVsZXRpbmcgZW50aXR5LT5saXN0IGluc3Rl
YWQgb2YgY2FsbGluZwo+PiBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSB0aGlzIHN0aWxsIHdv
dWxkIG5vdCBiZSBwb3NzaWJsZSBhcyB0aGUgb3JkZXIgb2YgCj4+IGxvY2sgYWNxdWlzaXRpb24g
YmV0d2VlbsKgIHNfZW50aXR5LT5ycV9sb2NrCj4+IGFuZCBycS0+bG9jayB3b3VsZCBiZSByZXZl
cnNlIGNvbXBhcmVkIHRvIHRoZSBjYWxsIHNpdGVzIG1lbnRpb25lZCBhYm92ZS4KPgo+IEFoLCBu
b3cgSSB1bmRlcnN0YW5kLiBZb3UgbmVlZCB0aGlzIGJlY2F1c2UgZHJtX3NjaGVkX3JxX3JlbW92
ZV9lbnRpdHkoKSB3aWxsIAo+IGdyYWIgdGhlIHJxIGxvY2sgYWdhaW4hCj4KPiBQcm9ibGVtIGlz
IG5vdyB3aGF0IHByZXZlbnRzIHRoZSBlbnRpdHkgZnJvbSBiZWluZyBkZXN0cm95ZWQgd2hpbGUg
eW91IHJlbW92ZSBpdD8KPgo+IENocmlzdGlhbi4KClJpZ2h0LCB3ZWxsLCBzaW5jZSAodW5mb3J0
dW5hdGVseSkgc2NoZWRfZW50aXR5IGlzIHBhcnQgb2YgYW1kZ3B1X2N0eF9lbnRpdHkgYW5kIAph
bWRncHVfY3R4X2VudGl0eSBpcyByZWZjb3VudGVkCnRoZXJlIGlzIGEgcHJvYmxlbSBoZXJlIHRo
YXQgd2UgZG9uJ3QgaW5jcmVtZW50IGFtZGdwdV9jdHgucmVmY291bnQgd2hlbiAKYXNzaWduaW5n
wqAgc2NoZWRfZW50aXR5CnRvIG5ldyBycSAoZS5nLiBiZWZvcmUgZHJtX3NjaGVkX3JxX2FkZF9l
bnRpdHkpIGFuZCBub3QgZGVjcmVtZW50IGJlZm9yZSAKcmVtb3ZpbmcuIFdlIGRvIGl0IGZvcgph
bWRncHVfY3NfcGFyc2VyLmVudGl0eSBmb3IgZXhhbXBsZSAoaW4gYW1kZ3B1X2NzX3BhcnNlcl9p
bml0IGFuZCAKYW1kZ3B1X2NzX3BhcnNlcl9maW5pIGJ5CmNhbGxpbmcgYW1kZ3B1X2N0eF9nZXQg
YW5kIGFtZGdwdV9jdHhfcHV0KS4gQnV0IHRoaXMgc2VlbXMgYSBiaXQgdHJpY2t5IGR1ZSB0byAK
YWxsIHRoZSBkcm1fc2NoZWRfZW50aXR5X3NlbGVjdF9ycQpsb2dpYy4KCkFub3RoZXIsIGtpbmQg
b2YgYSBiYW5kIGFpZCBmaXgsIHdvdWxkIHByb2JhYmx5IGJlIGp1c3QgbG9ja2luZyAKYW1kZ3B1
X2N0eF9tZ3IubG9jayBhcm91bmQgZHJtX3NjaGVkX2ZpbmkKd2hlbiBmaW5hbGl6aW5nIHRoZSBm
ZW5jZSBkcml2ZXIgYW5kIGFyb3VuZCBpZHIgaXRlcmF0aW9uIGluIGFtZGdwdV9jdHhfbWdyX2Zp
bmkgCih3aGljaCBzaG91bGQgYmUgbG9jayBwcm90ZWN0ZWQKYW55d2F5IGFzIEkgc2VlIGZyb20g
b3RoZXIgaWRyIHVzYWdlcyBpbiB0aGUgY29kZSkgLi4uIFRoaXMgc2hvdWxkIHByZXZlbnQgdGhp
cyAKdXNlIGFmdGVyIGZyZWUuCgpBbmRyZXkKCgo+Cj4+Cj4+IEFuZHJleQo+Pgo+Pgo+Pgo+Pj4K
Pj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+PiArwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2so
JnJxLT5sb2NrKTsKPj4+PiArCj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyog
V2FrZXVwIGV2ZXJ5b25lIHN0dWNrIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2ggZm9yIHRoaXMg
c2NoZWR1bGVyICovCj4+Pj4gK8KgwqDCoCB3YWtlX3VwX2FsbCgmc2NoZWQtPmpvYl9zY2hlZHVs
ZWQpOwo+Pj4+ICsKPj4+PiDCoMKgwqDCoMKgIC8qIENvbmZpcm0gbm8gd29yayBsZWZ0IGJlaGlu
ZCBhY2Nlc3NpbmcgZGV2aWNlIHN0cnVjdHVyZXMgKi8KPj4+PiDCoMKgwqDCoMKgIGNhbmNlbF9k
ZWxheWVkX3dvcmtfc3luYygmc2NoZWQtPndvcmtfdGRyKTsKPj4+Cj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
