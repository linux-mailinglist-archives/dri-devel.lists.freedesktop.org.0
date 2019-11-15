Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF99FDB3E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 11:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A886E413;
	Fri, 15 Nov 2019 10:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790073.outbound.protection.outlook.com [40.107.79.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C0F6E14C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 08:30:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+Uf8Zqkc6v9x4vKnZlMJB6YEk/WZI0KWRKU+ebCKJluNHiIgTRyhS2acdxW5izml0sVpdFN6Qv3h/Hvg7gP0YVNdMJjAsr2WU7ynmNx0LhCaqKne+kRSPzWIDnBCODAElrtkZ+cGwWzIfTTgKB4NwLzebYdmtMVGtNGyiG8u+iMOqkQHZ5QSnyKHQc6biV+8YcShetR03QUe/VcKeIPQ95xVPTab+/vTv8P8YmuK9Wsns0tzpcGQmlTqaW23tSG3zpRwfJkl9bKCHmyob4q0fArFaeZF4c2QO03zKtsyEvf8iTyOykwcCqwzRjgxldEss0vPynf9snad1nC6Jow9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMVMX0ZwSBMGRMPHY0feQ69DPXslDhz5HrEaOtlOC+Q=;
 b=gvQl/9gic35sh434uKxfdPAzKCDZvOSMGhL/U9lg83KBOCT2uTTU/dEy5BsWyapLC8oT+uZVHjhxYc/PEAxTH9NWtoz8arZfwNty5k9tCVxTg7LG+Tk5FSMOhxv+N0sxTNovfw4u+ZZbBeeU9oTj4Gdh+s+YxslF9nzcpjRc3o+qU1xzWpnVe0KjRMQHUCThs6sDihYCgNbR2l2Yrh2Wjtn/9I0J5O46+h4xgqvwZfGQu2jhCZeA8ADRaGZyJuCk61JKpSknp/pCYhuPk6iWbIcsgnEJLncba8C1Bm02ASZvd7qR8flqHD/2w6HR6rI0rfkfnFiRDq0pyFiJsJpplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
Received: from CY4PR02CA0030.namprd02.prod.outlook.com (2603:10b6:903:117::16)
 by DM6PR02MB5257.namprd02.prod.outlook.com (2603:10b6:5:48::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Fri, 15 Nov
 2019 08:30:28 +0000
Received: from BL2NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::203) by CY4PR02CA0030.outlook.office365.com
 (2603:10b6:903:117::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.24 via Frontend
 Transport; Fri, 15 Nov 2019 08:30:28 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT015.mail.protection.outlook.com (10.152.77.167) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2451.23
 via Frontend Transport; Fri, 15 Nov 2019 08:30:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1iVWzr-00005f-Fp; Fri, 15 Nov 2019 00:30:27 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1iVWzm-0001EO-Bb; Fri, 15 Nov 2019 00:30:22 -0800
Received: from [172.30.17.107] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1iVWzb-0000ji-VZ; Fri, 15 Nov 2019 00:30:12 -0800
Subject: Re: [PATCH v10 4/4] arm64: dts: zynqmp: zcu106-revA: Wire up the
 DisplayPort subsystem
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20191108175935.29766-1-laurent.pinchart@ideasonboard.com>
 <20191108175935.29766-5-laurent.pinchart@ideasonboard.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <11a7c38f-8fe4-09f9-3202-d976edef6843@xilinx.com>
Date: Fri, 15 Nov 2019 09:30:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108175935.29766-5-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(376002)(346002)(136003)(396003)(199004)(189003)(51444003)(11346002)(26005)(336012)(478600001)(58126008)(65806001)(50466002)(54906003)(106002)(70586007)(36756003)(70206006)(65956001)(229853002)(5660300002)(230700001)(31696002)(47776003)(2486003)(356004)(316002)(23676004)(8676002)(186003)(9786002)(2906002)(81166006)(81156014)(305945005)(76176011)(6246003)(8936002)(426003)(107886003)(126002)(476003)(2616005)(486006)(36386004)(31686004)(4326008)(446003)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB5257; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 035250e2-a39f-4a2e-438b-08d769a611e4
X-MS-TrafficTypeDiagnostic: DM6PR02MB5257:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5257582CE7F117E8E7B204D0C6700@DM6PR02MB5257.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02229A4115
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FBtnhYFRfjoPP758nrj91rJFJdvuYaIyhWAYGV6q6ieG+X5qMGyarS+YnmAJJzsIt5o3L7R1arTrVWgv4oSXjFLdcw19SJll2u8zMJsrPKqpPgj0qCuxQG1L0oAfD+YiYHKrnyoqoG7IpLat8FR5dlcIN63vp93j+otFlDu24eD3dYoFcZphdhQxN1z4gwRoWSyrTVT1B007einlQ1DNdYPXDszMhnloO9kedsjhcc5VZYGGtvKLJVq3HysoX447ZwFzZZd7KeoFMQf0GX+pz9z/XNitepn/lJ5EQoJ7hQ6XzV0+ESZ9YWlNK/6wQAfIVmimfWRNjPGJR9g9WqZ+h3k4fkXIdrs2h04h6kKEjvHI3pSIwC1FLWP6G7fk/vgjgs9Nr38y1sbMxrfir0XS0hpQleYPAw2i9M9+G88YKz9BQzrX7AvrA89tjFBDW3eP
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 08:30:28.0142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 035250e2-a39f-4a2e-438b-08d769a611e4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5257
X-Mailman-Approved-At: Fri, 15 Nov 2019 10:23:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMVMX0ZwSBMGRMPHY0feQ69DPXslDhz5HrEaOtlOC+Q=;
 b=fIqmERFMb+nrXSlhc5bI8Nmg+iRw0x3+R4gOlw996chbycJkjmfqVLrdmBLZzXVcw/Uzs4szgOauLYIOOOa42YwVg8w7kaDYobrQIyFtNpT8FN5lw48kj5vn7jUYf5Y2T7cZqDOTKg5d2ytfaQRTyDzRxf/iinrEZbCSENPWDM0=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is
 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
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
Cc: Michal Simek <michal.simek@xilinx.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDguIDExLiAxOSAxODo1OSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBFbmFibGUgdGhl
IGRwc3ViIGRldmljZSBhbmQgd2lyZSBpdCB1cCB0byB0aGUgUFMtR1RSIFBIWSBsYW5lcyByb3V0
ZWQgdG8KPiB0aGUgRGlzcGxheVBvcnQgY29ubmVjdG9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0K
PiAgLi4uL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtemN1MTA2LXJldkEuZHRzIHwgMTYg
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtemN1MTA2LXJl
dkEuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLXpjdTEwNi1yZXZBLmR0
cwo+IGluZGV4IDkzY2U3ZWI4MTQ5OC4uNDY1NmYyNWI2YjA0IDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC16Y3UxMDYtcmV2QS5kdHMKPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtemN1MTA2LXJldkEuZHRzCj4gQEAgLTEzLDYg
KzEzLDcgQEAKPiAgI2luY2x1ZGUgInp5bnFtcC1jbGsuZHRzaSIKPiAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2lucHV0L2lucHV0Lmg+Cj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8u
aD4KPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BoeS9waHkuaD4KPiAgCj4gIC8gewo+ICAJbW9k
ZWwgPSAiWnlucU1QIFpDVTEwNiBSZXZBIjsKPiBAQCAtNjksNiArNzAsMTcgQEAKPiAgCXN0YXR1
cyA9ICJva2F5IjsKPiAgfTsKPiAgCj4gKyZkcGRtYSB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4g
K307Cj4gKwo+ICsmZHBzdWIgewo+ICsJc3RhdHVzID0gIm9rYXkiOwo+ICsJcGh5LW5hbWVzID0g
ImRwLXBoeTAiLCAiZHAtcGh5MSI7Cj4gKwlwaHlzID0gPCZsYW5lMSBQSFlfVFlQRV9EUCAwIDMg
MjcwMDAwMDA+LAo+ICsJICAgICAgIDwmbGFuZTAgUEhZX1RZUEVfRFAgMSAzIDI3MDAwMDAwPjsK
Ckl0IGlzIGFsaWduZWQgd2l0aCBzdHVmZiBpbiBYaWxpbnggdHJlZS4KSSB0aGluayB0aGF0IHB1
dHRpbmcgYW55IGNsb2NrIHZhbHVlIGhlcmUgaXMgd3JvbmcuCkl0IHNob3VsZCByZWFsbHkgYmUg
cG9pbnRpbmcgdG8gJmNsayB3aGF0ZXZlciBpdCBpcy4KVGhlbiB5b3UgY2FuIHN1cHBvcnQgbW9y
ZSBjYXNlcyB3aGVyZSBjbG9jayBkb2Vzbid0IG5lZWQgdG8gYmUgZml4ZWQgYW5kCml0IGlzIGFs
c28gYWxpZ25lZCB3aXRoIGNsb2NrIGJpbmRpbmcuCgo+ICt9Owo+ICsKPiAgLyogZnBkX2RtYSBj
bGsgNjY3TUh6LCBscGRfZG1hIDUwME1IeiAqLwo+ICAmZnBkX2RtYV9jaGFuMSB7Cj4gIAlzdGF0
dXMgPSAib2theSI7Cj4gQEAgLTUwMyw2ICs1MTUsMTAgQEAKPiAgCW5vLTEtOC12Owo+ICB9Owo+
ICAKPiArJnNlcmRlcyB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICAmdWFydDAg
ewo+ICAJc3RhdHVzID0gIm9rYXkiOwo+ICB9Owo+IAoKTQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
