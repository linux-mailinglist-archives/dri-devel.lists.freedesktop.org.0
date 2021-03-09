Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9782F331D57
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 04:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A936E448;
	Tue,  9 Mar 2021 03:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB8B6E44D;
 Tue,  9 Mar 2021 03:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt8JHL5NrYtj8eDFSmQgnCbF/aM2Ep+WoPi+buaDvS7M7XoxxJiy1y1QyGYnTEDt1URyN5MgOxR0B8m5Gt5wJvcdcJoqZWgqTWTZe4bmKo9XnfQLV+0ONPS6oo9am8meXYCWoTn43qCCPSQKUivcRxLLr00Wm4ffA+crnlb3thl6xSzifoNIKPAA8H+cWORoXdvCTl3J3rf04VYxeTGCsIJkm2gQu697JEaeuPVgJu1fNdEaQcbF/anLktrNXxiKWTWHF+zzshiF5g5PxsD24+tRBucinfFnAC+K1nkvW1gwVTVqw8a3BJa+hAKqgF/cS9ytRVx7yT1N8cRn4BeWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lK/Lqpd/FQpFnueqYnPRrnbvqskOj+Tb2HPn1njEFxM=;
 b=K5JHMUzWzDp2aj4vhm4GJE1BfyG4Xcdew9YZNQoCOJWW8uGF3eT5HQ4Yn0jZYJE0esrSspAAnA0fgYl86+BHOKAaxgMRYGndagdN/namg6VEXvMawJlbL6uPZqceTxG87W6JYB51qVuiGKRpBqagtrVsKNwZJS19ClAQOAr9EUbnPF0OiERSixWSZ6+rr8eCVBJ4p2ZKU2z6Hj+rMoL8OrUtvQuSAURKcX2O56ARuu7VUbXM+PTLthiJBxSU88zC0LfL2eGR8rWlHt1VzkY0TR+zGKRuflJXxl6S6gFwoIxpCcAMIwzFv9RJJ1cYYHsbNtvsr5R4lFjASvnqESyLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lK/Lqpd/FQpFnueqYnPRrnbvqskOj+Tb2HPn1njEFxM=;
 b=4eAUfWQ5i6YVCaBA3F6ag4lbnhygQV2Oc6siGE1Kk1pOLHnfcW4Sm43OJwgMHYXnUfQwhiEZRIBukO5741v9397QabnpoZNBJy6GWq7yeLIR+3YpUh2+VdbRZFdU7s+1dJaRRZ2fqVFNdzeadSdayP/RdY4DlvkQGQpQWTCXKiI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 9 Mar
 2021 03:20:43 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.031; Tue, 9 Mar 2021
 03:20:43 +0000
Subject: Re: [PATCH] [variant b] drm/amdkfd: fix build error with missing
 AMD_IOMMU_V2
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20210308204606.2634726-1-arnd@kernel.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
Date: Mon, 8 Mar 2021 22:20:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210308204606.2634726-1-arnd@kernel.org>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 03:20:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cf3e2b84-1d2d-4d98-9873-08d8e2aa52a0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39355BFDFBBCEF6E1FF07F8792929@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AxJvblMCZqnxl9u8myPx3E77XvEbTrVoiaietNUESJYJWyqRQyDpIaKUd6opih5idOV7o8FC3O2qPb5xi6MZDelDlOc3Rf+5LvOyQ38RhLE1rAYFxsLPuK6PN6uPPZNyrcW14WmYrxfy2r+Chjo4YbcOAK+6/fHuhH9bxS/HcIeA84OdAqB2eel5C4ouZDuQ9FHhr6O5IVlFY3RlUDZiEaR6gtNUvlpM2wuQYS6/ige7g6tK1JK9Zvq0nXMJbeBiaqrj1ILQE05kPxeQSPHoiOpSgG153MD8D2gnTFq/RVVQ/pj4bduPrSpjNFQndaENUqIILR5Zn99V7QvC4zJxwo4XfleGwj9onjkhN931eP2Bsmj0OXIJ5biW8ipqVSfuQbViyYne4E9ujrV/b7qUZ5CC7skUN8h7UzkpqDnOvbjpRw7xP+oRiq78eexgubNNUK19sFPvi+OAFO3/VUpE6SzX0ACw0abcSqLKF9Ee6h1d9C1p274kAr0AqqPHjQefyeqz02dZKooMaQerM7uk1G2EhDxrVKuDOPGt/iXFm0syBI2vKrSTLbG6PVRYVXXX+NOgT4szPgaNOILRRevF/ARZmZcgcUvFB5odVUPbuMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(66556008)(66476007)(66946007)(6636002)(86362001)(54906003)(478600001)(6486002)(186003)(31696002)(26005)(316002)(110136005)(5660300002)(52116002)(16576012)(4326008)(36756003)(31686004)(8676002)(956004)(2616005)(8936002)(16526019)(44832011)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TWo0KzFnUGlpVm5MSFFORzdGQUZkSk1QbzV5SVNzSldsOWlyS1IxRnIzVEZR?=
 =?utf-8?B?MzhLeCtBaTc2WGlQK2QxYmpnWG1JWm42dTJtbmNLTVZNZjNEVUtZZU1IYmpW?=
 =?utf-8?B?TWNJRFVoaldHU0hBYmsxVjZvZGwzOFlvNWZ6L0ducWs3V04ra1dUOUkrK1I0?=
 =?utf-8?B?TVB2b0FJOExnYUpuVThQeCtYaE0ydFJFV253VkdOc0ZNbEM5TVMya2RWSnhX?=
 =?utf-8?B?RUNta0dRcHZyK2JYRlBSdmtjRWw2eHA2blRkOHJYM0cySDZUOXUxcFova2Ri?=
 =?utf-8?B?R2VUU3cxSnpnSWhpM3o2QWhIakkvU3lybXo4Z0RGc1pFVVAwSU1rd1F6elZs?=
 =?utf-8?B?OGxoVkU3eFh0Z3FGRnpXY1FRK2d5ZG8rM0NHM3hLSHpaTW9pNzZiUFpUYUds?=
 =?utf-8?B?WDVLWm1hTDBMT3ozd0JPS1Jyd0ZSNTd3QUFLRm5HQnpQdUFpQ0lrTGMzcHcv?=
 =?utf-8?B?V0srd2kxd3lmWXZWOHVyL0JnTzJwSVNDZys0RE0rU3k1aEd1UjNTdm5BY2Mr?=
 =?utf-8?B?Z21UaE92TjNQam5aeDdqQ3J3RlZ0SzRITjgra2lYcFVLSnhOSk9zUVd0aGZk?=
 =?utf-8?B?S0ZlLzRCWkFnSGcxdWxveUp4UGt2Z0NybWdSc3NuVldBcDZvOS9JaHB6N0Y3?=
 =?utf-8?B?am1JWnJsd21ubEJBVTJIaGhMdjB1a2FvMjV5VWNRNDF2bW5Ucm5LWVRXMkdp?=
 =?utf-8?B?WFF0OEExODh4bkViclRieGlSY0ZsY2FaR2VrbjBmdUFRd1dMZG1YYXc1RUxp?=
 =?utf-8?B?b2l2NWJRQ1ZXRWlHb2tPL0VuN2ZpaUo1OTlZdEhZQUoxZ2xSOW1wdndTSSsr?=
 =?utf-8?B?d3M2c3lrV3I5Q1k4OGtwbGxPSXRyTytFOTVwd3VVVUdwckhaOTEzVFdaZFBy?=
 =?utf-8?B?NDZYUUJvcWVkclFsL2ErbFNPRkYvY3UyY1F1WC9pbm9ZbXBpUDZhSndzdnZX?=
 =?utf-8?B?WnZFb2FpUUZIUkhReStjV055LzNpZ0htS0FoR1RWc3g2eldYR3VpRVpJS0sx?=
 =?utf-8?B?MXF1YTJZV3dkcGFocHErSzV3WDM5RmNsaytWR3JUamxoaks2UlVhQ2JSVVJM?=
 =?utf-8?B?aWpORmF3VGNjMFlMUnIxYVU0M2lpQXpxbFRUdTF5OWNTMVJvTmxpejRxWkdX?=
 =?utf-8?B?M0RDZ2RvaWZjaktrMkUydGxUaENXanYvUWJmM3NCQWFKQ2lHTVk5OGdoRWNM?=
 =?utf-8?B?SjI0M2NXNnlHWkhlWWUzMDlmUVNsM05YY1hmSytmT2tvSHNpTGczMjRYSkpL?=
 =?utf-8?B?c1I4UnEvU09aa0tqK2xIZjVjbGJwcGMzN0Qvb2RFNFp4NGFza0N0ZlFXQ1Fq?=
 =?utf-8?B?RFlHRjl6RUIycmJZMnRtTHBRb0hwNllXWG1KcXJTWm5UemwyVWU1NVVSc1pv?=
 =?utf-8?B?TmFnYXBxeTRaVEhjNTZPUi9aZ20wdXNBU01IZmxCV1RLbXJiYncxcWZ1WlNI?=
 =?utf-8?B?b292Q0U4VE5IUVlMTGJSSEZoZitNUFI5VnJwbTNNTEdsR3JwVGowbkpGZmxJ?=
 =?utf-8?B?MTljR0dCazZ6Mll2bTVSLzQrOHcyRmRQRUl1QXJmaTFGbWpFdzRiMkU0c0RT?=
 =?utf-8?B?eW0rU3R4dVVQK2c4V1dXdGIrQVJvQmRYZlFveittL2JmTU95ZitFeitoZVMw?=
 =?utf-8?B?SWxKTXZxeTVNVHMwMFdyVTY3dlBXMHJFN09KZ1BCY0ZZUHY2aENXejA0NDk0?=
 =?utf-8?B?VkhXWWJtVzU0Ti96K1ExTWt0dXlQdS9QeWV3M05LTThmZXFJdmRnVkJuSHU2?=
 =?utf-8?B?SHRFL0paK25wSlZVNWNIYlJNd05rdWNoUW1aMWt6Qzh0dDFuczZRam4ybVNh?=
 =?utf-8?B?aEJJRDdqTmkvZkVEd0lxZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3e2b84-1d2d-4d98-9873-08d8e2aa52a0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 03:20:43.2624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIE9utE2rrLB4g+dEVo2L0/nAT/p23KVLZOHjLXPn+Prg3KMKRcs9ic0FdKYlZTxEOoo+YQlfOcEVGYoXha3JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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
Cc: Philip Yang <philip.yang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wMy0wOCB1bSAzOjQ1IHAubS4gc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+IEZyb206
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBVc2luZyAnaW1wbHkgQU1EX0lPTU1V
X1YyJyBkb2VzIG5vdCBndWFyYW50ZWUgdGhhdCB0aGUgZHJpdmVyIGNhbiBsaW5rCj4gYWdhaW5z
dCB0aGUgZXhwb3J0ZWQgZnVuY3Rpb25zLiBJZiB0aGUgR1BVIGRyaXZlciBpcyBidWlsdC1pbiBi
dXQgdGhlCj4gSU9NTVUgZHJpdmVyIGlzIGEgbG9hZGFibGUgbW9kdWxlLCB0aGUga2ZkX2lvbW11
LmMgZmlsZSBpcyBpbmRlZWQKPiBidWlsdCBidXQgZG9lcyBub3Qgd29yazoKPgo+IHg4Nl82NC1s
aW51eC1sZDogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11Lm86IGluIGZ1bmN0
aW9uIGBrZmRfaW9tbXVfYmluZF9wcm9jZXNzX3RvX2RldmljZSc6Cj4ga2ZkX2lvbW11LmM6KC50
ZXh0KzB4NTE2KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11X2JpbmRfcGFzaWQn
Cj4geDg2XzY0LWxpbnV4LWxkOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUu
bzogaW4gZnVuY3Rpb24gYGtmZF9pb21tdV91bmJpbmRfcHJvY2Vzcyc6Cj4ga2ZkX2lvbW11LmM6
KC50ZXh0KzB4NjkxKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11X3VuYmluZF9w
YXNpZCcKPiB4ODZfNjQtbGludXgtbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9p
b21tdS5vOiBpbiBmdW5jdGlvbiBga2ZkX2lvbW11X3N1c3BlbmQnOgo+IGtmZF9pb21tdS5jOigu
dGV4dCsweDk2Nik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9pb21tdV9zZXRfaW52YWxp
ZGF0ZV9jdHhfY2InCj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9tbXUuYzooLnRleHQrMHg5N2Yp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfc2V0X2ludmFsaWRfcHByX2NiJwo+
IHg4Nl82NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4OWE0KTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgYW1kX2lvbW11X2ZyZWVfZGV2aWNlJwo+IHg4Nl82NC1saW51eC1sZDogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11Lm86IGluIGZ1bmN0aW9uIGBrZmRfaW9t
bXVfcmVzdW1lJzoKPiBrZmRfaW9tbXUuYzooLnRleHQrMHhhOWEpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBhbWRfaW9tbXVfaW5pdF9kZXZpY2UnCj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9t
bXUuYzooLnRleHQrMHhhZGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfc2V0
X2ludmFsaWRhdGVfY3R4X2NiJwo+IHg4Nl82NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0
KzB4YWZmKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11X3NldF9pbnZhbGlkX3Bw
cl9jYicKPiB4ODZfNjQtbGludXgtbGQ6IGtmZF9pb21tdS5jOigudGV4dCsweGM3Mik6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYGFtZF9pb21tdV9iaW5kX3Bhc2lkJwo+IHg4Nl82NC1saW51eC1s
ZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4ZTA4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1k
X2lvbW11X3NldF9pbnZhbGlkYXRlX2N0eF9jYicKPiB4ODZfNjQtbGludXgtbGQ6IGtmZF9pb21t
dS5jOigudGV4dCsweGUyNik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9pb21tdV9zZXRf
aW52YWxpZF9wcHJfY2InCj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9tbXUuYzooLnRleHQrMHhl
NDIpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfZnJlZV9kZXZpY2UnCj4KPiBD
aGFuZ2UgdGhlICdpbXBseScgdG8gYSB3ZWFrIGRlcGVuZGVuY3kgdGhhdCBzdGlsbCBhbGxvd3Mg
Y29tcGlsaW5nCj4gaW4gYWxsIG90aGVyIGNvbmZpZ3VyYXRpb25zIGJ1dCBkaXNhbGxvd3MgdGhl
IGNvbmZpZ3VyYXRpb24gdGhhdAo+IGNhdXNlcyBhIGxpbmsgZmFpbHVyZS4KCkkgZG9uJ3QgbGlr
ZSB0aGlzIHNvbHV0aW9uLiBJdCBoaWRlcyB0aGUgSFNBX0FNRCBvcHRpb24gaW4gbWVudWNvbmZp
ZwphbmQgaXQncyBub3QgaW50dWl0aXZlbHkgb2J2aW91cyB0byBzb21lb25lIGNvbmZpZ3VyaW5n
IGEga2VybmVsIHdoeQppdCdzIG5vdCBhdmFpbGFibGUuIFRoZXkgbWF5IG5vdCBldmVuIG5vdGlj
ZSB0aGF0IGl0J3MgbWlzc2luZyBhbmQgdGhlbgp3b25kZXIgbGF0ZXIsIHdoeSBLRkQgZnVuY3Rp
b25hbGl0eSBpcyBtaXNzaW5nIGluIHRoZWlyIGtlcm5lbC4KCldoYXQgSSdtIHRyeWluZyB0byBh
Y2hpZXZlIGlzLCB0aGF0IEtGRCBjYW4gYmUgY29tcGlsZWQgd2l0aG91dApBTUQtSU9NTVUtVjIg
c3VwcG9ydCBpbiB0aGlzIGNhc2UuIEkganVzdCB0ZXN0ZWQgbXkgdmVyc2lvbiB1c2luZwpJU19S
RUFDSEFCTEUuIEknbGwgcmVwbHkgd2l0aCB0aGF0IHBhdGNoIGluIGEgbW9tZW50LgoKUmVnYXJk
cywKwqAgRmVsaXgKCgo+Cj4gRml4ZXM6IDY0ZDFjM2E0M2E2ZiAoImRybS9hbWRrZmQ6IENlbnRy
YWxpemUgSU9NTVV2MiBjb2RlIGFuZCBtYWtlIGl0IGNvbmRpdGlvbmFsIikKPiBTaWduZWQtb2Zm
LWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9LY29uZmlnIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvS2NvbmZpZwo+IGlu
ZGV4IGYwMmM5MzhmNzVkYS4uZDAxZGJhMmFmM2JiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9LY29uZmlnCj4gQEAgLTYsNyArNiw3IEBACj4gIGNvbmZpZyBIU0FfQU1ECj4gIAlib29sICJI
U0Ega2VybmVsIGRyaXZlciBmb3IgQU1EIEdQVSBkZXZpY2VzIgo+ICAJZGVwZW5kcyBvbiBEUk1f
QU1ER1BVICYmIChYODZfNjQgfHwgQVJNNjQgfHwgUFBDNjQpCj4gLQlpbXBseSBBTURfSU9NTVVf
VjIgaWYgWDg2XzY0Cj4gKwlkZXBlbmRzIG9uIEFNRF9JT01NVV9WMj15IHx8IERSTV9BTURHUFU9
bQo+ICAJc2VsZWN0IEhNTV9NSVJST1IKPiAgCXNlbGVjdCBNTVVfTk9USUZJRVIKPiAgCXNlbGVj
dCBEUk1fQU1ER1BVX1VTRVJQVFIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
