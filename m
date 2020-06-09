Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 147D21F34A8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63296E9F0;
	Tue,  9 Jun 2020 07:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782A26E1A4;
 Tue,  9 Jun 2020 07:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HH/kismUN0rNI+gZ96f72Lh9KCa/ztpxko8SrEd6fTkvL1FZLNWNHtib9VzjoiMiyq//Vguoutql53japt7lJzR5BK41lAx/YZAIz7rRFset0rwurKguVWf2oipzQE4WSmBPZEMh7A5glDr2OwqeuvPFVhGlsU17Dk8z0+OlwV93y9EEFaRNcdjsr2GhfCGd0h/3ORQuYDjpzU7XktUpuizLf+gGQc43R8jq0IeRLewQhN7lq/OMx79/O1V8KvMQ6fbVJpQHyCloPQVQ/hKjkQ7+dyFYrJJ1BYr3cvi9osIdRM9U4phhF+n9VN2tScOGvjf89URofDw9GCs8K2LwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=em9THMhF6mjPLVCxrw6ZqrlTb1CyEQRHkm5LePQa4qM=;
 b=Wp4pNXCGQvhMBqPsNDMmWumiJB8xHPdsxI+XYgj5zpu1W/a/0dup3l5K9nDnUxlsBxl4vLDbit94/WNT94jCJlCst4JKUj/WRV13+/XlQv+BjFmLgvFJcRc6bdeFMO5PhWIBbyGzdYLB8zE6P/K4IbcC9ZbnVsPRw21mbwx3ot0/4y9X2KNq4WzrMhTnXen2WIqHOx7Mkfrdng6nlCo5OkzcjBrN58VzK6BWdvkV+mji4NIrD0K/kZedGOhmH/0c8j4A1Ew0iFCXkW0Ombq2oFoYZQda/mTml12F3aEdXswKMg013SeodxzBEl2vdrbxtUpRYPqm6N/jQtHfOdDAJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=em9THMhF6mjPLVCxrw6ZqrlTb1CyEQRHkm5LePQa4qM=;
 b=mGxHRY82fAMWgAh3MN5FwdmMh9FudPz6oH5u4TN38ntaiFxKqoqLedJI1v662s+mjv8+bNOj3SqtHVG3Ka8q0EYjIYgFf/1X3x1KQOCwti0Nz1R/5RRVbu3+laiWt5LqJID/YBk45aSe0Nxn/YoZ8X2Y/IeG1VYgW4IJ8Q34X+o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2730.namprd12.prod.outlook.com (2603:10b6:5:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 07:10:36 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3088.018; Tue, 9 Jun 2020
 07:10:36 +0000
Subject: Re: [PATCH v5 06/13] drm/amd: Gate i2c transaction logs on
 drm_debug_syslog
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
References: <20200608210505.48519-1-sean@poorly.run>
 <20200608210505.48519-7-sean@poorly.run>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <40f48e4d-b984-7c9f-5156-f3b6eea3a3a7@amd.com>
Date: Tue, 9 Jun 2020 09:10:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200608210505.48519-7-sean@poorly.run>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0111.eurprd05.prod.outlook.com
 (2603:10a6:207:2::13) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0111.eurprd05.prod.outlook.com (2603:10a6:207:2::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.19 via Frontend Transport; Tue, 9 Jun 2020 07:10:33 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94d62203-18f1-46bc-b0f8-08d80c4434f8
X-MS-TrafficTypeDiagnostic: DM6PR12MB2730:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB27305FD33BC9958BAA03671183820@DM6PR12MB2730.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9ZxTu0I+paSgdvj9MCTBH0Yca9+YidfXBrVLK806nAoRWA5vueYX64W1VCnkgJWKC69kuFkx/H8mMDhINMFMfSsDWfPmqoQUAoob1dPLF5VNDTUn0IMCtd78PspDhaqIKVz3Tk+oADZyBeSheWBqjdVqEix0sFXmxvwqq9GOkMlG5z0iuR7b+JdPIrX6rFWzx8L5d9OujFn8FPUUH39mFlsRN+SL4kJ+Ma0r9CiG8u9+4aisZi6BUSQHpgWiucSxItYQheKW0s3gKAexL5r1rwj5f9+VRGsYA7NH5RRflvff80TSSCp+DOhSmlBzK0IVj3Cj/6mSXhCSTBkDE5YR5B5gskK4wtqCp7Nt48PfXlSYCYwsoTHmeignbTSCIk+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(6486002)(5660300002)(66476007)(16526019)(4326008)(66556008)(66946007)(186003)(83380400001)(31686004)(86362001)(6666004)(31696002)(36756003)(7416002)(2906002)(54906003)(2616005)(8936002)(8676002)(478600001)(316002)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ekLnx86FRTaOnpXv5uwb1xpvnXj6wowcRiUD+oMRm1fxponrrBQN/e9dP6De/M9EiItQIoMGj7ZQFqEl1ZOUmpKwCWMxtC0ZVUBlwtn6eHUpkEHH3TlXOW06Bs6Ul1nPIIUx441F+bfL0QaRE8s3Sp5pO5THZPcOo8JywfAX0YUFAnVtc6DZJJjvmjj+gzcBU9m5lR9N/WO7eiESVTB/HeID8XcLnSYweMuCgESOcJXuo91wvhTn28yuI36PfNKGaTw2i169dbakhz144sJKASOSFpMLc86e7Wj9KsyiWIdNgDWfMPnFokP+eo+NPcWINzsjn7J341u1h3pfpyiwnxf8lKOXy6jd0lQIu14LOW+EuhY1dGf4fYcwneMh9llUNGAX9dE2KOrQxfC5dZjguZ+DAHGedz990jWwb31luprDZDqy3R/ezIzROl8s6bJ6EjF5/m2mwTGxPJr91TXJ4UOMy7X9Y3j0gjUx3/qrV7/hFPkFaMTDHiVrVjuxFm+c3/FZbECj83K9+nBqGwxMQtTB98GspBNyZ5ASpjOzIpSPFIej9Vlc1npVqb2FnkOs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d62203-18f1-46bc-b0f8-08d80c4434f8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 07:10:36.2024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyQrYYqqYpAm2eFPpaio9XHmn1YNwz5544XjOprex1GeOahCABtjIJW/Va26Ee5V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2730
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, amd-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDYuMjAgdW0gMjM6MDQgc2NocmllYiBTZWFuIFBhdWw6Cj4gRnJvbTogU2VhbiBQYXVs
IDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4KPiBTaW5jZSB0aGUgbG9ncyBwcm90ZWN0ZWQgYnkg
dGhlc2UgY2hlY2tzIHNwZWNpZmljYWxseSB0YXJnZXQgc3lzbG9nLAo+IHVzZSB0aGUgbmV3IGRy
bV9kZWJ1Z19zeXNsb2dfZW5hYmxlZCgpIGNhbGwgdG8gYXZvaWQgdHJpZ2dlcmluZwo+IHRoZXNl
IHByaW50cyB3aGVuIG9ubHkgdHJhY2UgaXMgZW5hYmxlZC4KCk1obSwgb2YgaGFuZCB0aGF0IGRv
ZXNuJ3QgbG9va3MgbGlrZSBzb21ldGhpbmcgd2hpY2ggYmVsb25ncyBpbnRvIHRoZSAKc3lzbG9n
IGluIHRoZSBmaXJzdCBwbGFjZS4gTWF5YmUgY29udmVydCBpdCBpbnRvIGEgdHJhY2UgcG9pbnQg
aW5zdGVhZD8KCj4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVt
Lm9yZz4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+IGVpdGhlciB3YXkuCgo+Cj4gQ2hhbmdlcyBpbiB2NToKPiAtQWRkZWQgdG8gdGhlIHNldAo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jIHwgNCAr
Ky0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYwo+IGluZGV4IDli
ZmZiYWIzNTA0MS4uOWJjNmJhZGRkMzAyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NtdV92MTFfMF9pMmMuYwo+IEBAIC0yMzMsNyArMjMzLDcgQEAgc3RhdGljIHVpbnQzMl90
IHNtdV92MTFfMF9pMmNfdHJhbnNtaXQoc3RydWN0IGkyY19hZGFwdGVyICpjb250cm9sLAo+ICAg
CURSTV9ERUJVR19EUklWRVIoIkkyQ19UcmFuc21pdCgpLCBhZGRyZXNzID0gJXgsIGJ5dGVzID0g
JWQgLCBkYXRhOiAiLAo+ICAgCQkgKHVpbnQxNl90KWFkZHJlc3MsIG51bWJ5dGVzKTsKPiAgIAo+
IC0JaWYgKGRybV9kZWJ1Z19lbmFibGVkKERSTV9VVF9EUklWRVIpKSB7Cj4gKwlpZiAoZHJtX2Rl
YnVnX3N5c2xvZ19lbmFibGVkKERSTV9VVF9EUklWRVIpKSB7Cj4gICAJCXByaW50X2hleF9kdW1w
KEtFUk5fSU5GTywgImRhdGE6ICIsIERVTVBfUFJFRklYX05PTkUsCj4gICAJCQkgICAgICAgMTYs
IDEsIGRhdGEsIG51bWJ5dGVzLCBmYWxzZSk7Cj4gICAJfQo+IEBAIC0zODcsNyArMzg3LDcgQEAg
c3RhdGljIHVpbnQzMl90IHNtdV92MTFfMF9pMmNfcmVjZWl2ZShzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmNvbnRyb2wsCj4gICAJRFJNX0RFQlVHX0RSSVZFUigiSTJDX1JlY2VpdmUoKSwgYWRkcmVzcyA9
ICV4LCBieXRlcyA9ICVkLCBkYXRhIDoiLAo+ICAgCQkgICh1aW50MTZfdClhZGRyZXNzLCBieXRl
c19yZWNlaXZlZCk7Cj4gICAKPiAtCWlmIChkcm1fZGVidWdfZW5hYmxlZChEUk1fVVRfRFJJVkVS
KSkgewo+ICsJaWYgKGRybV9kZWJ1Z19zeXNsb2dfZW5hYmxlZChEUk1fVVRfRFJJVkVSKSkgewo+
ICAgCQlwcmludF9oZXhfZHVtcChLRVJOX0lORk8sICJkYXRhOiAiLCBEVU1QX1BSRUZJWF9OT05F
LAo+ICAgCQkJICAgICAgIDE2LCAxLCBkYXRhLCBieXRlc19yZWNlaXZlZCwgZmFsc2UpOwo+ICAg
CX0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
