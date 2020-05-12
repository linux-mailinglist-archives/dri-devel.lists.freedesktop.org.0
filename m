Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B41CF119
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4BF6E04B;
	Tue, 12 May 2020 09:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690059.outbound.protection.outlook.com [40.107.69.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB356E04B;
 Tue, 12 May 2020 09:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYCRdzFVRtopzBVZVZqUjbsclpe/LSbOHopm4OS9gLz2YxdpSQsz57I69Rce1m/lRIsxH3I9dnKz55vpsYSI0FkZq+KKRHOPP7tgyBo8rIvJKv8Ry2HFbrfhsgsePAZrMDXwgdDTsJUpCV6Oq4IJ4ztnpvx4Vo30+d8UeVN9yoT+BvCRproI+xlv7s24mN5uhunDGuJUn9j2WrPLQn60IUbv7tcgsSa6rhwAGQnVLdQGyVWYfn/921gMBn1lZklUm5gFWVQ6YtybnhjM7fo+aHGPQdA7Q51/sGdSaJswgweeYfMgjnQGkCCNE98Ax4l1eJx7PMfqhqp1XwhVhMYk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRJzBspbsqWqd8tmxDuoxdpfF3o2o2eW7g/oHWMwmB0=;
 b=YV/eJVcY+Y8udUJsATIi0oLC+uW9C1DK8eVX8sTjW3E6KZ5ITw0wQilbXIXKOfWIZRMg6A1+uCpzcaGf6u6e1RfTid6cKyfumXUQxATp/1eAQWAmfivqb6BVUOR5I+Qrzq4bDJLk326ojH30B6fZBCy/Gz4sn51/zWdnDdjNvnZuHVL3/T3MhWZW382NTWoODkazPT99z6AnAEFrnJ5KAiUrpsR2EKqmZeUg/WOkFsoNgYfj6p/jd6mEXEZksSuFI2HAbvIztdRWKhNMddAk+0h5d4rWeCiE+rK1IQzBsJff4gnvpNek6DdJHte8CTwEYWIPVeTch8GODZXgYAB/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRJzBspbsqWqd8tmxDuoxdpfF3o2o2eW7g/oHWMwmB0=;
 b=Rpfj5jY2LqWL1Ng7UA9NxNt6pEb55tFXCVeRb8zq2f0WKzUM4d3BfJy04ERkNDWdfD0mZVE5lBQZz52Te1Ahp4iD/e5O1VGgbobDmA4SstdC6pe5Gv54LXi4Hi7LWpCxTkDpNvccc2gVhscybFbmJJWXG1EDpHwORbnH24cIkyM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3819.namprd12.prod.outlook.com (2603:10b6:5:1c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Tue, 12 May
 2020 09:08:29 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 09:08:29 +0000
Subject: Re: [RFC 01/17] dma-fence: add might_sleep annotation to _wait()
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
 <20200512085944.222637-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0b1c65ec-adc2-9f02-da68-c398cf7ce80b@amd.com>
Date: Tue, 12 May 2020 11:08:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200512085944.222637-2-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 09:08:27 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1704ee46-473a-47b4-b2ad-08d7f654096e
X-MS-TrafficTypeDiagnostic: DM6PR12MB3819:
X-Microsoft-Antispam-PRVS: <DM6PR12MB38198441851821F3C5B60FC283BE0@DM6PR12MB3819.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 81/+AqtiigMWRAnCIpd6dteXZpI7YoI7Ke0pbxm1T6qBeMbO+/7RfckJSVJOtJ4EgNUvUjraeNQyawECIkZHS8EgFV0UNvscfN/hjx7alry8Z1fb+tKJh1TmlUetgwwUPfszgY96ccbGDiRJiY0PhfAYcmCZjA6hCf1JUfQZV4EbO3k/s7JAMW6j3/8wDOwtUqC3DsJxAEZhBK/kJmXSlGvUmtODVzfoFQgwZWvcMmU9NbSu591YqKqToR25aXVvWC8Gkwiis8jDjtbKfx8ST4NFhX4Uu56tfqHVSjGaU8p4ILWbK5Jttg09T0TWm75cmkkao2fke8weQJxCxq3qY2FEwRQhhmHpJkEKg/cVbA8T+rSzG8swLFkpXt1BHt4M/QvSYfbk1nNSFTVZOvC5nGd+l2yvY4wYhWOQYjKGssfAqTC3pPeMGGtpO40lzLHvWydCfHuXN2jcmGSV0cXt1meN5ptRISR4+GnvcP4cmiZFUN2ys7Qemw7WsPdm10TVi03s14xBPwrsvLrWj8F42BoRSDliA1r5jqdbsr7i/WJvBuyISRw0/hJkj4nd3Psu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(33430700001)(186003)(2616005)(8936002)(16526019)(52116002)(31696002)(6666004)(31686004)(7416002)(36756003)(5660300002)(6486002)(8676002)(33440700001)(2906002)(66556008)(4326008)(66476007)(316002)(66946007)(110136005)(478600001)(86362001)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: q1VqxBPinRKuXQgNIE269b5tRj/s59Ll8LnM+XOhHo8x8oyvjRogl+zzEns6GTz52it/Q/6IdJ2WEidVPWaomP46Ker1fjZk1vGG4jm574sotEi86jVVjUN2RfYPI6lAi4GcLOI+kdQdF4HwSfF6aL3oja8kzmP42+xiBvCbfRZJeuR1VrvCzrSD1iJIsrneuQu2H8BLDTVKWYTnlxQQLdVpOeOzgd73TLR/Gf+KNEJ1cxtl1x9rZX9MudvP1NgjOLDXxl34Tvot5XVhBFL5xKsmYDDLY4cZKraQ645cQmoFDXfO47cKTKXGKtFWqf6Tt4cq4BbLhiBe5sJY1IGzyIgpv7nc2d6kyAxI505Vran1DlqFbpXPl6BwJOw1qpmudzP4yMZ5NWjs9/eDeuh5D991v9X/t6N+4T8hU5LUL8Deyd06V+dRONShG2/VgJZIWwb0su1E2/orP6Rbj/yMHqpyDm0kGK1PCdsMZBKIHAydY93zbEtpzkuAJC+coYYyiSd6UxlVcgPLrmo41xkayu46Xw5T7PfWc1o0OnYEfyuzwe8TGo3cJVUDWFGJmqCJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1704ee46-473a-47b4-b2ad-08d7f654096e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 09:08:29.3474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gn19H5yIa8/K0WXEQ4q0cW5Kf4/ytJd2Af+H83RS7dznJbeO2pi2ru9ADmAoetGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3819
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDUuMjAgdW0gMTA6NTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IEJ1dCBvbmx5IGZv
ciBub24temVybyB0aW1lb3V0LCB0byBhdm9pZCBmYWxzZSBwb3NpdGl2ZXMuCj4KPiBPbmUgcXVl
c3Rpb24gaGVyZSBpcyB3aGV0aGVyIHRoZSBtaWdodF9zbGVlcCBzaG91bGQgYmUgdW5jb25kaXRp
b25hbCwKPiBvciBvbmx5IGZvciByZWFsIHRpbWVvdXRzLiBJJ20gbm90IHN1cmUsIHNvIHdlbnQg
d2l0aCB0aGUgbW9yZQo+IGRlZmVuc2l2ZSBvcHRpb24uIEJ1dCBpbiB0aGUgaW50ZXJlc3Qgb2Yg
bG9ja2luZyBkb3duIHRoZSBjcm9zcy1kcml2ZXIKPiBkbWFfZmVuY2UgcnVsZXMgd2UgbWlnaHQg
d2FudCB0byBiZSBtb3JlIGFnZ3Jlc3NpdmUuCj4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJu
ZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IENjOiBsaW51eC1y
ZG1hQHZnZXIua2VybmVsLm9yZwo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMgfCAzICsrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
ZmVuY2UuYwo+IGluZGV4IDA1MmE0MWUyNDUxYy4uNjgwMjEyNTM0OWZiIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYwo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
ZmVuY2UuYwo+IEBAIC0yMDgsNiArMjA4LDkgQEAgZG1hX2ZlbmNlX3dhaXRfdGltZW91dChzdHJ1
Y3QgZG1hX2ZlbmNlICpmZW5jZSwgYm9vbCBpbnRyLCBzaWduZWQgbG9uZyB0aW1lb3V0KQo+ICAg
CWlmIChXQVJOX09OKHRpbWVvdXQgPCAwKSkKPiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4gICAKPiAr
CWlmICh0aW1lb3V0ID4gMCkKPiArCQltaWdodF9zbGVlcCgpOwo+ICsKCkkgd291bGQgcmF0aGVy
IGxpa2UgdG8gc2VlIG1pZ2h0X3NsZWVwKCkgY2FsbGVkIGhlcmUgYWxsIHRoZSB0aW1lIGV2ZW4g
CndpdGggdGltZW91dD09MC4KCklJUkMgSSByZW1vdmVkIHRoZSBjb2RlIGluIFRUTSBhYnVzaW5n
IHRoaXMgaW4gYXRvbWljIGNvbnRleHQgcXVpdGUgYSAKd2hpbGUgYWdvLCBidXQgY291bGQgYmUg
dGhhdCBzb21lIGxlYWtlZCBpbiBhZ2FpbiBvciBpdCBpcyBjYWxsZWQgaW4gCmF0b21pYyBjb250
ZXh0IGVsc2V3aGVyZSBhcyB3ZWxsLgoKQ2hyaXN0aWFuLgoKPiAgIAl0cmFjZV9kbWFfZmVuY2Vf
d2FpdF9zdGFydChmZW5jZSk7Cj4gICAJaWYgKGZlbmNlLT5vcHMtPndhaXQpCj4gICAJCXJldCA9
IGZlbmNlLT5vcHMtPndhaXQoZmVuY2UsIGludHIsIHRpbWVvdXQpOwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
