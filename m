Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1D7362482
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 17:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD5C6EC59;
	Fri, 16 Apr 2021 15:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EFE6EC59;
 Fri, 16 Apr 2021 15:53:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFi5hwkCyYQc0foDL8hKsXLtpGjIqiTMVDCWOPCV/I203ZOWWGLWezBPt7I5UepW/3o2FQ8jSuV4B0EwMCAEOh9ZNKOajVMeqNM5KIwm6A5k/xqj53IQum6Os4gUrPSZE/58DjT+7J5i1bLpplrIB7i/kc2272WzSl0tFlc8kqrUbREUQIPuTYJ6FxOtBnj55k+s5LSyCiOm44jSgIF3E4K5OnIIBV7awRlo23ZwB9KO/5VGF7UWyLfUZB6wgMEKCf39WqLtHuKzfcsZMpSvJGPDOPVX1ExpgQjVUeOKUd3hOQDdFkcwYexX8TiPafolq1Af4ci2+n2Zs7caT7+SXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYRcDiubc14BMOLHBb0nHcD48TS6y5TeuOVJPhSz7IA=;
 b=f493dI+cqyKIKtxg/gmE3fxvSDbxfn6QSuDYH5pzJgSJa7ds0dt2MXiX0bdNEw05NhGXVSS3DiKLnqViHgAwbPMXPmjSh9y2veGfOdHR0+lu/3jHfvwBXkxGn7qBH7m6okhVwoJoH1GEYffqyL+Av3bb8guDC1ZXOYG57YzbHusVvSlfHOHG9XLU0jxdkSF010jNHHSQwXsOH76ZPkjYNQmvGPS9UiV8rEygU0RD0fvNPWHxsYHgWVUATVaj7Inj5yvt1q+ta+FeOY+GrCZ2RSgIhc2Ejvq7vxSrNwji1D3rzzYNyCAFr7/TjZmLeJnKoSJQxuDosrty9cQ4DKM+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYRcDiubc14BMOLHBb0nHcD48TS6y5TeuOVJPhSz7IA=;
 b=hOB7PHG/FJbDoW50au9wfSeWCL9Qtch4hI1JDEUaRQ8Wvx1AYRH8VXb1VEAkDKACtmWeZUm7XIzxWMnWiir++asBhuGr1+d5CL6r905VjcpwiS22FfaUcv7qWN7AH97EfhCCHKo0q+ninS/ON8LL7ejo1mlwFYJMfkwdo35qrQY=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 15:53:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 15:53:43 +0000
Subject: Re: [PATCH 32/40] drm/amd/amdgpu/amdgpu_ttm: Fix incorrectly
 documented function 'amdgpu_ttm_copy_mem_to_mem()'
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-33-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <eecd70a6-eb05-ea13-e9ca-c0d989f2210b@amd.com>
Date: Fri, 16 Apr 2021 17:53:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416143725.2769053-33-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
X-ClientProxiedBy: AM3PR03CA0063.eurprd03.prod.outlook.com
 (2603:10a6:207:5::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
 (2a02:908:1252:fb60:5d8d:1198:63ca:8fe4) by
 AM3PR03CA0063.eurprd03.prod.outlook.com (2603:10a6:207:5::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 15:53:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7849d282-8b0e-4cb0-164e-08d900efcf8d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB435763ACC4BCC5AAF1A439DD834C9@MN2PR12MB4357.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oRdlPysRb4MqGfyNKIlLPPzhxsdg7YnhfpEqzroLhjGTv39JmonflVXn+/e3CnH25j6g55sZJ2U07gzi/3vRgLr8fa+919Xu+/Ehau//Dx+jCYJ9HGvLH8ydsKqkO12sXdqSgM4QAWLgwGpq1jytY+NgoiqHdh6Dz4b34vIan1RJyyTwu41CJi+Dz42CXma3wCA9+D8SseTJKpl1FgYIdSI0+X9ZiNBgtxX6+O1aVdLk3bKKo26bKNcSa6myNnG3sGQQtzE7BqJjZiGdY1VgT1ZzYEpTMma0ybrJOFYiQ6fM+JNTPXh8UWzG2UbYHASQEx/kS77dC/0kc1JwuOko6FmW5+iY1luArgsJyEsKkZpK/kumRYzDs0LLxMkl10HpCMFR3aYNVDcty1Uio6KTIKjqHqNHv65CLqjQv+4CxUSLqg6pboUJ7A9LOhoUnd/Cn42eI57KHv7Fa0XmAgG2phg8zD7D0M5OCwOI3spK5kye32ZpWnc7DclHgTM9Y/DP3s2bnN6W+mscN3LcTHAtlGg0ac7ymAwX6ut0RhvPvRukSTJMh9uwertuU4CpLy0tsqDyUFb6FlS4Dpvd4q0eMC1eu+guwJkyjb0bIpRK3mf3hjHskCqKQk9PQcvtoMpyzxejoD2tHy+Lmij6toYl1il2vRwTxrz50lMKxzBDAy5Z9u4LsD8S5sL33jjL+SZt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(4326008)(316002)(16526019)(31686004)(186003)(6486002)(83380400001)(5660300002)(2616005)(86362001)(36756003)(54906003)(66574015)(52116002)(2906002)(66476007)(6916009)(8936002)(478600001)(31696002)(66556008)(6666004)(38100700002)(66946007)(7416002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bjVJTVlmdlVHYnJWN0krYkpUUzF3SzErK0p6NVFhVGc1TUVvMmRSU2t5dyto?=
 =?utf-8?B?QXI5VlRIamhDQlVackQ1VEZtYnZNZnJMN2hQYjNBd1BSTG1jWDMwb3lMSjBY?=
 =?utf-8?B?dTQ4WWlhOGhSeEhHRmpKUTBGMWVlSGF2OW95N29oRnJBSXhxTVQydkVBK2o1?=
 =?utf-8?B?eWNxeXp0U3doTHFNZFVhQzhNMVBzd0lUYWx6OXhpcC9uVk1zUUF5ZGVxcisv?=
 =?utf-8?B?cE83SDRURisxQW9wN1IwUWpCZHN2OWw5ZHkrUUwzQTFJRDViUHRKVjA2QXd3?=
 =?utf-8?B?eHZKUExPTVAwcGFzYStSWkNOZHEyYTRoWTZ6eU5oSEhYcmNBYjR4aDBsTERB?=
 =?utf-8?B?bkVnc1lYY3ZvSHArSlNJTHpKS2pkUUNqMThDRG1BNFkxOUI4c3k5UjdMdkt6?=
 =?utf-8?B?Y1Q4cytnblpVQmFtRkJ0bmhNdi9sRGN4R0R4MXE0NWxqTXVTYTF0aVdZTzZW?=
 =?utf-8?B?OVhiRHBxVnlROFMvV0lSVGE2d0tiZ290VldrcGFsOXV5R1JjMVlaMkRHaGdn?=
 =?utf-8?B?MTRjWVlacEFidEx0K0VVWDVkYnZ0bSs4NWtzdExuMXRxN2NmWDJZbTJKeGhY?=
 =?utf-8?B?RTB3bkd2UmRDd25vMDU3cnhlRXVOUHJLekNmQWJxNEVMNzFuQ3R6T29JdXdL?=
 =?utf-8?B?Y2hGMTdMWFdLbHZvNnRjd21OT1ExU1ZWcEJKaVppcWRENk9JbTIrd2o3Vktm?=
 =?utf-8?B?akc0eDQ5RWh6NjQ2Y2hzZEVwbFk4c1RERk5XcjZSejlQdEVCbXNySVdJTC8y?=
 =?utf-8?B?cWc2Uldvd3dNMTdGTUVDemh2TXhQcEVpODQydURkdFdzZXN1MHRhZjZkWGg0?=
 =?utf-8?B?TXcwUkh1TGJxd2VoS29hM3dML2lCS2FocjVhOVp1SmxLOTd5ei93V2ZVWDJo?=
 =?utf-8?B?S3U2SXRua2lnSTdnUnRVWFJwVmVkQ1UwM0g2Y29kNmd2RDV5SWg3RVVMSHZa?=
 =?utf-8?B?bVQxSVRZS2NKcmIxOHNqOEZNV3AxMjVpY2FvSDY0SVcvRzZieEFNaGZGVEhM?=
 =?utf-8?B?VTE3cmRkNWlhMGlyeUlHbFBpRGRzTWtTVWM4L0lTM0piQStPRlRtWEF1RzJs?=
 =?utf-8?B?YlROR2dNYU56YWYrQ3J3b0MrTk1tbzBVNW5oSWxnTEVQSlJUd3E4bXJIUmJL?=
 =?utf-8?B?aDlvVXpjNkl0bDdTcDhVMDJ3RGtIbXpNRGFybUVtbVlIZnFxLzFSQzZ2RFI4?=
 =?utf-8?B?YmNqT3d1R284QkJYRTFONFc1TE8rRS83QzRFSnRPSnhBQmdyTFFkMjNGZ2dk?=
 =?utf-8?B?UE5KQ01leTk0cUtlVDNuVTI1M1l4eU1TMU95Q2RLcHhwVnFZV0V4NU4rUWQ4?=
 =?utf-8?B?ZzEwYVRvdVBMaFZ3MnVabnZCWE9aM2UwQVc1bkk0VEYxbkhZMmxmMkJBWlBM?=
 =?utf-8?B?VFJudjEra0pPY01nVmRWSEVOTzZiUVJRMEZoOUtvaEd3MlNJWlg3VnZlZzY3?=
 =?utf-8?B?NnlpSWZIcW1mZHNpVUZCeGFOR09IZnRWaGFZbkhDZGtEYjJKOFVSamVtZk5M?=
 =?utf-8?B?aU5sOVE5aVZPVDN2MjNYajJLWWJQQmhvTVpWQncrOHBPaVFqOFpSUnBZRVNp?=
 =?utf-8?B?OVNCM2tGSFVHQjIxNERnL05MRWZGa2dUQjJBQlltODF6MnVxcFZrMEMyaDdj?=
 =?utf-8?B?enV5ZloxbG9lNHdZOFJyemNlTnY5dmFWOVQ3d0tNUVRZOCs5ZlpxdDlyaVNm?=
 =?utf-8?B?N0xMc0NJQjY3K29zeGhEMURwMUpCZ2dUZlpLcXZMOUg2M1dSYmtNVnQ0d3dT?=
 =?utf-8?B?M05aNmtBVzRod3gzdlRLbER5c0pwMDZ6ekhldG9pNXBXVnhOcDlSclRUdnox?=
 =?utf-8?B?OHh6REhpZ1YrWmdHdjc2QjNoSm9RR1dqMjluZkJFZnJhY2l1bnJSY05peHU2?=
 =?utf-8?Q?u1EaG6iBXUFMy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7849d282-8b0e-4cb0-164e-08d900efcf8d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:53:43.0298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 296FWH3nBWShuip1l+Zh6GJWh1fkdf8fF4bJlhBHIESUY//hubsvkVZNCQwA+L9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jerome Glisse <glisse@freedesktop.org>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDQuMjEgdW0gMTY6Mzcgc2NocmllYiBMZWUgSm9uZXM6Cj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYzozMTE6IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90b3R5cGUg
Zm9yIGFtZGdwdV9jb3B5X3R0bV9tZW1fdG9fbWVtKCkuIFByb3RvdHlwZSB3YXMgZm9yIGFtZGdw
dV90dG1fY29weV9tZW1fdG9fbWVtKCkgaW5zdGVhZAo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwg
PHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBKZXJvbWUgR2xpc3NlIDxnbGlzc2VAZnJl
ZWRlc2t0b3Aub3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMKPiBpbmRleCAzYmVmMDQzMmNhYzJmLi44NTkzMTRjMGQ2YTM5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IEBAIC0yODgsNyAr
Mjg4LDcgQEAgc3RhdGljIGludCBhbWRncHVfdHRtX21hcF9idWZmZXIoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywKPiAgIH0KPiAgIAo+ICAgLyoqCj4gLSAqIGFtZGdwdV9jb3B5X3R0bV9t
ZW1fdG9fbWVtIC0gSGVscGVyIGZ1bmN0aW9uIGZvciBjb3B5Cj4gKyAqIGFtZGdwdV90dG1fY29w
eV9tZW1fdG9fbWVtIC0gSGVscGVyIGZ1bmN0aW9uIGZvciBjb3B5Cj4gICAgKiBAYWRldjogYW1k
Z3B1IGRldmljZQo+ICAgICogQHNyYzogYnVmZmVyL2FkZHJlc3Mgd2hlcmUgdG8gcmVhZCBmcm9t
Cj4gICAgKiBAZHN0OiBidWZmZXIvYWRkcmVzcyB3aGVyZSB0byB3cml0ZSB0bwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
