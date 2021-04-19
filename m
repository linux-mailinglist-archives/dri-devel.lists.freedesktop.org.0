Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7664A36485B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 18:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D2F6E409;
	Mon, 19 Apr 2021 16:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D042E6E409
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 16:37:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMIwll8sjfTblxn98JByu95PL+bQhH3ZD2dW3f8cPao7CBfnKi2sLeM3yMFKDaz9lr/Jkgk7H2xzrUvKrPEZpxYjgePvVtbHdieAcECK3WFvr5VoyV22t+V4O4MltOhCgwWEOGv9O9iROOSK7zM8nBRkiPX5wHN2UM3l89fLAo04jzuJj768HZPgb2N/sJO1CSEfAC/F0H7hHf2oTztln7YpSkZfv2WuUB1jAm8DPQ70unGlDXDuJ2XsWSYNHWgg2PAY0F/Lto5ynTklsMSTLYBrtQS6e8tCVEsoMtfHaffAUU0Vw/GkxVxkjEnv+uUC828Yez8L6+ChI2AmnJ32jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cUTKTWaVC1vqnQuTnkMNLLdwVl9DCeXd1QpcBZ5SCQ=;
 b=I16SituQH9ZUcGGknETRT4NrR0eUPoU52vYFBWBgUyLx+8efIzXCROBTjyj8sfqTJgU9tAKJNV2ug6hE0WxbCgKNoro8wHQ6/fTIALzzylpublxSwZo8fKaqc/RlHRFb/aTnED66FU0aNT07tihjCQEWTipvP+ZBGXxWdu6S+vnXYBdG9mRx5fCTVIm+XZEa04ygW9IIF/AurN5aNdrdQci5Q1VaOK2WlzOrDRgcneho06e6WacEqmuhtnQhuMGtTSinJbV337Wig32C0jDf99rV+LW1MTr4+tUTjdLgGulQNgjrZG+ofkKyGUGY3KAhIFvwhDRSiiExcetUhWpIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cUTKTWaVC1vqnQuTnkMNLLdwVl9DCeXd1QpcBZ5SCQ=;
 b=r1DL/IGZeVFJuIdVnwgtgfKKqLwn7/xRQQywlwKqdgBiV/hw8pmoYpVpXB3DVTaMXDwgeJYtdx+l+B2lDTniB6zUSdFExtxLz6dAYW+qAxJqj/xqgpBOG0ODUhu2Awa+IBXl09mfOpTnq4HbbBpyhoRHEJNlJaQeNX2jXrqjBF4=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Mon, 19 Apr
 2021 16:37:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 16:37:20 +0000
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
To: Michal Hocko <mhocko@suse.com>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <YH10s/7MjxBBsjVL@dhcp22.suse.cz>
 <c3f0da9c-d127-5edf-dd21-50fd5298acef@sony.com>
 <YH2a9YfRBlfNnF+u@dhcp22.suse.cz>
 <23aa041b-0e7c-6f82-5655-836899973d66@sony.com>
 <d70efba0-c63d-b55a-c234-eb6d82ae813f@amd.com>
 <YH2ru642wYfqK5ne@dhcp22.suse.cz>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <07ed1421-89f8-8845-b254-21730207c185@amd.com>
Date: Mon, 19 Apr 2021 18:37:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YH2ru642wYfqK5ne@dhcp22.suse.cz>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:613d:4350:cf5f:466]
X-ClientProxiedBy: AM9P192CA0005.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::10) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:613d:4350:cf5f:466]
 (2a02:908:1252:fb60:613d:4350:cf5f:466) by
 AM9P192CA0005.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 16:37:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7bdceb5-f00b-448e-927f-08d903516684
X-MS-TrafficTypeDiagnostic: MN2PR12MB4335:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43357700A54EC00F6A486E4883499@MN2PR12MB4335.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXo3WcHaCqlr1sHKUBA0oZm2vPCiOyqV6WwkrT/LQw6+uhq0LuWrur5gzkPHkKySsc3slO0qW4DjKw5WfHmYHuLVDtgJAL0LWUB7bXJGJ3FGPXMLzFDOlqPNzxfFEt+dneLCp56X7Tuu289uCOW4vRj0dESYC90SXCH4eNe9CrV7mpZLEt1AG5kph8OD7v7xnltKcP+mgWRMiB7MNIlqkT/+12Vc8CFrGp5YNbj8oCCfMNelB/TpANmJdOq7lsJJwcoCmU+GUz1WKA7RmQjCcOwgocRibcMQrNMEd6zIXgYE//2PEVz8z0joxLund9sWImGvxSPSZnL8pNvK15DLfwQfSgAFUmqo6Qf2o7NdQflvzymlKA1ctbu0gc2K7OTjshxySUECq/wWB7XYuKzShe2GH/Q9gsnNiKx17mgFTBg6aLYfu6i2Pr6rWALjmXqzrdx2euh5ZDTvvBUIyfBvxPrZ6VGfrC3QQ0lNyiRxwyRuPIaqENwpzKab+MstpFXeBa7kFAC7H25qQJvrY2ez2oXEBSYNyZBk1zdUFqWzyruA7Cn9OvyBjzHrMwkfpQUb2JSdtRfu96TLeCCudnB3OehUiIH4srIw2FzwknatKAzwMaXRwNAdkxQMTFgr/UIzx4obS2lgAUzrYOaVKwVGvhz6+3wSVFvJg9D/UrkSv9WjqEO2dtK21YP/sexV6Npg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(66476007)(16526019)(8676002)(66946007)(6486002)(186003)(6916009)(2616005)(66556008)(478600001)(86362001)(7416002)(83380400001)(8936002)(2906002)(4326008)(31686004)(31696002)(5660300002)(66574015)(38100700002)(36756003)(316002)(53546011)(6666004)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWp2YVFDeHJwYldOaFBYVzRCbzFiT1JvQ2MySlVOSHRwMkVhcC8yOG5Rcytj?=
 =?utf-8?B?NldpSzNxVlI2Wm10SE1iWWtpdVJFeVhOTVZHdkUzZlF1WUZDNElyWHpQZHBQ?=
 =?utf-8?B?MzB5aUhuNHQ2UUZrUW1qQmhRUDh1Z3VsdFk0cW0yOUgrT1kva0ZacmlXbitT?=
 =?utf-8?B?bXJDbk1XVkhhTnRGUVk2ZnpNZEo4aElwQ3BmYUNCbkg3aTlGWVlVZFptZUUr?=
 =?utf-8?B?RDZFcm0rNFJuSTQzS3lycGhSQVQ5WmZXaXIxL1ZkWDJkT2dqcllFRVV3SGJm?=
 =?utf-8?B?WlRidzJiNmExUzJNMVl6TEdNVUlTbmlFTnd1amR4MENPdkUvbUM0dUJndGFO?=
 =?utf-8?B?RDQwRTcySHlCTVRsdGgrVHZBVm5teWZMcFNvdlJVdkE1bXJFQTYyTTVJbEZO?=
 =?utf-8?B?b3ZvbS81QlN3eDBSWGM2TUJpaHBVcjdINU5rN3hoVHFuRnF0czFiWEtxOVJ6?=
 =?utf-8?B?UDdlMmxITHRqZTlxT21pR1hxOURUdklZb1g1UFVoZE5ubDVWajRERFdwWTdl?=
 =?utf-8?B?ektIUk1Lay9vTkxNNlVPN3ByNHdVZjdJYlo3YVdnMEFsTCtPblVjaFlYaXpH?=
 =?utf-8?B?d3BaWDVic21sR0JDaTZVT0xVLzlhSFVUK3hKaDUzL2lFNzJPckRqZE44aUlT?=
 =?utf-8?B?eUM0YnZlTXlLZGY5VzVGWmZEdDlERmFySlFSL2xMQ3UwTDhyV3R0b3Q0THM3?=
 =?utf-8?B?NkEwVnZoV2NJNTVkT3RmVWd1NHVCM0dTQlp2MWR4dGdpU0RhVG9rOHJMeTFM?=
 =?utf-8?B?Q3dNSEpRZC9sMEkzZFZSSGtWVUFHSFZabGRYanZSUVVOYXhaSWxqWFJNQmg2?=
 =?utf-8?B?Qkc3VjQ4WGlUQzNiUjVKWWx0OStPT2xsTVVBRHJpaGUrTlVrbHdyaUZwZzBj?=
 =?utf-8?B?ZHgvaEtSUUpUdE90TVA0REQwa1JJVlBHMWZBdkhuM0pHSHdISVN2RWZ6d0JP?=
 =?utf-8?B?UkU2YVVHQ2E5ZkE1OThkZ1lGYWNKREpQeDN4VUIzQkE5cld5dmlwL2EwcEZN?=
 =?utf-8?B?b0hxY0poa0pSbVdYWkFQRnhWaU5KeDZ0cEtNTENYUmY0OUExVXJObTZhZUdN?=
 =?utf-8?B?eE1Yd1NKWmo0NFVLUnJTckYxNnR3ak9yVThOa1l6TjY1U21ma1F5ZXpJcGNO?=
 =?utf-8?B?NGdJY3Fxd05YNXNFK1ZtM0ZDdUlUNTZvMVlXRjMwSHZ0UXpqOW5HWmlBR2g2?=
 =?utf-8?B?bHZQWlMyeEo0Vjh6TkJEY1U3YnJpeHNjSUtCM1dsdTVYaWF3Njk0WEFNNEZU?=
 =?utf-8?B?TzdNMHpCbENSemtLQ01jTU90RVVWMHUyM01nbXduYWFlVDdyVnNOVkN3dzda?=
 =?utf-8?B?dnA4VUZUZFdYWFk3ZEh4Uk9qZU0wNDFrRXRrT3Z4Wk1JSkpUR1N0UkhkbFpR?=
 =?utf-8?B?NStWQ0I3UHBRK04yT1JCaEMzZ24wS1ZXd0owcmlMTjU3V3VJRzRzWFY2R2tW?=
 =?utf-8?B?TXJydVRtdGZMWWY5elQvOTVXS0F5RlpkL2ZEamdUM1M0NUN3R2JscmFTOWxN?=
 =?utf-8?B?RTMyeTYzNlBtT2FUSjNRN0VWcDBObkFKM1BRSDhiVkwyVjNqWm8ya1pmT0ZY?=
 =?utf-8?B?dEtDc2FHcDBIVWxoZ1laSWt5WU1pYis2R20yUS9obFNPRVFRWkRsSWlTTTdI?=
 =?utf-8?B?SUc0Y3RqQVNTVmlRUG1laUtwK0tYbEZpUEhpVXNxWVhsR2NDbGxYcm9Bdy96?=
 =?utf-8?B?c0RjdnBrb05MVkMzRHR0Yk9IRk85cStuKzNnaGo2OCtZMlFrVWNOeGZFSHhl?=
 =?utf-8?B?ZlY3VGR1M2xDbVVXRHd0OHdzMHRyRnovczNuVWR3M1dxN3U2TzNPVWY3M2JC?=
 =?utf-8?B?aTExM0FXYVU3YzByd2IrRVZ2N1VEOFEvc2ozVGlnQm85eFRZbDduWEp6ODRo?=
 =?utf-8?Q?qFV2fB0kwoJL/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bdceb5-f00b-448e-927f-08d903516684
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 16:37:19.9712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDGqjhPbFOjOYv4ZLDtLrnZo66OP+T933ge0SmY0gPrekSZXjxYsdMltNbtQB1w7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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
Cc: willy@infradead.org, neilb@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Peter.Enderborg@sony.com,
 linaro-mm-sig@lists.linaro.org, shakeelb@google.com, rppt@kernel.org,
 samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com,
 guro@fb.com, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxOS4wNC4yMSB1bSAxODoxMSBzY2hyaWViIE1pY2hhbCBIb2NrbzoKPiBPbiBNb24gMTkt
MDQtMjEgMTc6NDQ6MTMsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDE5LjA0LjIxIHVt
IDE3OjE5IHNjaHJpZWIgUGV0ZXIuRW5kZXJib3JnQHNvbnkuY29tOgo+Pj4gT24gNC8xOS8yMSA1
OjAwIFBNLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+Pj4gT24gTW9uIDE5LTA0LTIxIDEyOjQxOjU4
LCBQZXRlci5FbmRlcmJvcmdAc29ueS5jb20gd3JvdGU6Cj4+Pj4+IE9uIDQvMTkvMjEgMjoxNiBQ
TSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+Pj4+Pj4gT24gU2F0IDE3LTA0LTIxIDEyOjQwOjMyLCBQ
ZXRlciBFbmRlcmJvcmcgd3JvdGU6Cj4+Pj4+Pj4gVGhpcyBhZGRzIGEgdG90YWwgdXNlZCBkbWEt
YnVmIG1lbW9yeS4gRGV0YWlscwo+Pj4+Pj4+IGNhbiBiZSBmb3VuZCBpbiBkZWJ1Z2ZzLCBob3dl
dmVyIGl0IGlzIG5vdCBmb3IgZXZlcnlvbmUKPj4+Pj4+PiBhbmQgbm90IGFsd2F5cyBhdmFpbGFi
bGUuIGRtYS1idWYgYXJlIGluZGlyZWN0IGFsbG9jYXRlZCBieQo+Pj4+Pj4+IHVzZXJzcGFjZS4g
U28gd2l0aCB0aGlzIHZhbHVlIHdlIGNhbiBtb25pdG9yIGFuZCBkZXRlY3QKPj4+Pj4+PiB1c2Vy
c3BhY2UgYXBwbGljYXRpb25zIHRoYXQgaGF2ZSBwcm9ibGVtcy4KPj4+Pj4+IFRoZSBjaGFuZ2Vs
b2cgd291bGQgYmVuZWZpdCBmcm9tIG1vcmUgYmFja2dyb3VuZCBvbiB3aHkgdGhpcyBpcyBuZWVk
ZWQsCj4+Pj4+PiBhbmQgd2hvIGlzIHRoZSBwcmltYXJ5IGNvbnN1bWVyIG9mIHRoYXQgdmFsdWUu
Cj4+Pj4+Pgo+Pj4+Pj4gSSBjYW5ub3QgcmVhbGx5IGNvbW1lbnQgb24gdGhlIGRtYS1idWYgaW50
ZXJuYWxzIGJ1dCBJIGhhdmUgdHdvIHJlbWFya3MuCj4+Pj4+PiBEb2N1bWVudGF0aW9uL2ZpbGVz
eXN0ZW1zL3Byb2MucnN0IG5lZWRzIGFuIHVwZGF0ZSB3aXRoIHRoZSBjb3VudGVyCj4+Pj4+PiBl
eHBsYW5hdGlvbiBhbmQgc2Vjb25kbHkgaXMgdGhpcyBpbmZvcm1hdGlvbiB1c2VmdWwgZm9yIE9P
TSBzaXR1YXRpb25zCj4+Pj4+PiBhbmFseXNpcz8gSWYgeWVzIHRoZW4gc2hvd19tZW0gc2hvdWxk
IGR1bXAgdGhlIHZhbHVlIGFzIHdlbGwuCj4+Pj4+Pgo+Pj4+Pj4gICBGcm9tIHRoZSBpbXBsZW1l
bnRhdGlvbiBwb2ludCBvZiB2aWV3LCBpcyB0aGVyZSBhbnkgcmVhc29uIHdoeSB0aGlzCj4+Pj4+
PiBoYXNuJ3QgdXNlZCB0aGUgZXhpc3RpbmcgZ2xvYmFsX25vZGVfcGFnZV9zdGF0ZSBpbmZyYXN0
cnVjdHVyZT8KPj4+Pj4gSSBmaXggZG9jIGluIG5leHQgdmVyc2lvbi7CoCBJbSBub3Qgc3VyZSB3
aGF0IHlvdSBleHBlY3QgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGluY2x1ZGUuCj4+Pj4gQXMgSSd2
ZSBzYWlkLiBVc3VhbCBqdXN0aWZpY2F0aW9uIGNvdmVycyBhbnN3ZXJzIHRvIGZvbGxvd2luZyBx
dWVzdGlvbnMKPj4+PiAJLSBXaHkgZG8gd2UgbmVlZCBpdD8KPj4+PiAJLSBXaHkgdGhlIGV4aXN0
aW5nIGRhdGEgaXMgaW5zdWZpY2llbnQ/Cj4+Pj4gCS0gV2hvIGlzIHN1cHBvc2VkIHRvIHVzZSB0
aGUgZGF0YSBhbmQgZm9yIHdoYXQ/Cj4+Pj4KPj4+PiBJIGNhbiBzZWUgYW4gYW5zd2VyIGZvciB0
aGUgZmlyc3QgdHdvIHF1ZXN0aW9ucyAoYmVjYXVzZSB0aGlzIGNhbiBiZSBhCj4+Pj4gbG90IG9m
IG1lbW9yeSBhbmQgdGhlIGV4aXN0aW5nIGluZnJhc3RydWN0dXJlIGlzIG5vdCBwcm9kdWN0aW9u
IHN1aXRhYmxlCj4+Pj4gLSBkZWJ1Z2ZzKS4gQnV0IHRoZSBjaGFuZ2Vsb2cgZG9lc24ndCByZWFs
bHkgZXhwbGFpbiB3aG8gaXMgZ29pbmcgdG8gdXNlCj4+Pj4gdGhlIG5ldyBkYXRhLiBJcyB0aGlz
IGEgbW9uaXRvcmluZyB0byByYWlzZSBhbiBlYXJseSBhbGFybSB3aGVuIHRoZQo+Pj4+IHZhbHVl
IGdyb3dzPyBJcyB0aGlzIGZvciBkZWJ1Z2dpbmcgbWlzYmVoYXZpbmcgZHJpdmVycz8gSG93IGlz
IGl0Cj4+Pj4gdmFsdWFibGUgZm9yIHRob3NlPwo+Pj4+Cj4+Pj4+IFRoZSBmdW5jdGlvbiBvZiB0
aGUgbWVtaW5mbyBpczogKEZyb20gRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9wcm9jLnJzdCkK
Pj4+Pj4KPj4+Pj4gIlByb3ZpZGVzIGluZm9ybWF0aW9uIGFib3V0IGRpc3RyaWJ1dGlvbiBhbmQg
dXRpbGl6YXRpb24gb2YgbWVtb3J5LiIKPj4+PiBUcnVlLiBZZXQgd2UgZG8gbm90IGV4cG9ydCBh
bnkgcmFuZG9tIGNvdW50ZXJzLCBkbyB3ZT8KPj4+Pgo+Pj4+PiBJbSBub3QgdGhlIGRlc2lnbmVk
IG9mIGRtYS1idWYsIEkgdGhpbmvCoCBnbG9iYWxfbm9kZV9wYWdlX3N0YXRlIGFzIGEga2VybmVs
Cj4+Pj4+IGludGVybmFsLgo+Pj4+IEl0IHByb3ZpZGVzIGEgbm9kZSBzcGVjaWZpYyBhbmQgb3B0
aW1pemVkIGNvdW50ZXJzLiBJcyB0aGlzIGEgZ29vZCBmaXQKPj4+PiB3aXRoIHlvdXIgbmV3IGNv
dW50ZXI/IE9yIHRoZSBOVU1BIGxvY2FsaXR5IGlzIG9mIG5vIGltcG9ydGFuY2U/Cj4+PiBTb3Vu
ZHMgZ29vZCB0byBtZSwgaWYgQ2hyaXN0aWFuIEtvZW5pZyB0aGluayBpdCBpcyBnb29kLCBJIHdp
bGwgdXNlIHRoYXQuCj4+PiBJdCBpcyBvbmx5IHZpcnRpbyBpbiBkcml2ZXJzIHRoYXQgdXNlIHRo
ZSBnbG9iYWxfbm9kZV9wYWdlX3N0YXRlIGlmCj4+PiB0aGF0IG1hdHRlcnMuCj4+IERNQS1idWYg
YXJlIG5vdCBOVU1BIGF3YXJlIGF0IGFsbC4gT24gd2hpY2ggbm9kZSB0aGUgcGFnZXMgYXJlIGFs
bG9jYXRlZAo+PiAoYW5kIGlmIHdlIHVzZSBwYWdlcyBhdCBhbGwgYW5kIG5vdCBpbnRlcm5hbCBk
ZXZpY2UgbWVtb3J5KSBpcyB1cCB0byB0aGUKPj4gZXhwb3J0ZXIgYW5kIGltcG9ydGVyLgo+IFRo
ZSBxdWVzdGlvbiBpcyBub3Qgd2hldGhlciBpdCBpcyBOVU1BIGF3YXJlIGJ1dCB3aGV0aGVyIGl0
IGlzIHVzZWZ1bCB0bwo+IGtub3cgcGVyLW51bWEgZGF0YSBmb3IgdGhlIHB1cnBvc2UgdGhlIGNv
dW50ZXIgaXMgc3VwcG9zZWQgdG8gc2VydmUuCgpObywgbm90IGF0IGFsbC4gVGhlIHBhZ2VzIG9m
IGEgc2luZ2xlIERNQS1idWYgY291bGQgZXZlbiBiZSBmcm9tIApkaWZmZXJlbnQgTlVNQSBub2Rl
cyBpZiB0aGUgZXhwb3J0aW5nIGRyaXZlciBkZWNpZGVzIHRoYXQgdGhpcyBpcyAKc29tZWhvdyB1
c2VmdWwuCgpDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
