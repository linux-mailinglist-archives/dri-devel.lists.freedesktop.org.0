Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B200D342499
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 19:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6548B6EA7D;
	Fri, 19 Mar 2021 18:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AB66EA7A;
 Fri, 19 Mar 2021 18:26:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUeoZZVjbmYKeXAhcOR9RFr732RGjqsziE0D9l5VQ5uRtqWmGoqstuHbABImpqZwYB1SxzwiTZo9fdZlCl2sQJ4lA0hVHpwkPLf9fnNFtOh22TT4qenxVpt+aOx9mZyyrxI5KuZ8ED0Yu84rLUPhCo2Y7gOfKfyavlJygQe5XMAFW/iP04a5Njz+0vQtRA95Xqp7YX002jH6HZ2XwEO4XNJHwwyLeWK3VAsPZ/7lmJP+wpiOYfv4UrnNAOp5sHWeIj2oJqeYxVr8HtmfJbiuH2TPJVH1oFgyFJzZqX2O0wZhR/xZx3c0pHtkGfWtHCzJsPnBKzB3WV65aS2cKD/SPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMWBe1koTd2f570RhxnJQl5CX4Sdq6U/HkBbOXJ0+bc=;
 b=d06Q7HHEPwFngCl0zOtWbCAaeOW/zATVkGfDsdQpqJsqsQoymzncGpI4Zzk/DKyilmBn4m0VcGtgVnlqmk3mYpA2UWWhbsJCVMiCNix8rGKWvSTCsmet3rTiAyM5BNQWbk4q1VBQbQLX05CbgbyTSZWW4uiU+YG9UD17IslMZhRrY67wBzabTKC3x1fLZ6TK24SM+/EoQKYknGeq4klPRV01fYXu4/FwNU0f9QTFFQ8SoNEZn2bKEOkVy9qTGxC8bGklceVQtFdx0m9+IcbfQ7sgrknFg9xzyKrFNKSQ0vaxu60mACAXc59Unay0Rv50KQHfTy1vWyzcFvMe7Lyrwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMWBe1koTd2f570RhxnJQl5CX4Sdq6U/HkBbOXJ0+bc=;
 b=MZzyCK8lgqLhjmWaNH7aRNx/KAxoA9l5ApOOdPdjGnudXijcCIdJp/h9OfOxxUI8U57jvv4etVhITsF/85drOU/0UBQy4PwOb+IIAr+ROVfQKe2Ux35KaLNTyKb9/4NzStiCjiYRXccCAAnpltt9vh7TZG4CoFf17TKUcZw4M+M=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4588.namprd12.prod.outlook.com (2603:10b6:303:2e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Fri, 19 Mar
 2021 18:26:35 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 18:26:35 +0000
Subject: Re: [PATCH 06/19] drm/amd/display/dc/calcs/dce_calcs: Move some large
 variables from the stack to the heap
To: Alex Deucher <alexdeucher@gmail.com>, Lee Jones <lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-7-lee.jones@linaro.org>
 <CADnq5_O7wFLzp7THHN15Diyw52XUN7w+HMks227LWcUvmXShcw@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <2ec1225f-4bf1-41b7-0d00-2b11eab90c94@amd.com>
Date: Fri, 19 Mar 2021 14:26:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADnq5_O7wFLzp7THHN15Diyw52XUN7w+HMks227LWcUvmXShcw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::32) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Fri, 19 Mar 2021 18:26:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f13f36d2-4c7d-4ebe-6488-08d8eb0486dc
X-MS-TrafficTypeDiagnostic: MW3PR12MB4588:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4588DD04A94896526719FA6D8C689@MW3PR12MB4588.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VrBXrQe0K01ssnPP52ZRLmTSVgaaduPD4DXb47ybk35Q4iaLWEIbGsbHC0Vtnhz6373rKw7Qwp0VBwBriGY54ovBt0uhsFqzS2OJDVIZdeXfj6zYmtcN1sflAPJOGWAccIrHiObFXVF+1WyB8FwW6HoTjwSGgztXMMBA00bIqG+cGjABGRr+SAq2fuO6O7LW2yso1xwk9fPVKvqLtLAzAqAk2dxw+q+CGUFIQACPYR1tpPc1mh/WAdOU9fKfR2MZblz4z6vYkAvtu2jIEFn2218h4Sz+PhBX1mAvkhVuimd+2kwyh7yMGB8a5b14KLmtOCZWX9z9UUWfhw4sy3OPNDCmPF/zXR5D3pvLRscwDCKNfT/Np7rufnK0FZZB0k6hi8ltTDBJVLLWWz7mscREKXnKmx83AiVtveTQUF1klIiQWoeYmXjTpy14NPciJQMhJBRejWEANoqUYDB++e3wVzwq1ulAj6cWq3yviMxYsLjmNpJKxCypBZPFkQtFq7KK9/L/W3KaKKGUA+SxQMjyh4XaK4KYWgODn7MzsA54g/guHgGeIiRpo49APKRIKM2x3OIECjbEMPM2I9vHCWvC+v/HxfhglQKfX/NBq/wwm1ykCT/7+106erZKJ4/nWhd6sqkEOALy118zPljthYrcrTkIzmVeFqPaux0TNwHfAPZwsSLo77T2lKSuKBSNwkDc7g04XS3Nf9XEtKffu0OySEPSiZyVUK7e9VxQRJe6i4d0ROlUzN26CBoqBbrt/1GUGrURxVw4CBV34nTyKONvIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(186003)(956004)(16526019)(2616005)(38100700001)(16576012)(66946007)(66556008)(6486002)(66574015)(53546011)(966005)(316002)(2906002)(5660300002)(83380400001)(31696002)(86362001)(8936002)(54906003)(31686004)(8676002)(36756003)(110136005)(478600001)(44832011)(26005)(4326008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0c1a0U3V1R1eEpCY1h1alpmRll5UHFIUFdDNGtqc2NUNXJLakpYM2Q1b3JW?=
 =?utf-8?B?ZHd6Sy9XTm1XU3Ixa2tVVWp1amxLOHBOVy9MN2UrVG84UHhYb1Y1bkJiWDBM?=
 =?utf-8?B?aDY1eGxxbDNNekVDODJzc2dOcmpTaGs5L3k1S3hCeUNjZUY0S09MQlNDTjl2?=
 =?utf-8?B?UURDVU5LbEx2aG1NT1pxMVhZMkxKMGhYcFJpRlYvZkdkeVUzOXZxdUxHY0RU?=
 =?utf-8?B?dm5lK250aUU3dFZvdUVXd2pNcW5GZTV2aU5ITk1Ld3U0OWtENE1ZaytKTjJi?=
 =?utf-8?B?N29FdVdvVUFWZUNhcHBqSlN1OTFHd2xjei9pZzh0VmNWK25BRXZkSHVZR2t4?=
 =?utf-8?B?OUQzZHJJWVhxaUR4UVhhTjNlUnBES0VZbi8yQ3pMb283c2liazJhYTJ5bU12?=
 =?utf-8?B?TjR5czhTMkdlTmlvMWtTamRkdDdDM3BSNjdvWTZRNmZSMGFPcE05YU9HMXBQ?=
 =?utf-8?B?WkZQcjlkSGFrbXlLZXFHb2FibktxR1lHSmw1VlRjVGtmUU9lRS9sTTVaSUtv?=
 =?utf-8?B?ZDZneEU2QUpWNXltUFc1aFpWMG1CU3hJQm95bWVtU3FGemZiOElSMHZQWlhz?=
 =?utf-8?B?L1pRcWh0QklRTDBHeXd1UGtRbWMwdUlLRnBtVGNBNHF2dXBNSXdGcDNxM2xi?=
 =?utf-8?B?TDZwdU1tVWlhaGdNb0hubm5vTGgxekl0NTAvOTFYNWZwelhUb1B4SXdKLzJH?=
 =?utf-8?B?cUxFWU9XcU1kczR1Yy9hV2sxSFFOdGN6M1V5ZnlKS0pnRFZ1MExHclNCM1Jk?=
 =?utf-8?B?L3JiWitPU0hqT3ZyK0trWERMMUxsYkJVNEowY3ExVVNFeklGVm5sRmQyWU1B?=
 =?utf-8?B?NEl3NFQ5eDdLUDh1bWZDMTNsa0tWZkU4dkFFQm1sQmpMMFhVTVAwU3ZwRzAx?=
 =?utf-8?B?aTZITkxZaXhIRzlOYXRkeG5hMFF5YVZXOXhRRnhiNzd3NEcvZCtLRTVUSjFN?=
 =?utf-8?B?Z1V5dloySUtqWnFXd0NIVVhaTENYVUkxRWMvT05kRjdCb1hGUUVCcjVmZDBm?=
 =?utf-8?B?UmV2TUdqVkkycHUvY1BFWElwSW9XeVN5Qmc3YnBndzNjV0NXM1lZMzlZaGNj?=
 =?utf-8?B?UTBNUTYva3djclhXNlpwOFNVUU5qL0czMmorVDZ6NDJuN0tXeXRVUFJYOXNK?=
 =?utf-8?B?S0Y1Um4xT2NtSjBxeHdYUk5JRklDWXl2b01OdFFqUDNBOU1uNktKOGN2S0c0?=
 =?utf-8?B?TVdRWGx2WXA3Qmsyc1ZpdVVsRmpLb1JXOStRK0JxRmNud1BnRkRpb0JSS0No?=
 =?utf-8?B?OTJ6Y3liL2xKc1ppb1ZqQkgrOEt3TzJtbWVtdlU1amJJT29sWFVNOGZLWE5k?=
 =?utf-8?B?RUZtVml2OXU5VVJBUlAxZzBjcVI3VnZIZytFajlVRG9qMlhuWXpLdDhwK0Fp?=
 =?utf-8?B?V0VQUytZVWtHM3VvNzJVQ2pNMGFPcWVSRDhBQWxIVzJ5cXc5MThMd2V1SkUv?=
 =?utf-8?B?cHlKV3VwSStpam94Z0I4REkwZG5Rek1FOUtlZFlCMkhRVWp5bnpLVjJGNWVE?=
 =?utf-8?B?YlZJazA0U05zN2xwbjlkTWVLbklLa0xROXZWVzlJczJGbEJKdkQ0YVU4Qkdv?=
 =?utf-8?B?Qk9DeWY4NzdYWk1pejFHZ0xaaXc5LzR3Slh3WW5yMC82YlBSSmpTR01rQU9a?=
 =?utf-8?B?MjRvQk1GTWFZemQyR0RVZFNaNGRzbEExSDlSU2gyWnh0UDd1cUZxMFYvUU42?=
 =?utf-8?B?UlVaYnViUVkxOEF1VGYvSHV3MVZuZTE4TmZMM1psQ2o3QmxKRXBzQ2k2V3Bl?=
 =?utf-8?Q?H8TPehb4EAnmQCuTUetyc7jGpyoioqO6xuiZEzm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13f36d2-4c7d-4ebe-6488-08d8eb0486dc
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 18:26:34.9097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwGaIygZ5mtOoJPmfcKHLYvunQiLkhgfS+PWzjzxkUXO7myyewGPona3LOgRItqUA35JpfDnqHxq45NQim4YGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4588
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, David Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Harry Wentland <hwentlan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMy0xOSAyOjEzIHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToKPiArIEhhcnJ5LCBO
aWNrCj4gCj4gT24gRnJpLCBNYXIgMTksIDIwMjEgYXQgNDoyNCBBTSBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2Vy
bmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4+Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYzogSW4gZnVuY3Rpb24g4oCYY2FsY3VsYXRl
X2JhbmR3aWR0aOKAmToKPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5
L2RjL2NhbGNzL2RjZV9jYWxjcy5jOjIwMTY6MTogd2FybmluZzogdGhlIGZyYW1lIHNpemUgb2Yg
MTIxNiBieXRlcyBpcyBsYXJnZXIgdGhhbiAxMDI0IGJ5dGVzIFstV2ZyYW1lLWxhcmdlci10aGFu
PV0KPj4KPj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+PiBD
YzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Pj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPj4gQ2M6IENvbGluIElhbiBL
aW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+PiAtLS0KPj4gICAu
Li4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyAgfCAzMiArKysrKysr
KysrKysrKysrLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2FsY3MvZGNlX2NhbGNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2Fs
Y3MvZGNlX2NhbGNzLmMKPj4gaW5kZXggZTYzM2Y4YTUxZWRiNi4uOWQ4ZjI1MDVhNjFjMiAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxj
cy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2Fs
Y3MuYwo+PiBAQCAtOTgsMTYgKzk4LDE2IEBAIHN0YXRpYyB2b2lkIGNhbGN1bGF0ZV9iYW5kd2lk
dGgoCj4+ICAgICAgICAgIGludDMyX3QgbnVtX2N1cnNvcl9saW5lczsKPj4KPj4gICAgICAgICAg
aW50MzJfdCBpLCBqLCBrOwo+PiAtICAgICAgIHN0cnVjdCBid19maXhlZCB5Y2xrWzNdOwo+PiAt
ICAgICAgIHN0cnVjdCBid19maXhlZCBzY2xrWzhdOwo+PiArICAgICAgIHN0cnVjdCBid19maXhl
ZCAqeWNsazsKPj4gKyAgICAgICBzdHJ1Y3QgYndfZml4ZWQgKnNjbGs7Cj4+ICAgICAgICAgIGJv
b2wgZDBfdW5kZXJsYXlfZW5hYmxlOwo+PiAgICAgICAgICBib29sIGQxX3VuZGVybGF5X2VuYWJs
ZTsKPj4gICAgICAgICAgYm9vbCBmYmNfZW5hYmxlZDsKPj4gICAgICAgICAgYm9vbCBscHRfZW5h
YmxlZDsKPj4gICAgICAgICAgZW51bSBid19kZWZpbmVzIHNjbGtfbWVzc2FnZTsKPj4gICAgICAg
ICAgZW51bSBid19kZWZpbmVzIHljbGtfbWVzc2FnZTsKPj4gLSAgICAgICBlbnVtIGJ3X2RlZmlu
ZXMgdGlsaW5nX21vZGVbbWF4aW11bV9udW1iZXJfb2Zfc3VyZmFjZXNdOwo+PiAtICAgICAgIGVu
dW0gYndfZGVmaW5lcyBzdXJmYWNlX3R5cGVbbWF4aW11bV9udW1iZXJfb2Zfc3VyZmFjZXNdOwo+
PiArICAgICAgIGVudW0gYndfZGVmaW5lcyAqdGlsaW5nX21vZGU7Cj4+ICsgICAgICAgZW51bSBi
d19kZWZpbmVzICpzdXJmYWNlX3R5cGU7Cj4+ICAgICAgICAgIGVudW0gYndfZGVmaW5lcyB2b2x0
YWdlOwo+PiAgICAgICAgICBlbnVtIGJ3X2RlZmluZXMgcGlwZV9jaGVjazsKPj4gICAgICAgICAg
ZW51bSBid19kZWZpbmVzIGhzcl9jaGVjazsKPj4gQEAgLTEyMiw2ICsxMjIsMjIgQEAgc3RhdGlj
IHZvaWQgY2FsY3VsYXRlX2JhbmR3aWR0aCgKPj4gICAgICAgICAgaW50MzJfdCBudW1iZXJfb2Zf
ZGlzcGxheXNfZW5hYmxlZF93aXRoX21hcmdpbiA9IDA7Cj4+ICAgICAgICAgIGludDMyX3QgbnVt
YmVyX29mX2FsaWduZWRfZGlzcGxheXNfd2l0aF9ub19tYXJnaW4gPSAwOwo+Pgo+PiArICAgICAg
IHljbGsgPSBrY2FsbG9jKDMsIHNpemVvZigqeWNsayksIEdGUF9LRVJORUwpOwo+PiArICAgICAg
IGlmICgheWNsaykKPj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPj4gKwo+PiArICAgICAgIHNj
bGsgPSBrY2FsbG9jKDgsIHNpemVvZigqc2NsayksIEdGUF9LRVJORUwpOwo+PiArICAgICAgIGlm
ICghc2NsaykKPj4gKyAgICAgICAgICAgICAgIGdvdG8gZnJlZV95Y2xrOwo+PiArCj4+ICsgICAg
ICAgdGlsaW5nX21vZGUgPSBrY2FsbG9jKG1heGltdW1fbnVtYmVyX29mX3N1cmZhY2VzLCBzaXpl
b2YoKnRpbGluZ19tb2RlKSwgR0ZQX0tFUk5FTCk7Cj4+ICsgICAgICAgaWYgKCF0aWxpbmdfbW9k
ZSkKPj4gKyAgICAgICAgICAgICAgIGdvdG8gZnJlZV9zY2xrOwo+PiArCj4+ICsgICAgICAgc3Vy
ZmFjZV90eXBlID0ga2NhbGxvYyhtYXhpbXVtX251bWJlcl9vZl9zdXJmYWNlcywgc2l6ZW9mKCpz
dXJmYWNlX3R5cGUpLCBHRlBfS0VSTkVMKTsKPj4gKyAgICAgICBpZiAoIXN1cmZhY2VfdHlwZSkK
Pj4gKyAgICAgICAgICAgICAgIGdvdG8gZnJlZV90aWxpbmdfbW9kZTsKPj4gKwo+IAo+IAo+IEhh
cnJ5IG9yIE5pY2sgY2FuIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLCBidXQgZm9yIHRoaXMgcGF0
Y2ggYW5kIHRoZQo+IG5leHQgb25lLCBJIHRoaW5rIHRoaXMgY2FuIGJlIGNhbGxlZCBmcm9tIGFu
IGF0b21pYyBjb250ZXh0Lgo+IAoKIEZyb20gd2hhdCBJIGNhbiBzZWUgdGhpcyBkb2Vzbid0IHNl
ZW0gdGhlIGNhc2UuIElmIEknbSBtaXNzaW5nIApzb21ldGhpbmcgc29tZW9uZSBwbGVhc2UgY29y
cmVjdCBtZS4KClRoaXMgYW5kIHRoZSBuZXh0ICgwNi8xOSkgcGF0Y2ggYXJlIGJvdGgKUmV2aWV3
ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgoKSGFycnkKCj4g
QWxleAo+IAo+PiAgICAgICAgICB5Y2xrW2xvd10gPSB2Ymlvcy0+bG93X3ljbGs7Cj4+ICAgICAg
ICAgIHljbGtbbWlkXSA9IHZiaW9zLT5taWRfeWNsazsKPj4gICAgICAgICAgeWNsa1toaWdoXSA9
IHZiaW9zLT5oaWdoX3ljbGs7Cj4+IEBAIC0yMDEzLDYgKzIwMjksMTQgQEAgc3RhdGljIHZvaWQg
Y2FsY3VsYXRlX2JhbmR3aWR0aCgKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIH0KPj4gICAg
ICAgICAgICAgICAgICB9Cj4+ICAgICAgICAgIH0KPj4gKwo+PiArICAgICAgIGtmcmVlKHN1cmZh
Y2VfdHlwZSk7Cj4+ICtmcmVlX3RpbGluZ19tb2RlOgo+PiArICAgICAgIGtmcmVlKHRpbGluZ19t
b2RlKTsKPj4gK2ZyZWVfeWNsazoKPj4gKyAgICAgICBrZnJlZSh5Y2xrKTsKPj4gK2ZyZWVfc2Ns
azoKPj4gKyAgICAgICBrZnJlZShzY2xrKTsKPj4gICB9Cj4+Cj4+ICAgLyoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKPj4gLS0KPj4gMi4yNy4wCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbD4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
