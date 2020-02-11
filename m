Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8528159B16
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 22:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1764E6EC7D;
	Tue, 11 Feb 2020 21:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE056F44E;
 Tue, 11 Feb 2020 21:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hsowx8j0nRv/xFtYVlxfmq+xYXTAefhUDK6t38RQ5HAVVirGoM9JB/jRy1dw74VzZSsF+JUlredcUBR9PGPLtGlDHoG2aYdzjDVJbMUv4O05T9FmFscjbkfosGGdaqrfw+nBI+xqqF+PQMO1NeoHslZU8Nr0kersWrI0jdGHDJ8u9+y6JLuTEcK9QSH57I8dwYr5E4FA1pP6X1r89ykH8nGxvO8du+JvtTYfnckWPioDAxN9lYlvZ3mcDPYOtt1+KzDN4yaIwaURRJU9zYJvRVdYqkDK8ZJkH/iJcAmmS8dlVzYeJS3s9MUewSg6WB82EV9wm0oAbhG2gu3+npYtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gm1/Otr0ASIgEPI1iZSKnrrHU6ZcVBEmQcdYhT01bLo=;
 b=frFErurMs8gkmzwDsTi6WUvNtTrLqHMOfLdS8amAQKKmXYhM4R1pTFAEzufRzwXCXPpLxd7G5Ckp+WXXclLiRiZZ0ZZ4MYzqgLzcTuJQS8qc+E/3v0gF87+OtF8w2yCIMaL/YYaELXzwxDMXlCBR/Yr2yFQd+RMeLMNYjqnUW0vUv2zyOmoHJpj0GdE66AONR1kNS67pgVvqXfa0+BtHki6IJNLyoMoZ/h5zUcrcZ0ftgp+6HY+SF+7GgBHfESVAAL7TseidCUEDCDCcykRgiaRHMTK1lw8VCKEMXZogz5I2z0RaPgy0S2ds3SO7bKNK6izZLX8Jhr1LfVZ8VJnjKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gm1/Otr0ASIgEPI1iZSKnrrHU6ZcVBEmQcdYhT01bLo=;
 b=nsUyguenLTOKLIao4SQOGAdJnpecb08m76F5maJyrHeR6GBoiBR/DRkP+4gLFsz7aq9+TFZ0RM0hTUf5Fgzbw5Swcny27+IW1YvOI7zy8LvDPwKDQTSF+FzYFFPuNyCe9p1Ajbj8ozRzyYr1sl3NO5YVFrcsga3+1F7JXTRNETQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1757.namprd12.prod.outlook.com (10.175.54.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Tue, 11 Feb 2020 21:27:47 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::610d:b9b1:dbd1:1150]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::610d:b9b1:dbd1:1150%6]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 21:27:47 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
To: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <0de5ad33ca2ff86fee13a453aa9096c274afbd3c.camel@pengutronix.de>
 <d710aba7c3acc537bfb1c20362f7c8dbee421f02.camel@pengutronix.de>
 <740fb929-e788-075b-87db-e2524ed4b086@gmail.com>
 <CADnq5_Np=OFgqAb4TPRz5yqx1YZSwWybS=F6R_r6r01QRrzADA@mail.gmail.com>
 <61128c11-9e65-bc21-6306-ea4efea18b76@amd.com>
 <90de1234-a103-a695-4ad7-83b1486e15ee@amd.com>
 <02ba868c-e904-3681-c795-59a4e48926d5@amd.com>
 <b1ebac7c-5593-bc87-1f36-ea55503f05d1@amd.com>
 <4b5c56d2-4ce4-3626-623f-d4a8124d76fa@amd.com>
Message-ID: <d4ba6ed9-604e-5e88-f427-679639dcf8e9@amd.com>
Date: Tue, 11 Feb 2020 16:27:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <4b5c56d2-4ce4-3626-623f-d4a8124d76fa@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::41) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:fc00:58a6:e9e5:1a9b:2c2a]
 (2607:fea8:3edf:fc00:58a6:e9e5:1a9b:2c2a) by
 YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Tue, 11 Feb 2020 21:27:46 +0000
X-Originating-IP: [2607:fea8:3edf:fc00:58a6:e9e5:1a9b:2c2a]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77e76f41-4ea7-4b96-29bb-08d7af393d30
X-MS-TrafficTypeDiagnostic: MWHPR12MB1757:|MWHPR12MB1757:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB17572E632D8D9AAA359AA0F7EA180@MWHPR12MB1757.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0310C78181
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(4326008)(52116002)(2616005)(110136005)(16526019)(53546011)(54906003)(316002)(186003)(81166006)(8936002)(8676002)(478600001)(966005)(31696002)(45080400002)(81156014)(31686004)(36756003)(6486002)(86362001)(2906002)(66946007)(66476007)(66556008)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1757;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBKXZc2BNp60G3x3ByOa+pXg/+cXpwGBsBkhz/MZgGLKIbprQnMDGlyZZhuDfrIwu+jHdgFDo7SebFVnwN0sH/vUGU8pdw9fIlBhzFGTPDeW2zQKi3V27QV1ka1wirqbKKfsRK0I2J9/aOCG/d80MqGfzgfY05cGLkd9DZnqE4Ojt7CdV0t+3A2DT6enwktoJJhN3KmYgIRWMASWUtlanR9Jujec704UrWehosHK7sSVrG8RNwd8GdzPn+zKHTAK69KoPvzU3FckkxWYo2EFdNoaZZ17AgUVrFAy/HFr9ts1zWNtmg+HNkBtcRZmeGH2aFWxv4/6+MClXSWveR1dKd0IrNcirbEJC6igLx5aij3VqbzE9Y7blYAB04hvsp3k3XtjRljRQxkuZnLcQPpZ/JiDegUtfleFA9ql++NfB3AU0jZTkoA5gMseusi/0xEXtfz23Ym+sKuAOEw5sgeLwpJL31jgDnpSDsrogsUx/Oo0KKuLIbKhSWAKhzFN/nNOIBKn7WXsNabXMZHp2r/48g==
X-MS-Exchange-AntiSpam-MessageData: m92+u+sA2cX6/eUForgsPEchfCvYYMrBzrOQkgzSYPYQhOCpOiH4uXp3Qu2IYv2miF4l0UREan4USLOfG9rD8CqV78+xxpp5JwT6p26pRSJxxHsZz/YT4LDMOqYGM0JsXQahV24wswalrNUq9vJavYLxEQ48lfyyXmMnOyTeV9hXGpFxLoJ/XV5AHX3ICKlY5/u2jenAOqYi2p3yi+Jd0g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e76f41-4ea7-4b96-29bb-08d7af393d30
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2020 21:27:47.3546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fuJJsNWr9RGIBe6JmVWWQX2RInyWgKLenNMBmtGrzSQRS99cduLGuwQTLyIG9i1SVY98Yz85IsQTPzlVQLBWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1757
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
Cc: Emily Deng <Emily.Deng@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 steven.price@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMTEvMjAgMTA6NTUgQU0sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+IE9uIDIvMTAv
MjAgNDo1MCBQTSwgTHViZW4gVHVpa292IHdyb3RlOgo+PiBIaSBMdWNhcywKPj4KPj4gVGhhbmsg
eW91IGZvciBicmluZ2luZyBhd2FyZW5lc3Mgb2YgdGhpcyBpc3N1ZSwgcHVibGljbHkuCj4+Cj4+
IEFzIHNvb24gYXMgdGhpcyBwYXRjaCBzaG93ZWQgdXAgYmFjayBpbiBOb3ZlbWJlciBvZiAyMDE5
LAo+PiBJIG9iamVjdGVkIHRvIGl0LCBwcml2YXRlbHkuCj4KPgo+IEkgZGlkbid0IGZpbmQgdGhp
cyBvYmplY3Rpb24gaW4gbXkgbWFpbCBhY3R1YWxseQo+Cj4KPj4KPj4gSSBzdWdnZXN0ZWQgdG8g
aW5zdGVhZCB1c2UgYSBfbGlzdF8gdG8gc3RvcmUgdGhlICJzdGF0ZSIgb2YKPj4gYWxsIGpvYnMg
b2YgdGhlIHNhbWUgc3RhdGUuIFRoZW4sIGF0IGFueSB0aW1lLCB0aW1lb3V0IGludGVycnVwdAo+
PiBvciB3aGF0ZXZlciwgd2UgY2FuIGF0b21pY2FsbHkgKGlycSBzcGlubG9jaykgbW92ZSB0aGUg
dGltZW91dC9iYWQKPj4gam9iIHRvIHRoZSB0aW1lZG91dC9jbGVhbnVwL2JhZCBqb2IgbGlzdCwg
YW5kIHdha2Ugc29tZW9uZSB1cAo+PiB0byBkZWFsIHdpdGggdGhhdCBsaXN0IGFzeW5jaHJvbm91
c2x5LCBhbmQgcmV0dXJuIGZyb20gdGhlIAo+PiBpbnRlcnJ1cHQvZXRjLgo+PiBpbW1lZGlhdGVs
eS4KPgo+Cj4gU291bmRzIGEgZ29vZCBpZGVhIHRvIG1lLCBpIHRoaW5rIGVub3VnaCBmb3IgdXMg
dG8gaGF2ZSAyIGxpc3RzLCAKPiB0aW1lb3V0IGxpc3QgZm9yIGpvYnMgc2NoZWR1bGVkIHRvIEhX
IGFuZCBub3QgeWV0IGNvbXBsZXRlZCAKPiAoY29tcGxldGlvbiBmZW5jZSBzaWduYWxlZCkgYW5k
IGNsZWFudXAgbGlzdCBmb3IgdGhvc2UgdGhhdCBkaWQgCj4gY29tcGxldGUuIFRoaXMgc2hvdWxk
IGdpdmUgYWx0ZXJuYXRpdmUgc29sdXRpb24gdG8gdGhlIHJhY2UgY29uZGl0aW9uIAo+IHRoaXMg
cGF0Y2ggd2FzIGFkZHJlc3Npbmcgd2l0aG91dCBjYXVzaW5nIHRoZSBicmVhayB0aGUgTHVjYXMg
Cj4gcmVwb3J0ZWQuIElmIG5vIG9uZSBvYmplY3RzIEkgdGhpbmsgaSBjYW4gdHJ5IGltcGxlbWVu
dCBpdC4KPgo+IEFuZHJleQoKClRoaW5raW5nIG1vcmUgaSByZWFsaXplIEx1YmVuIGlzIHJpZ2h0
IGFib3V0IGhhdmluZyBhbHNvIGJhZCBqb2IgbGlzdCBhcyAKdGhpcyBpcyBuZWVkZWQgZm9yIG5v
cm1hbCBqb2IgY29tcGV0aXRpb24gKGJ5IGZlbmNlIGNhbGxiYWNrIGZyb20gCmFtZGdwdV9mZW5j
ZV9wcm9jZXNzKcKgIGFuZCB5b3UgbmVlZCB0byBkZWNpZGUgaWYgeW91IG1vdmUgaXQgdG8gY2xl
YW51cCAKbGlzdCBmcm9tIHRpbWVvdXQgbGlzdCBvciBub3QuIElmIGl0J3MgYWxyZWFkeSBpbiBi
YWQgam9iIGxpc3QgLSBtZWFuaW5nIAp0aGF0IGl0J3MgYmVpbmcgcHJvY2Vzc2VkIGJ5IEdQVSBy
ZWNvdmVyeSBjb2RlIHlvdSBkb24ndCB0b3VjaCBpdCwgCm90aGVyd2lzZSB5b3UgbW92ZSBpdCB0
byBjbGVhbnVwIGxpc3Qgd2hlcmUgaXQgd2lsbCBiZSBmcmVlZCBldmVudHVhbGx5IApieSBpbnZv
Y2F0aW9uIG9mIGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2IuCgpBbmRyZXkKCgo+Cj4KPj4KPj4g
VGhlbiBpbiBkdWUgdGltZSwgaWYgYW55IG1vcmUgaW50ZXJydXB0cyBvciB3aGF0bm90IHRha2Ug
cGxhY2UsCj4+IHRoZSBqb2Igd2lsbCBlaXRoZXIgYmUgaW4gdGhlIHRpbWVvdXQgbGlzdCBvciBu
b3QuIElmIGl0IGl0LAo+PiB0aGVuIHRoZSBpbnN0aWdhdG9yIGJhY2tzIG9mZiBhcyBzb21lb25l
IGVsc2UgKHRoZSBsaXN0IGhhbmRsZXIpIHdpbGwvaXMKPj4gYXdha2UgYW5kIGhhbmRsaW5nIGl0
IChvYnZpb3VzbHkgYSBzdGF0ZSB2YXJpYWJsZSBtYXkgYmUga2VwdCBhcyB3ZWxsKS4KPj4KPj4g
VGhpcyBkcmF3cyBzb21ld2hhdCBmcm9tIG15IGRheXMgd2l0aCBpU0NTSSwgU0NTSSBhbmQgU0FT
LCAxNSB5ZWFycyBhZ28sCj4+IHdoZXJlIGEgZGV2aWNlIGNhbiBjb21wbGV0ZSBhIGpvYiAodGFz
aykgYXQgYW55dGltZSByZWdhcmRsZXNzCj4+IG9mIHdoYXQgdGhlIFNDU0kgbGF5ZXIgInRoaW5r
cyIgdGhlIHRhc2sncyBzdGF0ZSBpczogdGltZWQtb3V0LCBhYm9ydGVkLAo+PiB3aGF0ZXZlci4g
SXQgaXMgYSB2ZXJ5IHNpbXBsZSBhbmQgZWxlZ2FudCBzb2x1dGlvbiB3aGljaCBnZW5lcmFsaXpl
cwo+PiB3ZWxsLgo+Pgo+PiBSZWdhcmRzLAo+PiBMdWJlbgo+Pgo+PiBPbiAyMDIwLTAyLTEwIDEx
OjU1IGEubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4gTHVjYXMgLSBQaW5nIG9uIG15
IHF1ZXN0aW9uIGFuZCBhbHNvIEkgYXR0YWNoZWQgdGhpcyB0ZW1wb3JhcnkgCj4+PiBzb2x1dGlv
biBmb3IgZXRuYXZpdiB0byBjbGFyaWZ5IG15IHBvaW50LiBJZiB0aGF0IHNvbWV0aGluZyAKPj4+
IGFjY2VwdGFibGUgZm9yIG5vdyBhdCBsZWFzdCBpIGNhbiBkbyB0aGUgc2FtZSBmb3IgdjNkIHdo
ZXJlIGl0IAo+Pj4gcmVxdWlyZXMgYSBiaXQgbW9yZSBjb2RlIGNoYW5nZXMuCj4+Pgo+Pj4gQW5k
cmV5Cj4+Pgo+Pj4gT24gMi82LzIwIDEwOjQ5IEFNLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToK
Pj4+Pj4gV2VsbCBhIHJldmVydCB3b3VsZCBicmVhayBvdXIgZHJpdmVyLgo+Pj4+Pgo+Pj4+PiBU
aGUgcmVhbCBzb2x1dGlvbiBpcyB0aGF0IHNvbWVib2R5IG5lZWRzIHRvIHNpdCBkb3duLCBnYXRo
ZXIgQUxMIAo+Pj4+PiB0aGUgcmVxdWlyZW1lbnRzIGFuZCB0aGVuIGNvbWUgdXAgd2l0aCBhIHNv
bHV0aW9uIHdoaWNoIGlzIGNsZWFuIAo+Pj4+PiBhbmQgd29ya3MgZm9yIGV2ZXJ5b25lLgo+Pj4+
Pgo+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4KPj4+PiBJIGNhbiB0byB0YWtlIG9uIHRoaXMgYXMgaW5k
ZWVkIG91ciBnZW5lcmFsIGRlc2lnbiBvbiB0aGlzIGJlY29tZXMgCj4+Pj4gbW9yZSBhbmQgbW9y
ZSBlbnRhbmdsZWQgYXMgR1BVIHJlc2V0IHNjZW5hcmlvcyBncm93IGluIGNvbXBsZXhpdHkgCj4+
Pj4gKGF0IGxlYXN0IGluIEFNRCBkcml2ZXIpLiBDdXJyZW50bHkgSSBhbSBvbiBhIGhpZ2ggcHJp
b3JpdHkgCj4+Pj4gaW50ZXJuYWwgdGFzayB3aGljaCBzaG91bGQgdGFrZSBtZSBhcm91bmQgYSB3
ZWVrIG9yIDIgdG8gZmluaXNoIGFuZCAKPj4+PiBhZnRlciB0aGF0IEkgY2FuIGdldCB0byBpdC4K
Pj4+Pgo+Pj4+IFJlZ2FyZGluZyB0ZW1wb3Jhcnkgc29sdXRpb27CoCAtIEkgbG9va2VkIGludG8g
djNkIGFuZCBldG5hdml2IHVzZSAKPj4+PiBjYXNlcyBhbmQgd2UgaW4gQU1EIGFjdHVhbGx5IGZh
Y2UgdGhlIHNhbWUgc2NlbmFyaW8gd2hlcmUgd2UgZGVjaWRlIAo+Pj4+IHRvIHNraXAgSFcgcmVz
ZXQgaWYgdGhlIGd1aWx0eSBqb2IgZGlkIGZpbmlzaCBieSB0aGUgdGltZSB3ZSBhcmUgCj4+Pj4g
cHJvY2Vzc2luZyB0aGUgdGltZW91dMKgIChzZWUgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlciBh
bmQgCj4+Pj4gc2tpcF9od19yZXNldCBnb3RvKSAtIHRoZSBkaWZmZXJlbmNlIGlzIHdlIGFsd2F5
cyBjYWxsIAo+Pj4+IGRybV9zY2hlZF9zdG9wL3N0YXJ0IGlycmVzcGVjdGl2ZWx5IG9mIHdoZXRo
ZXIgd2UgYXJlIGdvaW5nIHRvIAo+Pj4+IGFjdHVhbGx5IEhXIHJlc2V0IG9yIG5vdCAoc2FtZSBh
cyBleHRlbmQgdGltZW91dCkuIEkgd29uZGVyIGlmIAo+Pj4+IHNvbWV0aGluZyBsaWtlIHRoaXMg
Y2FuIGJlIGRvbmUgYWxzbyBmb3IgdmUzIGFuZCBldG5hdml2ID8KPj4+Pgo+Pj4+IEFuZHJleQo+
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGFt
ZC1nZnggbWFpbGluZyBsaXN0Cj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4g
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1k
LWdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDYW5kcmV5Lmdyb2R6b3Zza3klNDBhbWQuY29tJTdDZWY5
NjYxN2QyM2E1NGZlOWI2ZWYwOGQ3YWYwYWM5ZGIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5
OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTcwMzMzMjAwNjIxNTUwJmFtcDtzZGF0YT13YTdFaDNiZGkl
MkJ0aFlqalpGMnllVHZUak5SaXBHUHFWQSUyRkdRdDBRTDdSOCUzRCZhbXA7cmVzZXJ2ZWQ9MCAK
Pj4+Cj4+Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFt
ZC1nZngmYW1wO2RhdGE9MDIlN0MwMSU3Q2FuZHJleS5ncm9kem92c2t5JTQwYW1kLmNvbSU3Q2Vm
OTY2MTdkMjNhNTRmZTliNmVmMDhkN2FmMGFjOWRiJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJk
OTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzE3MDMzMzIwMDYyMTU1MCZhbXA7c2RhdGE9d2E3RWgzYmRp
JTJCdGhZampaRjJ5ZVR2VGpOUmlwR1BxVkElMkZHUXQwUUw3UjglM0QmYW1wO3Jlc2VydmVkPTAg
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
