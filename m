Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2B8314BDC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 10:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C629A6EB04;
	Tue,  9 Feb 2021 09:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3738924B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 08:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCbk4hI0VrbcBAbfbAebXoCIh/0QYICD3Ou0RWyR7rEfX/7oI1xkbZhiIERMP6IUW2+H71u132YUW3bdrqxMSdT+PhW19K2NyE8ELOhASTHD6VHe5enj7PUPPXEi2Qzyl54tJqAZZsNhFVIUlkrCQ4UX4zdUW4wNitfAQIA+E3E293hWuLAdTix8pngPlqtPz9BXasfOAmP2kkTArJnQBydsdHSSy7mqY6NKVeMI47RNmmcTWeLxhddsAfenHiiawVnSK9yZXy76NwRKzz5Q3qprbM6xMprOtlp4bIABZL7IsX4yxqiREhW6q4WdQe1DOOfAkh8aPwo11bGzYki8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmc/oBkdqo9jCgMv7DRuDIfIsbxE1s+XLpb/jSlKBec=;
 b=JWOUMr7ycDaOVFXrqM1Zz0SSx9QP93qveissXdokzV7S4Lo0ltRQXjo8LmBdqJ3+UVbPELtkoZK2D41HzNTT8ANqYUqELCVbyuwGQ1uhy3QCvqxcAEMe79Td9mkWu2iyTXHXvrx9RLlFWgnoZQq2RcOUqZfQqm7NIlsCxYrn9O9tiXAhwcuSMSj8giS3ozKilFPIvu18I8aDa2XtlV97nII7IWWH+ARlwIEDCYTOlcVNTXfL5FIu/a//7WF1HVhDMJk1nktTFQPEM1Vazr/TSnlynX4LxMN4Qe63wfpCM5EUQWzA/JgJk4NLt298/M/pBFibECZoFDR3s8WG1wpDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmc/oBkdqo9jCgMv7DRuDIfIsbxE1s+XLpb/jSlKBec=;
 b=GtFhEIemzuTDVE5xxjjXQ6wspU1fIuNFk25nEnqgwjhAh0bjf+B6jktBByVkm5hFx1LX18gMRGe4lonQj9m+iAOKWRbs0mI226rboGeoLZWBOCsAEHyDyxGdpDkvQC3lhgkVS11/fUbgNR5oEic8IEaJ79jaw+6uq3cL+C6OjgU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR11MB0069.namprd11.prod.outlook.com (2603:10b6:910:79::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Tue, 9 Feb
 2021 08:07:40 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0%7]) with mapi id 15.20.3784.027; Tue, 9 Feb 2021
 08:07:40 +0000
Subject: Re: [PATCH] drm/tilcdc: send vblank event when disabling crtc
To: Jyri Sarha <jyri.sarha@iki.fi>
References: <20210129055831.1702862-1-quanyang.wang@windriver.com>
 <1c6bd553-ee27-c93b-59e6-8d3c8368213a@ideasonboard.com>
 <40037f81-2444-1fe0-f5da-194f2a3d3f22@windriver.com>
 <d38abc6d22590f0eea1aa7aae3ff754f@iki.fi>
From: "quanyang.wang" <quanyang.wang@windriver.com>
Message-ID: <29f8d014-ddb5-527e-70eb-eab1079562dc@windriver.com>
Date: Tue, 9 Feb 2021 16:07:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <d38abc6d22590f0eea1aa7aae3ff754f@iki.fi>
Content-Language: en-US
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BL1PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::19) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.199] (60.247.85.82) by
 BL1PR13CA0134.namprd13.prod.outlook.com (2603:10b6:208:2bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend
 Transport; Tue, 9 Feb 2021 08:07:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6419af96-dd1d-4c45-d011-08d8ccd1c55b
X-MS-TrafficTypeDiagnostic: CY4PR11MB0069:
X-Microsoft-Antispam-PRVS: <CY4PR11MB0069B84F564CFDEA1B7BC20DF08E9@CY4PR11MB0069.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7nH+r8VkGDyDkHVKE8hrqxgavNIhmCMhyo0KXHrFgXP0xkP0MijPjvCsy6+F9YUcy0i7xuiIFlKg6tTYC96gFnppQXbQ37+3iglHVGwLaT32mEj+IvfVnSESYAIx9tpf7M6kCJnAlUFnXwYKQGz+zzxc+SqYiSUk59vJg7h69pGUkYGgEOaNfqOX+X+2Rwlw3DnCrNUwGQddlTzls7sbMsEsu7vuxvEL7Wp0/yl3a7elnF7waTjkWtUb0+0cBrzMwx5PKsKjqWIt3PODhZ0KgldQlcMtB8ekHY2WqS9dx6tCBRRDf1ecbT3qKxU0TrP8CbrgVHNWreEy1xVY3vUKlTGXLgfmD6qliygSq0I+3U2uBb5/n6WP+Dh/DZeCVEGlYmz5iXrJLG8B92FsuMo67MGZxMmmkG6bL9F5x4MME0xOwfv0SSsufTJ6a5sx1iAltOqNVz5+LXJ/e0IQ0n1hSqMBMydy+X3PTNEvTN7+Pub/6mRiH9MONjCqejdT2MoZ5Z1KnVeQ1R0TzFkuDqmcSB7w3NxG8mCBlfgKbiS68GLFCRwmBce20SB28V7oJsIJAd++P+/0B8Dx+mlznDFNG6ML8fFfFGggb9E2IoRib1jXZzsZuse6f9R06cY9eviL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39850400004)(376002)(366004)(396003)(316002)(6706004)(8676002)(478600001)(26005)(36756003)(66476007)(6916009)(54906003)(66556008)(8936002)(6666004)(186003)(16526019)(16576012)(6486002)(83380400001)(5660300002)(66946007)(53546011)(31686004)(2906002)(31696002)(86362001)(4326008)(52116002)(956004)(2616005)(78286007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1ozQUxtY1dCV011cTQrajZOSnZPQjZvVE0xQUtRS1NUNElZeER6L0Y2V3Uw?=
 =?utf-8?B?UVY0eUFETDhxTk1TTW1KN2hDUzNNQVBSOE9WdEc0WjZvR3FGaWxyOGgwZm5N?=
 =?utf-8?B?SkcwcU5TWjhaMUU3TkVCMldNSmpKeVhQTlJTejh4T2V3c3J1eGQzUzhIT3Zo?=
 =?utf-8?B?TWtoNkpsT2F1bHhLaEdFNEZkc2kvbm84VDFxVStoWnZUalV4TU92aHY3NWFE?=
 =?utf-8?B?VWtWNmVtSkhLREVZYXpveG5Jb1orT0NETzNLS1dxYTlueFByVldVdFVZa3Nq?=
 =?utf-8?B?SVY2eTAydE13WGlwTXNZNlo4a1RzU2NVOTRtcTJUa0k5U0dCTk5oYjBQTjcw?=
 =?utf-8?B?OGNESXlzOVJwdEl1SmhKbnI1L2lmaTJsSDRsMnR6Sy9nZG8veXgvbE9aT3Yx?=
 =?utf-8?B?VDBtanJqQU5zdHFMZWZGeFprR1JITHpNUHJVUjFySFBRcDgwZWNrd2NNOUlv?=
 =?utf-8?B?WmV2eE9lRUM1OFlLUXVITUtNa1QydlFobGRLNXViaHNlcjNucTNVVVlVVjlx?=
 =?utf-8?B?eWV6d0lOMHFtZWtNdHl1RE1sai9FUHhETEpRMzZxU2h6S3lmWHJ1aG5yVkoy?=
 =?utf-8?B?YjdlVDlIYjg0SHBybGdzb2ZVR2sxUmdmemY3OSs5VEI1ckhXa2Jqdk16dW4x?=
 =?utf-8?B?YkRyOHhHOFJPVDkzNlhxbmFZRzlXYWRuaHFvUHpwcENRZFdtVUtWWkdoaTJZ?=
 =?utf-8?B?QjQ5TEQrMUYxdFNuZE1Ga1kvSjlTRUtibS9mcFE3Rk9raVNqaU1mYW5VWVFG?=
 =?utf-8?B?dFdvc3U1aDBsZmI0cHQzbEpGYVNXa2tybzdmQmcwbEtIUVlFTVBWTkRGMDYr?=
 =?utf-8?B?UVNlcHRWcDlMeWhJaEI0TU5RSnBFR24vbHZyaDVJdlEwT2JGVE5rU0drTktK?=
 =?utf-8?B?aEl3T3RuMnpaQXM3YXFQRVRpWS9oOXRKSThCdzM1clIwamMxaWJleWZzdlVC?=
 =?utf-8?B?di9DWGlIb1VjUENGSVBBdGk2T0UvUVZNaklyZkxDdW0yaWxYU1IzSmR3RUFz?=
 =?utf-8?B?UzliSWdGcWh4UGFNejZtUG5UVFQ1UXdlU1dpRU1yd3p1REU0bS83bHJPb2Z3?=
 =?utf-8?B?N2krejNHN3dUK3kvbjBBTlAybjlMc3VSUlJxVUYxc2YybzNhVU9oOHJJRlY1?=
 =?utf-8?B?WjVDTERaK0Jzd2EvQ2RkZ3g5VTlES01SL3U4MytjL2pjNnFTdmtsdDM2Sjhq?=
 =?utf-8?B?K3M2TE5qM20zbFhUdXhvRDBQbnlRUDM5UkpMWWtVdVpVRG1SeHVpOHJUUXdD?=
 =?utf-8?B?TysvSjhjWXhraThiMFhPbzYzdGswcUUzUElYSEJka2x6NTdPdUpDZXVFczZU?=
 =?utf-8?B?Z2VvcHBNSnJDclJXeU45bFJiKzRmRjhGUGpjT2kxVXVXakFDcjhIYytoQThv?=
 =?utf-8?B?L2o1NERQL0NyeHBjbzJ2cU9ZZVlwM3luRnNBTWxRTkdtcldsTHJJaHZMRjVM?=
 =?utf-8?B?bk9jTUhEQkxWekFvbE11QUsxY1lIWExqVXhsUXkrMVJSRGFMSzFWMVUvLy9z?=
 =?utf-8?B?MlpRMks4cXg3eDA4UE1SU3Q3YnhFMExiY1Y0bXhRYTZVUnRXR1hkK3VFZHls?=
 =?utf-8?B?NlllR0xJWHRSMHNDVjFCNURXazJHUzFJMGZTaTlWN01qd201SlRBd2lSamJS?=
 =?utf-8?B?enZOTHdpd0M2YWtTNEVBNzZaYW4xYW9tbmJSZks3VWsxeHNFZkFQZ2JmSENK?=
 =?utf-8?B?L09Bd1QwN203ZmVVUE93K1hMSStHRHFFeldhaTVZOHRhODZERU1xOUxzMm1M?=
 =?utf-8?Q?ArM2l5XVXbGHpkfvoOA7FUHWymMbd/ZaJRmcsJv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6419af96-dd1d-4c45-d011-08d8ccd1c55b
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 08:07:40.7133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewB0emekJ7Ym5RmD2/vQhKO9RiV5SebZnV6SRVFGU3bSGGUcOKCvX8FJdcvYsp6xOaZPffPrMrp8YVkpTQowQzvBOWJOffDUR7tLuUjcDno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0069
X-Mailman-Approved-At: Tue, 09 Feb 2021 09:39:45 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaSwKCk9uIDIvOS8yMSAzOjU4IFBNLCBKeXJpIFNhcmhhIHdyb3RlOgo+IE9uIDIwMjEt
MDItMDkgNTowOSwgcXVhbnlhbmcud2FuZyB3cm90ZToKPj4gUGluZy4KPj4KPgo+IENvdWxkIHlv
dSByZXNlbmQgdGhlIG9yaWdpbmFsIHBhdGNoIChJIGhhdmUgbm90IHJlY2VpdmVkIGl0KSBzbyBJ
IGNhbiAKPiBlYXNpbHkgdGVzdCBhbmQgbWVyZ2UgaXQ/CgpPSywgSSB3aWxsIHJlc2VuZCBpdC4K
ClRoYW5rcywKClF1YW55YW5nCgo+Cj4gSSdsbCBmaW5kIHNvbWUgdGltZSB0byBkbyBpdCBzb29u
Lgo+Cj4gQmVzdCByZWdhcmRzLAo+IEp5cmkKPgo+PiBPbiAxLzI5LzIxIDM6NTggUE0sIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+Pj4gRHJvcHBlZCB0aGUgQHRpLmNvbSBhZGRyZXNzZXMgYW5kIGFk
ZGVkIHRoZSBuZXcgb25lcy4KPj4+Cj4+PiDCoCBUb21pCj4+Pgo+Pj4gT24gMjkvMDEvMjAyMSAw
Nzo1OCwgcXVhbnlhbmcud2FuZ0B3aW5kcml2ZXIuY29tIHdyb3RlOgo+Pj4+IEZyb206IFF1YW55
YW5nIFdhbmcgPHF1YW55YW5nLndhbmdAd2luZHJpdmVyLmNvbT4KPj4+Pgo+Pj4+IFdoZW4gcnVu
IHhyYW5kciB0byBjaGFuZ2UgcmVzb2x1dGlvbiBvbiBCZWFnbGVib25lIEJsYWNrIGJvYXJkLCBp
dCAKPj4+PiB3aWxsCj4+Pj4gcHJpbnQgdGhlIGVycm9yIGluZm9ybWF0aW9uOgo+Pj4+Cj4+Pj4g
cm9vdEBiZWFnbGVib25lOn4jIHhyYW5kciAtZGlzcGxheSA6MCAtLW91dHB1dCBIRE1JLTEgLS1t
b2RlIDcyMHg0MDAKPj4+PiBbZHJtOmRybV9jcnRjX2NvbW1pdF93YWl0XSAqRVJST1IqIGZsaXBf
ZG9uZSB0aW1lZCBvdXQKPj4+PiBbZHJtOmRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX2RlcGVu
ZGVuY2llc10gKkVSUk9SKiAKPj4+PiBbQ1JUQzozMjp0aWxjZGMgY3J0Y10gY29tbWl0IHdhaXQg
dGltZWQgb3V0Cj4+Pj4gW2RybTpkcm1fY3J0Y19jb21taXRfd2FpdF0gKkVSUk9SKiBmbGlwX2Rv
bmUgdGltZWQgb3V0Cj4+Pj4gW2RybTpkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9kZXBlbmRl
bmNpZXNdICpFUlJPUiogCj4+Pj4gW0NPTk5FQ1RPUjozNDpIRE1JLUEtMV0gY29tbWl0IHdhaXQg
dGltZWQgb3V0Cj4+Pj4gW2RybTpkcm1fY3J0Y19jb21taXRfd2FpdF0gKkVSUk9SKiBmbGlwX2Rv
bmUgdGltZWQgb3V0Cj4+Pj4gW2RybTpkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9kZXBlbmRl
bmNpZXNdICpFUlJPUiogCj4+Pj4gW1BMQU5FOjMxOnBsYW5lLTBdIGNvbW1pdCB3YWl0IHRpbWVk
IG91dAo+Pj4+IHRpbGNkYyA0ODMwZTAwMC5sY2RjOiBhbHJlYWR5IHBlbmRpbmcgcGFnZSBmbGlw
IQo+Pj4+Cj4+Pj4gVGhpcyBpcyBiZWNhdXNlIHRoZXJlIGlzIG9wZXJhdGlvbiBzZXF1ZW5jZSBh
cyBiZWxvdzoKPj4+Pgo+Pj4+IGRybV9hdG9taWNfY29ubmVjdG9yX2NvbW1pdF9kcG1zKG1vZGUg
aXMgRFJNX01PREVfRFBNU19PRkYpOgo+Pj4+IMKgwqDCoMKgIC4uLgo+Pj4+IMKgwqDCoMKgIGRy
bV9hdG9taWNfaGVscGVyX3NldHVwX2NvbW1pdCA8LSAKPj4+PiBpbml0X2NvbXBsZXRpb24oY29t
bWl0X0EtPmZsaXBfZG9uZSkKPj4+PiDCoMKgwqDCoCBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRf
dGFpbAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgdGlsY2RjX2NydGNfYXRvbWljX2Rpc2FibGUKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgIHRpbGNkY19wbGFuZV9hdG9taWNfdXBkYXRlIDwtIGRybV9jcnRj
X3NlbmRfdmJsYW5rX2V2ZW50IAo+Pj4+IGluIHRpbGNkY19jcnRjX2lycQo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaXMgc2tpcHBlZCBzaW5jZSAKPj4+PiB0aWxjZGNfY3J0Yy0+ZW5hYmxlZCBp
cyAwCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB0aWxjZGNfY3J0Y19hdG9taWNfZmx1c2jCoMKgIDwt
IGRybV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50IAo+Pj4+IGlzIHNraXBwZWQgc2luY2UKPj4+PiBj
cnRjLT5zdGF0ZS0+ZXZlbnQgaXMgc2V0IHRvIGJlIE5VTEwgaW4KPj4+PiB0aWxjZGNfcGxhbmVf
YXRvbWljX3VwZGF0ZQo+Pj4+IGRybV9tb2RlX3NldGNydGM6Cj4+Pj4gwqDCoMKgwqAgLi4uCj4+
Pj4gwqDCoMKgwqAgZHJtX2F0b21pY19oZWxwZXJfc2V0dXBfY29tbWl0IDwtIAo+Pj4+IGluaXRf
Y29tcGxldGlvbihjb21taXRfQi0+ZmxpcF9kb25lKQo+Pj4+IMKgwqDCoMKgIGRybV9hdG9taWNf
aGVscGVyX3dhaXRfZm9yX2RlcGVuZGVuY2llcwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgZHJtX2Ny
dGNfY29tbWl0X3dhaXTCoMKgIDwtIHdhaXQgZm9yIGNvbW1pdF9BLT5mbGlwX2RvbmUgCj4+Pj4g
Y29tcGxldGluZwo+Pj4+Cj4+Pj4gSnVzdCBhcyBzaG93biBhYm92ZSwgdGhlIHN0ZXBzIHdoaWNo
IGNvdWxkIGNvbXBsZXRlIAo+Pj4+IGNvbW1pdF9BLT5mbGlwX2RvbmUKPj4+PiBhcmUgYWxsIHNr
aXBwZWQgYW5kIGNvbW1pdF9BLT5mbGlwX2RvbmUgd2lsbCBuZXZlciBiZSBjb21wbGV0ZWQuIAo+
Pj4+IFRoaXMgd2lsbAo+Pj4+IHJlc3VsdCBhIHRpbWUtb3V0IEVSUk9SIHdoZW4gZHJtX2NydGNf
Y29tbWl0X3dhaXQgY2hlY2sgdGhlIAo+Pj4+IGNvbW1pdF9BLT5mbGlwX2RvbmUuCj4+Pj4gU28g
YWRkIGRybV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50IGluIHRpbGNkY19jcnRjX2F0b21pY19kaXNh
YmxlIHRvCj4+Pj4gY29tcGxldGUgY29tbWl0X0EtPmZsaXBfZG9uZS4KPj4+Pgo+Pj4+IEZpeGVz
OiBjYjM0NWRlY2I0ZDIgKCJkcm0vdGlsY2RjOiBVc2Ugc3RhbmRhcmQgCj4+Pj4gZHJtX2F0b21p
Y19oZWxwZXJfY29tbWl0IikKPj4+PiBTaWduZWQtb2ZmLWJ5OiBRdWFueWFuZyBXYW5nIDxxdWFu
eWFuZy53YW5nQHdpbmRyaXZlci5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJt
L3RpbGNkYy90aWxjZGNfY3J0Yy5jIHwgOSArKysrKysrKysKPj4+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3RpbGNkYy90aWxjZGNfY3J0Yy5jIAo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxj
ZGNfY3J0Yy5jCj4+Pj4gaW5kZXggMzAyMTM3MDhmYzk5Li5kOTlhZmQxOWNhMDggMTAwNjQ0Cj4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfY3J0Yy5jCj4+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfY3J0Yy5jCj4+Pj4gQEAgLTUxNSw2ICs1MTUs
MTUgQEAgc3RhdGljIHZvaWQgdGlsY2RjX2NydGNfb2ZmKHN0cnVjdCBkcm1fY3J0YyAKPj4+PiAq
Y3J0YywgYm9vbCBzaHV0ZG93bikKPj4+PiDCoMKgwqDCoMKgwqDCoCBkcm1fY3J0Y192Ymxhbmtf
b2ZmKGNydGMpOwo+Pj4+IMKgICvCoMKgwqAgc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVu
dF9sb2NrKTsKPj4+PiArCj4+Pj4gK8KgwqDCoCBpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50KSB7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGRybV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50KGNydGMsIGNydGMt
PnN0YXRlLT5ldmVudCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNydGMtPnN0YXRlLT5ldmVudCA9
IE5VTEw7Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgc3Bpbl91bmxvY2tfaXJx
KCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwo+Pj4+ICsKPj4+PiDCoMKgwqDCoMKgIHRpbGNkY19j
cnRjX2Rpc2FibGVfaXJxcyhkZXYpOwo+Pj4+IMKgwqDCoMKgwqDCoMKgIHBtX3J1bnRpbWVfcHV0
X3N5bmMoZGV2LT5kZXYpOwo+Pj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
