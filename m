Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA1B103C76
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403D66E5D2;
	Wed, 20 Nov 2019 13:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730088.outbound.protection.outlook.com [40.107.73.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA4C6E5D2;
 Wed, 20 Nov 2019 13:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnCqDfsATu/GVrT5NVxKOFHhBNPgXfGPDLVrHrPwzNgteRFUAt63qYpuKmyMkgW4PX2cDRuww3kvLIGio6Szt9LTZQpARu98WBnxSogbwr09zHc9ntAIRV8sjLvjhCixcPL2tZ4TrKo3LEpDwerPoPEZIQrc1ZZCvf2HoldmuJ/CuhG2VZOla4V6msr6Gd/nqE92C0PL4IFOCfnBLTAdmBtr5OZyaTfocNFSLWIuX8cSq7GPwl5hKCD9YK0+p6TJL8MogBZYWai3V7SbTweL4WNrMZNaoZya5rqvu5fNON3HBqQIQE9tY/qjoa6x8JxrzE5Je6+53ih1mtHBDIij3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6KwX2g2ggMVgXKujW2f3BG37trpSSn/gLZJ+aTbZic=;
 b=SmUHLiH78w+ZFejWGQF23aDFPD5H7LZxWbhOl+6uNS1bDBmaA+XN8HDgy+9OOK14k03oBim92aMcyfWadHhB24G7soD9B8O6Fq+P0jbnBYnL+NPFSRnjNCBQnVVVVe3RGiX/9XOlD/wzDaa3Uod03sCvx1xeT6Gf6B5i+YELLZzKnTGVXOlVGiOepLvrRCiaps94zFkxVN7cQeiGbWlGi6SxK4Yot5tvC5cnJc31U3kci2zBc4mcmWHr7bncX+FcP1KqjJZeYXHAUSGchkdKBSFT52MkbCfEmiaEUIsBjQJHM6Z9MyQkpuJ7SxWpNA7fN3/MF/ZoTzEddabSbcyaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB3240.namprd12.prod.outlook.com (20.179.93.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Wed, 20 Nov 2019 13:44:37 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9%6]) with mapi id 15.20.2474.018; Wed, 20 Nov 2019
 13:44:37 +0000
Subject: Re: [PATCH] drm/dsc: Return unsigned long on compute offset
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20191119144526.31797-1-mikita.lipski@amd.com>
 <20191119145649.GZ1208@intel.com>
 <f7b705a8-9d6a-1db3-e261-a80aca57454a@amd.com>
 <BL0PR12MB24039F7D8CC95CCCC10C3103EE4C0@BL0PR12MB2403.namprd12.prod.outlook.com>
 <20191119171132.GB1208@intel.com>
 <2a61d60c-98f9-a5a2-6e7b-dc94df3fc510@amd.com>
 <362986e6-e5d4-f2d5-12bd-feb0acc06546@amd.com>
 <20191120101716.GC1208@intel.com>
From: Mikita Lipski <mlipski@amd.com>
Organization: AMD
Message-ID: <9a38b2bf-747e-e62e-3edf-35d2b8ac9a0a@amd.com>
Date: Wed, 20 Nov 2019 08:44:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191120101716.GC1208@intel.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::23) To BYAPR12MB3013.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::27)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2f8b7c1a-15cb-44b4-71ed-08d76dbfc8c6
X-MS-TrafficTypeDiagnostic: BYAPR12MB3240:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3240B480AA5F5D11DC727DD4E44F0@BYAPR12MB3240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 02272225C5
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(199004)(189003)(13464003)(446003)(11346002)(478600001)(66574012)(26005)(186003)(53546011)(486006)(386003)(6506007)(5660300002)(36756003)(6486002)(6306002)(476003)(6916009)(2486003)(36916002)(966005)(66476007)(52116002)(2616005)(14454004)(6436002)(66946007)(7736002)(76176011)(50466002)(31696002)(66556008)(23676004)(2870700001)(47776003)(316002)(25786009)(3846002)(6512007)(2906002)(31686004)(14444005)(305945005)(66066001)(99286004)(65956001)(6116002)(65806001)(6246003)(81166006)(81156014)(8936002)(8676002)(229853002)(4326008)(54906003)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3240;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uu4gvxzM1jYaZlJ8VMX3vfQo+Gd5cDyF8wrBqZ00XnLf8bCL63kX4Db3fVapxV0ewWvKrTWaMup1yxKFzN7WRkMcuHaK0winHU5cOMRrW9L8dBZbPPtBO/dKSEuK0MPthr8xxSE/V09ZShxgOTCpXrAbBnJ7nMutuWJnrIMBJJkvjWR2Pwn9qwwSeGdJbT+dmBV+rm0bHgi0UW4CR3FKCVIbzzxmwfo3JjIfZssaCXJQysyk5B1u9HHsw3t6gP7fPSTuxeo7I2VjDJYYfhnYHI6K98EC9as7QK16NydVElJhjDNBlA4mqwv2skb795tOckApVWOg4ntL5/+i6LY/oehvADLAFmObJ4nBm6pvAMfuWnjdjOP/Xon7Ntk8CTyOkjMiiES3eN+MlYwkpT8zbvE7Kf++mvSNo4DRO4ITm17GjJcZ4aBDTtfINj1ZX5vJrc4b/xRL0xOivOWXCZjv8nWlWOQj17DZaaKvpTPw7Bs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8b7c1a-15cb-44b4-71ed-08d76dbfc8c6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2019 13:44:37.3532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zM1LU30X4W+swrRSoaawwc4QsirTtLQm1QSwFth9gT5Eu5kXrtkk+DFebDu2hsU1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3240
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6KwX2g2ggMVgXKujW2f3BG37trpSSn/gLZJ+aTbZic=;
 b=vXGEQCDXRqWetS58bIiEbKEDc79C4y5c6ZrN0pnNAMneg4S2DOBhIVOO8juLSE1AKPFnIydxC6oKe98Zz0EHmv9ukpydGQSWBw5cfVAHZ9EO9TWRWBs5snayyQw127lZrIE50WN6a2fgnV+zFAKRdWKSzL1idOkjIUdQLgGa1RY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Lipski, Mikita" <Mikita.Lipski@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Cornij,
 Nikola" <Nikola.Cornij@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMC8xMS8yMDE5IDA1OjE3LCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gVHVlLCBO
b3YgMTksIDIwMTkgYXQgMDQ6MTE6NDNQTSAtMDUwMCwgTWlraXRhIExpcHNraSB3cm90ZToKPj4K
Pj4KPj4gT24gMTkvMTEvMjAxOSAxNjowOSwgTWlraXRhIExpcHNraSB3cm90ZToKPj4+Cj4+Pgo+
Pj4gT24gMTkvMTEvMjAxOSAxMjoxMSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+Pj4+IE9uIFR1
ZSwgTm92IDE5LCAyMDE5IGF0IDA0OjU5OjQwUE0gKzAwMDAsIENvcm5paiwgTmlrb2xhIHdyb3Rl
Ogo+Pj4+PiBJZiB5b3UncmUgZ29pbmcgdG8gbWFrZSBhbGwgb2YgdGhlbSB0aGUgc2FtZSwgdGhl
biB1NjQsIHBsZWFzZS4KPj4+Pj4KPj4+Pj4gVGhpcyBpcyBiZWNhdXNlIEknbSBub3Qgc3VyZSBp
ZiBjYWxjdWxhdGlvbnMgcmVxdWlyZSA2NC1iaXQgYXQgc29tZQo+Pj4+PiBzdGFnZS4KPj4+Pgo+
Pj4+IElmIGl0IGRvZXMgdGhlbiBpdCdzIGFscmVhZHkgYnJva2VuLiBTb21lb25lIHNob3VsZCBw
cm9iYWJseSBmaWd1cmUgb3V0Cj4+Pj4gd2hhdCdzIGFjdGFsbHkgbmVlZGVkIGluc3RlYWQgb2Yg
c2hvb3RpbmcgZHVja3Mgd2l0aCBhbiBpY2JtLgo+Pj4+Cj4+Cj4+Cj4+IFNvcnJ5IG1hZGUgYSB0
eXBlIGJlbG93LiBTdXBwb3NlZCB0byBiZSAiSSBkb24ndCB0aGluayBpdCBpcyBicm9rZW4iCj4g
Cj4gSSBtZWFuIHRoYXQgaXQncyBicm9rZW4gaWYgaXQgYWN0dWFsbHkgbmVlZHMgdTY0IHdoZW4g
aXQncwo+IGN1cnJlbnRseSB1c2luZyB1bnNpZ25lZCBsb25nLiBTbyB1NjQgaXMgZWl0aGVyIG92
ZXJraWxsIG9yIHRoZQo+IGNvZGUgaXMgY3VycmVudGx5IGJyb2tlbi4KPiAKCk5vbmUgb2YgdGhl
IGNhbGN1bGF0aW9ucyBleGNlZWQgdTMyLCBzbyB1NjQgd291bGQgYmUgYW4gb3ZlcmtpbGwsIHNp
bmNlIApub25lIG9mIHRoZSB2YXJpYWJsZXMgaW4gdGhlIHN0cnVjdHVyZSBleGNlZWQgMTYgYml0
cy4gVGhlcmVmb3JlIHUzMiBpcyAKZW5vdWdoLgoKPj4KPj4+IEkgZG9uJ3QgdGhpbmsgaXQgaXMg
bm90IGJyb2tlbiwgY2F1c2UgSSdtIGN1cnJlbnRseSB0ZXN0aW5nIERTQy4KPj4+IFRoZSBwYXRj
aCBJIHNlbnQgZWFybHkgc2ltcGx5IGZpeGVzIHRoZSBlcnJvciBvZiBjb21wYXJpbmfCoCBzaWdu
ZWQgYW5kCj4+PiB1bnNpZ25lZCB2YXJpYWJsZXMuCj4+Pgo+Pj4gV2UgY2FuIHRoZW4gc3VibWl0
IGEgc2Vjb25kIHBhdGNoIGFkZHJlc3NpbmcgdGhlIGlzc3VlIG9mIHVzaW5nIHVuc2lnbmVkCj4+
PiBsb25nIGludCBpbnN0ZWFkIG9mIHUzMi4gQWxzbywgc2luY2UgdGhlIHZhcmlhYmxlcyBpbiBk
cm1fZHNjX2NvbmZpZwo+Pj4gc3RydWN0dXJlIGFyZSBhbGwgb2YgdHlwZSB1OCBhbmQgdTE2LCB0
aGUgY2FsY3VsYXRpb24gdmFsdWVzIHNob3VsZG4ndAo+Pj4gZXhjZWVkIHRoZSBzaXplIG9mIHUz
Mi4KPj4+Cj4+PiBUaGFua3MKPj4+Cj4+Pj4+Cj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4+Pj4+IEZyb206IExpcHNraSwgTWlraXRhIDxNaWtpdGEuTGlwc2tpQGFtZC5jb20+Cj4+
Pj4+IFNlbnQ6IE5vdmVtYmVyIDE5LCAyMDE5IDEwOjA4IEFNCj4+Pj4+IFRvOiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPjsgTGlwc2tpLCBNaWtpdGEKPj4+
Pj4gPE1pa2l0YS5MaXBza2lAYW1kLmNvbT4KPj4+Pj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOwo+Pj4+PiBDb3JuaWos
IE5pa29sYSA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPgo+Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENI
XSBkcm0vZHNjOiBSZXR1cm4gdW5zaWduZWQgbG9uZyBvbiBjb21wdXRlIG9mZnNldAo+Pj4+Pgo+
Pj4+Pgo+Pj4+Pgo+Pj4+PiBPbiAxOS8xMS8yMDE5IDA5OjU2LCBWaWxsZSBTeXJqw6Rsw6Qgd3Jv
dGU6Cj4+Pj4+PiBPbiBUdWUsIE5vdiAxOSwgMjAxOSBhdCAwOTo0NToyNkFNIC0wNTAwLCBtaWtp
dGEubGlwc2tpQGFtZC5jb20gd3JvdGU6Cj4+Pj4+Pj4gRnJvbTogTWlraXRhIExpcHNraSA8bWlr
aXRhLmxpcHNraUBhbWQuY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2Ugc2hvdWxkbid0IGNvbXBhcmUg
aW50IHdpdGggdW5zaWduZWQgbG9uZyB0byBmaW5kIHRoZSBtYXggdmFsdWUgYW5kCj4+Pj4+Pj4g
c2luY2Ugd2UgYXJlIG5vdCBleHBlY3RpbmcgbmVnYXRpdmUgdmFsdWUgcmV0dXJuZWQgZnJvbQo+
Pj4+Pj4+IGNvbXB1dGVfb2Zmc2V0IHdlIHNob3VsZCBtYWtlIHRoaXMgZnVuY3Rpb24gcmV0dXJu
IHVuc2lnbmVkIGxvbmcgc28KPj4+Pj4+PiB3ZSBjYW4gY29tcGFyZSB0aGUgdmFsdWVzIHdoZW4g
Y29tcHV0aW5nIHJjIHBhcmFtZXRlcnMuCj4+Pj4+Pgo+Pj4+Pj4gV2h5IGFyZSB0aGVyZSBvdGhl
ciB1bnNpZ25lZCBsb25ncyBpbiBkc2MgcGFyYW1ldGVyIGNvbXB1dGF0aW9uIGluIHRoZQo+Pj4+
Pj4gZmlyc3QgcGxhY2U/Cj4+Pj4+Cj4+Pj4+IEkgYmVsaWV2ZSBpdCB3YXMgaW5pdGlhbGx5IHNl
dCB0byBiZSB1bnNpZ25lZCBsb25nIGZvciB2YXJpYWJsZQo+Pj4+PiBjb25zaXN0ZW5jeSwgd2hl
biB3ZSBwb3J0ZWQgaW50ZWxfY29tcHV0ZV9yY19wYXJhbWV0ZXJzIGludG8KPj4+Pj4gZHJtX2Rz
Y19jb21wdXRlX3JjX3BhcmFtZXRlcnMuIEJ1dCBub3cgdGhhdCBJIGxvb2sgYXQgaXQsIHdlIGNh
bgo+Pj4+PiBhY3R1YWxseSBqdXN0IHNldCB0aGVtIHRvIHUzMiBvciB1NjQsIGFzIG5vdGhpbmcg
c2hvdWxkIGV4Y2VlZCB0aGF0Lgo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IENjOiBOaWtvbGEgQ29y
bmlqIDxuaWtvbGEuY29ybmlqQGFtZC5jb20+Cj4+Pj4+Pj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxo
YXJyeS53ZW50bGFuZEBhbWQuY29tPgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pa2l0YSBMaXBz
a2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgwqDCoCBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RzYy5jIHwgNiArKystLS0KPj4+Pj4+PiAgwqDCoCAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RzYy5jCj4+Pj4+Pj4gaW5kZXggNzRmMzUyN2Y1NjdkLi5lYzQwNjA0YWI2YTIgMTAwNjQ0Cj4+
Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYwo+Pj4+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHNjLmMKPj4+Pj4+PiBAQCAtMjQ1LDExICsyNDUsMTEgQEAgdm9pZCBk
cm1fZHNjX3Bwc19wYXlsb2FkX3BhY2soc3RydWN0Cj4+Pj4+Pj4gZHJtX2RzY19waWN0dXJlX3Bh
cmFtZXRlcl9zZXQgKnBwc19wYXlsb2FkLAo+Pj4+Pj4+ICDCoMKgIH0KPj4+Pj4+PiAgwqDCoCBF
WFBPUlRfU1lNQk9MKGRybV9kc2NfcHBzX3BheWxvYWRfcGFjayk7Cj4+Pj4+Pj4gLXN0YXRpYyBp
bnQgY29tcHV0ZV9vZmZzZXQoc3RydWN0IGRybV9kc2NfY29uZmlnICp2ZHNjX2NmZywgaW50Cj4+
Pj4+Pj4gcGl4ZWxzX3Blcl9ncm91cCwKPj4+Pj4+PiArc3RhdGljIHVuc2lnbmVkIGxvbmcgY29t
cHV0ZV9vZmZzZXQoc3RydWN0IGRybV9kc2NfY29uZmlnCj4+Pj4+Pj4gKnZkc2NfY2ZnLCBpbnQg
cGl4ZWxzX3Blcl9ncm91cCwKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGludCBncm91cHNfcGVyX2xpbmUsIGludCBncnBjbnQpCj4+Pj4+Pj4gIMKgwqAgewo+
Pj4+Pj4+IC3CoMKgwqAgaW50IG9mZnNldCA9IDA7Cj4+Pj4+Pj4gLcKgwqDCoCBpbnQgZ3JwY250
X2lkID0gRElWX1JPVU5EX1VQKHZkc2NfY2ZnLT5pbml0aWFsX3htaXRfZGVsYXksCj4+Pj4+Pj4g
cGl4ZWxzX3Blcl9ncm91cCk7Cj4+Pj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIG9mZnNldCA9
IDA7Cj4+Pj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIGdycGNudF9pZCA9Cj4+Pj4+Pj4gRElW
X1JPVU5EX1VQKHZkc2NfY2ZnLT5pbml0aWFsX3htaXRfZGVsYXksIHBpeGVsc19wZXJfZ3JvdXAp
Owo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqAgaWYgKGdycGNudCA8PSBncnBjbnRfaWQpCj4+Pj4+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9mZnNldCA9IERJVl9ST1VORF9VUChncnBjbnQgKiBwaXhl
bHNfcGVyX2dyb3VwICoKPj4+Pj4+PiB2ZHNjX2NmZy0+Yml0c19wZXJfcGl4ZWwsIDE2KTsKPj4+
Pj4+PiAtLSAKPj4+Pj4+PiAyLjE3LjEKPj4+Pj4+Pgo+Pj4+Pj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+Pj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+Pj4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+Pj4+PiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Pj4+
Pj4KPj4+Pj4KPj4+Pj4gLS0gCj4+Pj4+IFRoYW5rcywKPj4+Pj4gTWlraXRhIExpcHNraQo+Pj4+
PiBTb2Z0d2FyZSBFbmdpbmVlciAyLCBBTUQKPj4+Pj4gbWlraXRhLmxpcHNraUBhbWQuY29tCj4+
Pj4KPj4+Cj4+Cj4+IC0tIAo+PiBUaGFua3MsCj4+IE1pa2l0YSBMaXBza2kKPj4gU29mdHdhcmUg
RW5naW5lZXIgMiwgQU1ECj4+IG1pa2l0YS5saXBza2lAYW1kLmNvbQo+IAoKLS0gClRoYW5rcywK
TWlraXRhIExpcHNraQpTb2Z0d2FyZSBFbmdpbmVlciAyLCBBTUQKbWlraXRhLmxpcHNraUBhbWQu
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
