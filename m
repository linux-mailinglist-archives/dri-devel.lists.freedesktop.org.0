Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC011928B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20D36E934;
	Tue, 10 Dec 2019 20:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1616E934;
 Tue, 10 Dec 2019 20:56:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXjLAZSzPpu/SPyvxlL8wviWHX4DuoPjSfckzl5XjWK41U6WJhjS9mZT3Qn5PYAq32+B0yDZ8SIHo06XduTx5qEGb2yGxvzk0JCuEHywNCD2Rg8os0Z6nu9//OEZ8MseKktZq1iFOq6sMaFiM2laEx5mFUpTeqX9um9smVllWrqBoEtdoytjIrqrrm4goEHVqzcXEz1vByG6LZssC4CeBe/9xCfu+JSlKGR91xuU6Mu6ouIIlD1iJAyUW9XWxMSkhabVCwpYoh0F19SbIJLutXhKEEFfifmWRbqHc0axX9DulKWjK5MpGCAU5ZbcO+uyKEYuEL+a5ImfyDEkuBMXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9J9/GjwHWXVOk78M7BOCW77BqHoMYk4rboFHyrAYiWs=;
 b=DD+RN5Dnv2JzHTPpCwlHiI/UsNGi1B0M9D/ZNrxXZqUWRFfLZythSHvCke3xIOZ3p516B3JxqqZAZcJf9q25Jnr4T3zrvkGNzCLOnTp75+ywXdhiyhc9rD9qcgXc/SnH0JcnWVk2o8QehQZAWgTOdyBZx8eJsAXjtT1a5F/yyiFSzXXVvOGCugutIWDDXrhHvM4CNmxM+1qFMeYdsyzO3wFUQia6icq4iJ306UoaZDtt7SeMtps7YD2R39J05MUy/nvosXJ3uL9ycGzDwF/WTqSACOp4w6kG6RsghylHAaMrN15/tP6H9dsN4F9EuZvyr57a3xUSltnkgfIOjM0KQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9J9/GjwHWXVOk78M7BOCW77BqHoMYk4rboFHyrAYiWs=;
 b=nIlvCVQGMHOqbKsLgNb17p8CFYxnwMTki9HBu73Kb+tXtwNedyoFFqJgc0og4UuW48DRKoK6x17Sp2FZBbExmsi9ZMldPznh/OpN2nka1bMjowJMcfdk8uWtk9j7116/661hl1P0T+DImivAHbFjsfeOle1mwpqlkMk46m/xaeY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3559.namprd12.prod.outlook.com (20.178.53.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.18; Tue, 10 Dec 2019 20:56:02 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::81f8:ed8a:e30e:adb0]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::81f8:ed8a:e30e:adb0%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 20:56:01 +0000
Subject: Re: [PATCH] drm/amd/display: fix undefined struct member reference
To: "Liu, Zhan" <Zhan.Liu@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20191210203101.2663341-1-arnd@arndb.de>
 <DM6PR12MB34665D3A13E23D8AA7E2E7919E5B0@DM6PR12MB3466.namprd12.prod.outlook.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <b552de20-dca5-b5d1-e5e8-4c09bc3fdcb5@amd.com>
Date: Tue, 10 Dec 2019 15:55:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <DM6PR12MB34665D3A13E23D8AA7E2E7919E5B0@DM6PR12MB3466.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::19) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c54fd4f-af00-473a-31bc-08d77db35d4b
X-MS-TrafficTypeDiagnostic: BYAPR12MB3559:|BYAPR12MB3559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3559360A046387881D113FB0EC5B0@BYAPR12MB3559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 02475B2A01
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(189003)(199004)(13464003)(4001150100001)(81156014)(66556008)(81166006)(36756003)(8676002)(5660300002)(26005)(186003)(52116002)(6666004)(31686004)(4326008)(2616005)(316002)(53546011)(86362001)(31696002)(966005)(66946007)(6506007)(8936002)(110136005)(66476007)(2906002)(6486002)(6512007)(54906003)(478600001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3559;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHRgsuGIqCsqi7UiyBzkPD9HwozJ+QYHAnw0lKVG3xfqj8cabosKG0E8k4KiQ2iDnW9zbkzTaDnfq+GNvmK10K9QHm9d5tr95UuzJq/1rqPNczcZqLLyr78XQWE/WNGxfOM+7lRx4sjGwIMDdLvYXFW4lnzcFKxryCGgPtqyPIDKjVAzW3etCcITs3sqTe2XLt5RCi4kdFA9qkFQe7cG9uSrV+SumZ0nB0qBrhlB3ls+8uxkXJFO2RKpBcb49BDwpMzYHY+RCQRyTSB2sF58XFfaIiF7317GdK6VuVvx4C8r35pwfdjO2Wj+1f1wWIFTYzIteAHYmFsBAc2LjIew9wKmLn/UuInIe/CdJdgV9WU8ESuzGgFaJOUTB+jrdJBSSrpF2Ue1ntpRtCK0Z7xqrWx06Y/QnG5LJ8OvHz7Tf6Qe+60nGkLCcv7FaAh+5tnEDLlDl4J+wGUuxicbgiTzCkWQKkU81STPul5yV4YCh8gbTcNCWL8KUhyxkyb8YFWANWL4HkOyqn74uHzJ4f6hSPwubVKdBSl+TsPS2r+fYpl2qmuxOvTdwB/Yupk61YTp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c54fd4f-af00-473a-31bc-08d77db35d4b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 20:56:01.6819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxm+ZFsaAGyRPaI5IYYFxGqV+0nLzBH8KNDKP/TtLETdaaw9TaHqwLXyInlccetoVwcxiGppbXt7JIOIwSjR2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3559
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
Cc: "Liu, Charlene" <Charlene.Liu@amd.com>, "Yang, Eric" <Eric.Yang2@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Cornij,
 Nikola" <Nikola.Cornij@amd.com>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lei,
 Jun" <Jun.Lei@amd.com>, "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMi0xMCAzOjU0IHAubS4sIExpdSwgWmhhbiB3cm90ZToKPiAKPiAKPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4KPj4gU2VudDogMjAxOS9EZWNlbWJlci8xMCwgVHVlc2RheSAzOjMxIFBNCj4+IFRvOiBXZW50
bGFuZCwgSGFycnkgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+OyBMaSwgU3VuIHBlbmcgKExlbykK
Pj4gPFN1bnBlbmcuTGlAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlcgo+PiA8QWxleGFuZGVy
LkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuCj4+IDxDaHJpc3RpYW4uS29lbmln
QGFtZC5jb20+OyBaaG91LCBEYXZpZChDaHVuTWluZykKPj4gPERhdmlkMS5aaG91QGFtZC5jb20+
OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBEYW5pZWwgVmV0dGVyCj4+IDxkYW5p
ZWxAZmZ3bGwuY2g+OyBMaXUsIFpoYW4gPFpoYW4uTGl1QGFtZC5jb20+Cj4+IENjOiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPjsgTGFrdHl1c2hraW4sIERteXRybwo+PiA8RG15dHJvLkxh
a3R5dXNoa2luQGFtZC5jb20+OyBMYWtoYSwgQmhhd2FucHJlZXQKPj4gPEJoYXdhbnByZWV0Lkxh
a2hhQGFtZC5jb20+OyBMZWksIEp1biA8SnVuLkxlaUBhbWQuY29tPjsgTGl1LAo+PiBDaGFybGVu
ZSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+OyBZYW5nLCBFcmljIDxFcmljLllhbmcyQGFtZC5jb20+
Owo+PiBDb3JuaWosIE5pa29sYSA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPjsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL2Rp
c3BsYXk6IGZpeCB1bmRlZmluZWQgc3RydWN0IG1lbWJlciByZWZlcmVuY2UKPj4KPj4gQW4gaW5p
dGlhbGl6YXRpb24gd2FzIGFkZGVkIGZvciB0d28gb3B0aW9uYWwgc3RydWN0IG1lbWJlcnMuICBP
bmUgb2YgdGhlc2UgaXMKPj4gYWx3YXlzIHByZXNlbnQgaW4gdGhlIGRjbjIwX3Jlc291cmNlIGZp
bGUsIGJ1dCB0aGUgb3RoZXIgb25lIGRlcGVuZHMgb24KPj4gQ09ORklHX0RSTV9BTURfRENfRFND
X1NVUFBPUlQgYW5kIGNhdXNlcyBhIGJ1aWxkIGZhaWx1cmUgaWYgdGhhdCBpcwo+PiBtaXNzaW5n
Ogo+Pgo+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX3Jlc291cmNlLmM6OTI2OjEKPj4gNDogZXJyb3I6IGV4Y2VzcyBlbGVtZW50cyBpbiBzdHJ1
Y3QgaW5pdGlhbGl6ZXIgWy1XZXJyb3JdCj4+ICAgICAubnVtX2RzYyA9IDUsCj4+Cj4+IEFkZCBh
bm90aGVyICNpZmRlZiBhcm91bmQgdGhlIGFzc2lnbm1lbnQuCj4+Cj4+IEZpeGVzOiBjM2QwM2M1
YTE5NmYgKCJkcm0vYW1kL2Rpc3BsYXk6IEluY2x1ZGUgbnVtX3ZtaWQgYW5kIG51bV9kc2MKPj4g
d2l0aGluIE5WMTQncyByZXNvdXJjZSBjYXBzIikKPj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBUaGFuayB5b3UgZm9yIGNhdGNoaW5nIHRoYXQg8J+Y
iiBPbiBteSBzaWRlIEkga2VwdCB0aGF0IGZsYWcgZW5hYmxlZCBhbGwgdGhlIHRpbWUsIHNvIEkg
ZGlkbid0IHJlYWxpemUgdGhlcmUgd2FzIGEgd2FybmluZyBoaWRkZW4gaGVyZS4KPiAKPiBSZXZp
ZXdlZC1ieTogWmhhbiBMaXUgPHpoYW4ubGl1QGFtZC5jb20+CgpXaGF0IHRyZWUgaXMgdGhpcyBy
ZXBvcnRlZCBvbj8KCldlIGRyb3BwZWQgdGhpcyBmbGFnIHdoZW5ldmVyIGJ1aWxkaW5nIERDTi4g
U291bmRzIGxpa2Ugd2UncmUgbWlzc2luZyBhIApwYXRjaCBpZiB5b3UncmUgZ2V0dGluZyB0aGlz
LgoKU28gdGhpcyBpcyBhIE5BSyBmcm9tIG1lIGZvciBnb2luZyBpbnRvIGFtZC1zdGFnaW5nLWRy
bS1uZXh0IGF0IGxlYXN0LgoKTmljaG9sYXMgS2F6bGF1c2thcwoKPiAKPj4gLS0tCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAyICsr
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKPj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwo+
PiBpbmRleCBmYWFiODlkMWU2OTQuLmZkZjkzZTZlZGY0MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKPj4g
QEAgLTkyMyw3ICs5MjMsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlX2NhcHMgcmVz
X2NhcF9udjE0ID0gewo+PiAgIAkJLm51bV9kd2IgPSAxLAo+PiAgIAkJLm51bV9kZGMgPSA1LAo+
PiAgIAkJLm51bV92bWlkID0gMTYsCj4+ICsjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NV
UFBPUlQKPj4gICAJCS5udW1fZHNjID0gNSwKPj4gKyNlbmRpZgo+PiAgIH07Cj4+Cj4+ICAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkY19kZWJ1Z19vcHRpb25zIGRlYnVnX2RlZmF1bHRzX2RydiA9IHsK
Pj4gLS0KPj4gMi4yMC4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
