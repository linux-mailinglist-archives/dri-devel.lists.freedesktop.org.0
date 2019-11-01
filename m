Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94790EBE65
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 08:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4846F737;
	Fri,  1 Nov 2019 07:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130081.outbound.protection.outlook.com [40.107.13.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615576F737
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 07:18:12 +0000 (UTC)
Received: from VI1PR08CA0132.eurprd08.prod.outlook.com (2603:10a6:800:d4::34)
 by DB7PR08MB3292.eurprd08.prod.outlook.com (2603:10a6:5:1f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20; Fri, 1 Nov
 2019 07:18:08 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR08CA0132.outlook.office365.com
 (2603:10a6:800:d4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.21 via Frontend
 Transport; Fri, 1 Nov 2019 07:18:08 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Fri, 1 Nov 2019 07:18:08 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Fri, 01 Nov 2019 07:18:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e478189bd47c151
X-CR-MTA-TID: 64aa7808
Received: from 1582ad77d078.2 (cr-mta-lb-1.cr-mta-net [104.47.6.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F27E53C-A958-4144-A5A8-240BA3AD4358.1; 
 Fri, 01 Nov 2019 07:18:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1582ad77d078.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 01 Nov 2019 07:18:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNwzd9ytvczzHQ8Z7QlMnuPlnycCyymaY55LwfiBLQ5tbNeuUcJDFMX3TY99mmO7Ok3oDB20JIK5c7UoqxB35rO1ia7snGpri8Udm7nKDixFEGpafuHsY2jdTgYAWgY5Sx79bM6pu+YpomzgrAOkKondJJ5+8zWMj8zXaOSffV6ZoJVCG2Dws2nzuHCPXL1oltAYb8hQ2V7MnT+X+8iVnBBQ55lA0Uiaj48f10EgK+iRUFl5131cUWK1bgHN7yA4bs2oCR8JimIPbxHePA50Boyqo+ZHn2DUp86cjvre/EYsOiccaT+GZu9jWRfdnIqr8Qngoq7xhh8aewVjQQisug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46CzLcWXD4HYYn+903EucSbZGVfkNKRZbANPHKz/d2M=;
 b=F6tvtyr1i8CqELNQ11ELDMq0NscHYYuxqonEoWIJXiZkunKsseFXe5lvLlaAwZ571q+NWWW35XeyqY35CWvfid4TcXSx8zs4IIj/KObB3X0pQDG7rAIFC83fa9L5Mkm+lQfRTUivraT8b65tHYVJMEnI2I7H93TdgPl2vi/w/NX5L/NY9N6Qty1Dz0WrpszASbCPW3IYS8ocT5CANoGXv4roQn7Q2c5FP78m27wfH54mRXwnW8/zRAxnr4hRr2jusfteDo5cS3rIf1E6zrTKD1eRLLIaAz0j9ah3ptzJjsbcafu2xVRKw4VKzUbM5GT3FKgy4xeIvzboNbFrbooE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4974.eurprd08.prod.outlook.com (10.255.158.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Fri, 1 Nov 2019 07:17:59 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2387.030; Fri, 1 Nov 2019
 07:17:59 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [4/5] drm/komeda: Add option to print WARN- and INFO-level IRQ
 events
Thread-Topic: [4/5] drm/komeda: Add option to print WARN- and INFO-level IRQ
 events
Thread-Index: AQHVkIR9MCG/HO2UX0CjwGVVCbb79Q==
Date: Fri, 1 Nov 2019 07:17:58 +0000
Message-ID: <20191101071752.GA30286@jamwan02-TSP300>
References: <20191021164654.9642-5-mihail.atanassov@arm.com>
In-Reply-To: <20191021164654.9642-5-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:202::30) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8ffc0905-9cd1-42c4-6fc4-08d75e9ba577
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:|VE1PR08MB4974:|DB7PR08MB3292:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3292D7516EDFC90060A44704B3620@DB7PR08MB3292.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2657;OLM:2657;
x-forefront-prvs: 020877E0CB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(199004)(189003)(25786009)(8936002)(6486002)(6246003)(81166006)(229853002)(14444005)(7736002)(71190400001)(476003)(478600001)(5660300002)(486006)(256004)(8676002)(2906002)(3846002)(71200400001)(305945005)(81156014)(6116002)(64756008)(55236004)(66446008)(102836004)(66066001)(66556008)(86362001)(6506007)(4326008)(186003)(6512007)(66476007)(6436002)(316002)(386003)(6862004)(76176011)(99286004)(26005)(54906003)(14454004)(52116002)(33716001)(9686003)(446003)(11346002)(1076003)(58126008)(6636002)(33656002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4974;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: gtTBy8asnB3Dj61F6rrpcIil3eM9mtJxemUgNi5BGKkzyCLDicOFcGVAet9QvmEM9fJm6fTByYKAttQXGAdXIrHOnVE3pNfPZQwpeiF8rWgJLlIKxgpZ/s9UM+34eMOezWGqzjrICcf6D56bJBSeL33WQW+Z0cS26xvqPsrjOw3h9vK2gFPLCWVMq/2E4TnRqiB9B8BHKXKsssCXEDcB6MwKTExZRGwb10vdIDXiaVsDtMP/OvpPcqrhmR3PlWywDrZATRCWehwofCPNQ0ocCKOQYEcYYgzzJJ3WJuj7rEo+3t6i9pHsiCXeQe8ZkPwI6rd+8js0A6MPqrBabzEw1x1vBRG8/MiEqk622IlzBxr92/Qq+d4Ypov7OuEha1BGpA9zUtppyaLEbb+t2hRpuah/j+utGTHIFMAuNWgqnuyFcJbrYaWY7INQ3XwbfN9B
Content-ID: <092F577709399D4796000526588D0262@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4974
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(136003)(39860400002)(396003)(1110001)(339900001)(189003)(199004)(476003)(25786009)(23726003)(26826003)(446003)(81156014)(47776003)(66066001)(81166006)(126002)(8746002)(22756006)(8936002)(70206006)(70586007)(76130400001)(2906002)(86362001)(486006)(3846002)(6116002)(478600001)(11346002)(33656002)(50466002)(46406003)(105606002)(58126008)(6486002)(99286004)(9686003)(6512007)(316002)(76176011)(33716001)(4326008)(186003)(6636002)(8676002)(97756001)(14444005)(6506007)(107886003)(305945005)(336012)(36906005)(1076003)(356004)(26005)(386003)(102836004)(7736002)(5660300002)(14454004)(54906003)(6862004)(6246003)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3292;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 63318e00-aa30-46ea-daa9-08d75e9b9fb5
NoDisclaimer: True
X-Forefront-PRVS: 020877E0CB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uR1+9JqDO8Teupo/o1dBTmTJNHOW04YRo8P1rnTY4TuKSXA0EACH7p3GfBeHWxMgPEFiapznNjZmkIGUCVN67RGt16wTlC5tYjhg9WU+isvfnJok/iCATuUk4fKvnrzFnPszb5GiAVB0SGVJeH42fHI6gp1FgRG41HKInWZkzoALfrYQwHWeKOjxWZds+QtWVSHMyFdrATU3Aav/xcXxoMLjWm2w3J2exHk2QALBH9zlQgiCSxCjdyQKZalnD9u1o2/lGPzd00L3zynrN79h+AfDzfVQVaaMHwZzhcoi6dfbpL7h4xAjxkxgxcQgGu8KzGWLWfAeXJgLQYv58a+EMPqPZnYvMpsHnEQgUYLdfHdXJPG3GPJTD5WF5TX5KvOFB3a+8yiL2+QK9BGqVw2U1TGJb86p/0n8JP3gUu4pzLABpvfE3uzS8I1O87875dQx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2019 07:18:08.4673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffc0905-9cd1-42c4-6fc4-08d75e9ba577
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3292
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46CzLcWXD4HYYn+903EucSbZGVfkNKRZbANPHKz/d2M=;
 b=m9LpPqgICl9Qt4P7b8lQJ0HXHhDP6hcVvL5R8CwDQHcucArB6Rx3TTQ0eauZY2S/bupnlEDTvrcg/4OPuMCZJ0cihW8gCXYaV+ZK54sk12m8u5tLWSnjINHJgW5hlD98gLpo2JmeoRDEohU/539lNTO6mjjr3RkyBRMMfthDJ4c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46CzLcWXD4HYYn+903EucSbZGVfkNKRZbANPHKz/d2M=;
 b=m9LpPqgICl9Qt4P7b8lQJ0HXHhDP6hcVvL5R8CwDQHcucArB6Rx3TTQ0eauZY2S/bupnlEDTvrcg/4OPuMCZJ0cihW8gCXYaV+ZK54sk12m8u5tLWSnjINHJgW5hlD98gLpo2JmeoRDEohU/539lNTO6mjjr3RkyBRMMfthDJ4c=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: "Lowry Li \(Arm
 Technology China\)" <Lowry.Li@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDQ6NDc6MjlQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBFeHRyYSBkZXRhaWwgKG5vcm1hbGx5IG9mZikgYWxtb3N0IG5ldmVyIGh1cnRz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZA
YXJtLmNvbT4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENo
aW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAxMSArKysrKysrKysrKwo+ICBkcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jIHwgIDQgKysrKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAo+IGluZGV4IDQ4MDkwMDBjMWVm
Yi4uZDlmYzljNDg4NTlhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmgKPiBAQCAtNTEsNiArNTEsMTMgQEAKPiAgCj4gICNkZWZpbmUg
S09NRURBX1dBUk5fRVZFTlRTCUtPTUVEQV9FUlJfQ1NDRQo+ICAKPiArI2RlZmluZSBLT01FREFf
SU5GT19FVkVOVFMgKHswIFwKPiArCQkJICAgIHwgS09NRURBX0VWRU5UX1ZTWU5DIFwKPiArCQkJ
ICAgIHwgS09NRURBX0VWRU5UX0ZMSVAgXAo+ICsJCQkgICAgfCBLT01FREFfRVZFTlRfRU9XIFwK
PiArCQkJICAgIHwgS09NRURBX0VWRU5UX01PREUgXAo+ICsJCQkgICAgfSkKPiArCj4gIC8qIG1h
bGlkcCBkZXZpY2UgaWQgKi8KPiAgZW51bSB7Cj4gIAlNQUxJX0Q3MSA9IDAsCj4gQEAgLTIxMSw2
ICsyMTgsMTAgQEAgc3RydWN0IGtvbWVkYV9kZXYgewo+ICAJdTE2IGVycl92ZXJib3NpdHk7Cj4g
IAkvKiBQcmludCBhIHNpbmdsZSBsaW5lIHBlciBlcnJvciBwZXIgZnJhbWUgd2l0aCBlcnJvciBl
dmVudHMuICovCj4gICNkZWZpbmUgS09NRURBX0RFVl9QUklOVF9FUlJfRVZFTlRTIEJJVCgwKQo+
ICsJLyogUHJpbnQgYSBzaW5nbGUgbGluZSBwZXIgd2FybmluZyBwZXIgZnJhbWUgd2l0aCBlcnJv
ciBldmVudHMuICovCj4gKyNkZWZpbmUgS09NRURBX0RFVl9QUklOVF9XQVJOX0VWRU5UUyBCSVQo
MSkKPiArCS8qIFByaW50IGEgc2luZ2xlIGxpbmUgcGVyIGluZm8gZXZlbnQgcGVyIGZyYW1lIHdp
dGggZXJyb3IgZXZlbnRzLiAqLwo+ICsjZGVmaW5lIEtPTUVEQV9ERVZfUFJJTlRfSU5GT19FVkVO
VFMgQklUKDIpCj4gIAkvKiBEdW1wIERSTSBzdGF0ZSBvbiBhbiBlcnJvciBvciB3YXJuaW5nIGV2
ZW50LiAqLwo+ICAjZGVmaW5lIEtPTUVEQV9ERVZfUFJJTlRfRFVNUF9TVEFURV9PTl9FVkVOVCBC
SVQoOCkKPiAgfTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZXZlbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2V2ZW50LmMKPiBpbmRleCA1ZGE2MWU3ZDc1ZDUuLmJmODg0NjNiYjRkOSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQu
Ywo+IEBAIC0xMjQsNiArMTI0LDEwIEBAIHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qg
a29tZWRhX2V2ZW50cyAqZXZ0cywgc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgCj4gIAlpZiAo
ZXJyX3ZlcmJvc2l0eSAmIEtPTUVEQV9ERVZfUFJJTlRfRVJSX0VWRU5UUykKPiAgCQlwcmludF9l
dnRzIHw9IEtPTUVEQV9FUlJfRVZFTlRTOwo+ICsJaWYgKGVycl92ZXJib3NpdHkgJiBLT01FREFf
REVWX1BSSU5UX1dBUk5fRVZFTlRTKQo+ICsJCXByaW50X2V2dHMgfD0gS09NRURBX1dBUk5fRVZF
TlRTOwo+ICsJaWYgKGVycl92ZXJib3NpdHkgJiBLT01FREFfREVWX1BSSU5UX0lORk9fRVZFTlRT
KQo+ICsJCXByaW50X2V2dHMgfD0gS09NRURBX0lORk9fRVZFTlRTOwo+ICAKPiAgCWlmIChldnRz
X21hc2sgJiBwcmludF9ldnRzKSB7Cj4gIAkJY2hhciBtc2dbMjU2XTsKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
