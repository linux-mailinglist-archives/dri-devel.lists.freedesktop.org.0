Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD45DFD90
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 08:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A948E6E3D0;
	Tue, 22 Oct 2019 06:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30051.outbound.protection.outlook.com [40.107.3.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D346E3D0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 06:13:32 +0000 (UTC)
Received: from HE1PR0802CA0004.eurprd08.prod.outlook.com (2603:10a6:3:bd::14)
 by DB7PR08MB3387.eurprd08.prod.outlook.com (2603:10a6:10:45::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Tue, 22 Oct
 2019 06:13:28 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by HE1PR0802CA0004.outlook.office365.com
 (2603:10a6:3:bd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Tue, 22 Oct 2019 06:13:28 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Tue, 22 Oct 2019 06:13:26 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Tue, 22 Oct 2019 06:13:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d10b8234bfbb20e1
X-CR-MTA-TID: 64aa7808
Received: from 085b599e7582.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89BA12D9-596E-4F6A-BB45-80FAB1D18CB5.1; 
 Tue, 22 Oct 2019 06:13:09 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 085b599e7582.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Oct 2019 06:13:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTx+VYAtivY24J/22E1o2PHl7uExK1u91IUGKElszT/1PK537hUTYdqu5OusznsTaD3RHbgPoNcIb5yNQGYPelcKTSr3QpIx30p8dQyPdJqrwCca5rhJ79JDnRwDM1rgZ9LIW0c63W+gfObhdwJZs6OxrjbPOe1LvQGk1QhAhb1p8DZjlAbBQeh73hq/rjR0V7+KhnWBBz3vA8k2OM9Dx8qSS0vjZ4l9AWgPDwow9asH3jzP55IaBT8tfdmuGi9k54M88fAjfJxcRQ6Bdi2XkACxqX/loybZUtp3IUwlJ7lO6k8U1fpnxPlqufsZAQL+1XlFGxW89u1i4C53BXEuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GbJKUkPG3RcJEBjCMB+rANR/HZaXB5b+Cr7X95LjEE=;
 b=XMHavPQyETiT2E/l9Xa0gXr+MAjVZGLzGFDcy0kBOJ0WhKNZVr7fluKKOlR5upeu0xryCZZ7gGKwLAH1Tv37vHMheheqOHZfEcWiYV6AklOYfB2puC0CN3j5yRw1YXCKeelveOx+ltR8mWCsfLV94bUDAQ/vRRvBKe6j/DeNuOryIWqtleJTjqBgZsKpzuPRrRiFG7GKnks0PQU0DWcCvyh2uiT8+WDQJ24UeDAi/AlFD0yMIWp9excUMfkslGqzQmAHg/1uRKeVAPA8ttFrKRbzv7VyDe5J4qIifgJ7nN6E6zZiytrQt8nfbP0KhrQAk73MONjqyrfIouFrWPwRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5215.eurprd08.prod.outlook.com (20.179.30.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 06:13:05 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 06:13:05 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
Thread-Topic: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
Thread-Index: AQHViFjvrI6TSZ8K9kmI2e7gEmpbY6dmLsqA
Date: Tue, 22 Oct 2019 06:13:05 +0000
Message-ID: <20191022061255.GA7512@jamwan02-TSP300>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-5-robh@kernel.org>
In-Reply-To: <20191021214550.1461-5-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0004.apcprd04.prod.outlook.com
 (2603:1096:202:2::14) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 21473747-3a0f-4a92-50b5-08d756b6f3c8
X-MS-TrafficTypeDiagnostic: VE1PR08MB5215:|VE1PR08MB5215:|DB7PR08MB3387:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3387D3171E060F2544569282B3680@DB7PR08MB3387.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:52;OLM:52;
x-forefront-prvs: 01986AE76B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(366004)(396003)(136003)(376002)(346002)(39860400002)(199004)(189003)(256004)(14444005)(186003)(26005)(446003)(66066001)(102836004)(55236004)(11346002)(6506007)(76176011)(386003)(486006)(476003)(1076003)(52116002)(66574012)(5660300002)(316002)(58126008)(54906003)(478600001)(14454004)(71190400001)(71200400001)(25786009)(305945005)(7416002)(7406005)(6486002)(81166006)(33716001)(8936002)(8676002)(86362001)(7736002)(81156014)(229853002)(4326008)(6246003)(99286004)(2906002)(9686003)(6512007)(6116002)(66446008)(6916009)(66946007)(66476007)(66556008)(6436002)(64756008)(3846002)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5215;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2lTtwbyEp136krTq0bT+VLjZ5ll/UXigxmmO5NbJPHW47JzbTiw5U5doGSu2k2uSCG5klXdwjQXppOzX15qpSIbx2ewfpTlhB0YCy6Byq8fbm2tKUFDdRKCJex6Qlxj+enc9VYZ/S2BQwecA4zjKjl1Iqv8jhonr8aIYsE07iFm5yutsOIoqiN8IY8rN/VLmYG+kN8ocbSqChvGoXDln/Wq7BGZ2qzVuqfMcpX6DEoUctzrY06N3uuVsegLXi2shqTRa51ZMRw5+WDtIo8ma8QI8CWEkMFN8B1+2PVSr+XdtA4b9bDGll7lP+W7T/sImmMa6U02L4AJXnhKA/OnrPGb0yk4q7vYdZUVhTKWib4PTspsjE4JJaMmtItoKkErpvDBN1l2vfz7DPFK49kD6MLR2aIEoyEdFhfA+Ggw2X5rK9m74x/hYGL3hx9SU03w+
Content-ID: <68B64C555405DD408B961B43E6BC14EA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5215
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(316002)(9686003)(58126008)(33656002)(6512007)(356004)(76176011)(25786009)(54906003)(50466002)(6246003)(486006)(23756003)(4326008)(6862004)(2906002)(8936002)(14454004)(8676002)(8746002)(81166006)(81156014)(22756006)(99286004)(70206006)(70586007)(33716001)(26826003)(102836004)(47776003)(11346002)(478600001)(76130400001)(6506007)(5660300002)(66066001)(6486002)(229853002)(63350400001)(186003)(14444005)(26005)(446003)(476003)(1076003)(126002)(6116002)(86362001)(3846002)(336012)(305945005)(66574012)(7736002)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3387;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a71d29fd-6417-46b7-a849-08d756b6e6b7
NoDisclaimer: True
X-Forefront-PRVS: 01986AE76B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +eJZRlReqGCh/9Vty5DRBP1Wqk7pSzP0Yb/6R9slhmUdwRwYdwkY94Zdxb/Y1uDiDT3xMDr38h1H1UjYTB1Ta8Mh7BSHPb4a/qVVtCOGiS30Z4aLQ5DWxWkdAqPcWLp212gYct7JQ0UlaBf36IPkdDbJDp/fdqgJsNxGV5RnEq24OXWhGZh5tWCp3EBUcXmonP4RINm2TRoP6Dmampec6W1fFnUgk/3jsWoInM7kX1gS0aR952lSjVLSKmO2ftakeQF1vQTCY2ePU2lKUIhl94/Zudwc26FW6QpxZ1TQ4EZ0sFwIqCQ+V45OFu+fOoa6KAY3eJX/AMkgoej/JnhSqrm3n3WhMCdzCINCzUOxnMpenCPk33uY9za+sQpzjdaGZdhTDHkcJXJuoaPKLsCX7Hl5GFa7vN9JrDsqpjO0pVfJcCZ4QUhk+6Kjd3qJToWj
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2019 06:13:26.9581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21473747-3a0f-4a92-50b5-08d756b6f3c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3387
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GbJKUkPG3RcJEBjCMB+rANR/HZaXB5b+Cr7X95LjEE=;
 b=48Dk3GduP5rAStkaH/Cpl3hBEo1VmF6KfJq9HHMzqZeECb72lp+VF7M6PHkLkZTQIUK06q1rxEsP1l0w4eV7MBPq3b8C+zCocVs8p6uwht+PS6WqXGo/6Mc+7cnR+mHDzNojhoCBAswUPgBimeV/aBVfvQ0N5+iwC/zoVPQSQpY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GbJKUkPG3RcJEBjCMB+rANR/HZaXB5b+Cr7X95LjEE=;
 b=48Dk3GduP5rAStkaH/Cpl3hBEo1VmF6KfJq9HHMzqZeECb72lp+VF7M6PHkLkZTQIUK06q1rxEsP1l0w4eV7MBPq3b8C+zCocVs8p6uwht+PS6WqXGo/6Mc+7cnR+mHDzNojhoCBAswUPgBimeV/aBVfvQ0N5+iwC/zoVPQSQpY=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Philippe Cornu <philippe.cornu@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDQ6NDU6NDhQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gQWRkIHN1cHBvcnQgaW4gQ01BIGhlbHBlcnMgdG8gaGFuZGxlIGNhbGxlcnMgc3BlY2lm
eWluZwo+IERSTV9NT0RFX0RVTUJfS0VSTkVMX01BUCBmbGFnLiBFeGlzdGluZyBiZWhhdmlvciBp
cyBtYWludGFpbmVkIHdpdGggdGhpcwo+IGNoYW5nZS4gZHJtX2dlbV9jbWFfZHVtYl9jcmVhdGUo
KSBhbHdheXMgY3JlYXRlcyBhIGtlcm5lbCBtYXBwaW5nIGFzCj4gYmVmb3JlLiBkcm1fZ2VtX2Nt
YV9kdW1iX2NyZWF0ZV9pbnRlcm5hbCgpIGxldHMgdGhlIGNhbGxlciBzZXQgdGhlIGZsYWdzCj4g
YXMgZGVzaXJlZC4gVGhlcmVmb3JlLCB1cGRhdGUgYWxsIHRoZSBleGlzdGluZyBjYWxsZXJzIG9m
Cj4gZHJtX2dlbV9jbWFfZHVtYl9jcmVhdGVfaW50ZXJuYWwoKSB0byBhbHNvIHNldCB0aGUKPiBE
Uk1fTU9ERV9EVU1CX0tFUk5FTF9NQVAgZmxhZy4KPiAKPiBDYzogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8
bXJpcGFyZEBrZXJuZWwub3JnPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6ICJKYW1lcyAoUWlhbikgV2FuZyIgPGphbWVzLnFpYW4ud2Fu
Z0Bhcm0uY29tPgo+IENjOiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KPiBDYzog
QnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgo+IENjOiBOZWlsIEFybXN0cm9u
ZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gQ2M6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBi
YXlsaWJyZS5jb20+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KPiBDYzogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVz
YXNAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNv
bT4KPiBDYzogIkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgo+IENjOiBZYW5uaWNr
IEZlcnRyZSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgo+IENjOiBQaGlsaXBwZSBDb3JudSA8cGhp
bGlwcGUuY29ybnVAc3QuY29tPgo+IENjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2Fp
Z25hcmRAbGluYXJvLm9yZz4KPiBDYzogVmluY2VudCBBYnJpb3UgPHZpbmNlbnQuYWJyaW91QHN0
LmNvbT4KPiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+
IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4KPiBDYzogQ2hl
bi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+IENjOiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6
IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1yb2NrY2hpcEBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+
IC0tLQo+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jICAgfCAg
MSArCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jICAgICAgICAgICAgICB8ICAx
ICsKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jICAgICAgICAgIHwgNDgg
KysrKysrKysrKystLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMg
ICAgICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21z
LmMgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV9nZW0uYyAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYyAgICAg
ICAgICAgICB8ICAxICsKPiAgOCBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuYwo+IGluZGV4IGQ0OTc3MmRlOTNlMC4uN2NmMGRjNGNiZmMxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiBA
QCAtMzEsNiArMzEsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV9nZW1fY21hX2R1bWJfY3JlYXRlKHN0
cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiAgCXUzMiBwaXRjaCA9IERJVl9ST1VORF9VUChhcmdzLT53
aWR0aCAqIGFyZ3MtPmJwcCwgOCk7Cj4gIAo+ICAJYXJncy0+cGl0Y2ggPSBBTElHTihwaXRjaCwg
bWRldi0+Y2hpcC5idXNfd2lkdGgpOwo+ICsJYXJncy0+ZmxhZ3MgPSBEUk1fTU9ERV9EVU1CX0tF
Uk5FTF9NQVA7Cj4KCkhpIFJvYjoKCmtvbWVkYSBkb2Vzbid0IG5lZWQgdGhlIGtlcm5lbCBtYXAg
ZWl0aGVyLCBzbyB5b3UgY2FuIGRlbCB0aGlzIGxpbmUgZm9yIGtvbWVkYS4KYW5kIHdpdGggdGhp
cy4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8
amFtZXMucWlhbi53YW5nQGFybS5jb20+CgoKPiAgCXJldHVybiBkcm1fZ2VtX2NtYV9kdW1iX2Ny
ZWF0ZV9pbnRlcm5hbChmaWxlLCBkZXYsIGFyZ3MpOwo+ICB9Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBf
ZHJ2LmMKPiBpbmRleCA4YTc2MzE1YWFhMGYuLmFlYjFhNzc5ZWNjMSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX2Rydi5jCj4gQEAgLTQ2NSw2ICs0NjUsNyBAQCBzdGF0aWMgaW50IG1hbGlkcF9k
dW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKPiAgCXU4IGFsaWdubWVudCA9
IG1hbGlkcF9od19nZXRfcGl0Y2hfYWxpZ24obWFsaWRwLT5kZXYsIDEpOwo+ICAKPiAgCWFyZ3Mt
PnBpdGNoID0gQUxJR04oRElWX1JPVU5EX1VQKGFyZ3MtPndpZHRoICogYXJncy0+YnBwLCA4KSwg
YWxpZ25tZW50KTsKPiArCWFyZ3MtPmZsYWdzID0gRFJNX01PREVfRFVNQl9LRVJORUxfTUFQOwo+
ICAKPiAgCXJldHVybiBkcm1fZ2VtX2NtYV9kdW1iX2NyZWF0ZV9pbnRlcm5hbChmaWxlX3ByaXYs
IGRybSwgYXJncyk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
Y21hX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCj4gaW5k
ZXggNGNlYmZlMDFlNmVhLi5mOTFlOWU4YWRlYWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
Y21hX2hlbHBlci5jCj4gQEAgLTc4LDIxICs3OCw4IEBAIF9fZHJtX2dlbV9jbWFfY3JlYXRlKHN0
cnVjdCBkcm1fZGV2aWNlICpkcm0sIHNpemVfdCBzaXplKQo+ICAJcmV0dXJuIEVSUl9QVFIocmV0
KTsKPiAgfQo+ICAKPiAtLyoqCj4gLSAqIGRybV9nZW1fY21hX2NyZWF0ZSAtIGFsbG9jYXRlIGFu
IG9iamVjdCB3aXRoIHRoZSBnaXZlbiBzaXplCj4gLSAqIEBkcm06IERSTSBkZXZpY2UKPiAtICog
QHNpemU6IHNpemUgb2YgdGhlIG9iamVjdCB0byBhbGxvY2F0ZQo+IC0gKgo+IC0gKiBUaGlzIGZ1
bmN0aW9uIGNyZWF0ZXMgYSBDTUEgR0VNIG9iamVjdCBhbmQgYWxsb2NhdGVzIGEgY29udGlndW91
cyBjaHVuayBvZgo+IC0gKiBtZW1vcnkgYXMgYmFja2luZyBzdG9yZS4gVGhlIGJhY2tpbmcgbWVt
b3J5IGhhcyB0aGUgd3JpdGVjb21iaW5lIGF0dHJpYnV0ZQo+IC0gKiBzZXQuCj4gLSAqCj4gLSAq
IFJldHVybnM6Cj4gLSAqIEEgc3RydWN0IGRybV9nZW1fY21hX29iamVjdCAqIG9uIHN1Y2Nlc3Mg
b3IgYW4gRVJSX1BUUigpLWVuY29kZWQgbmVnYXRpdmUKPiAtICogZXJyb3IgY29kZSBvbiBmYWls
dXJlLgo+IC0gKi8KPiAtc3RydWN0IGRybV9nZW1fY21hX29iamVjdCAqZHJtX2dlbV9jbWFfY3Jl
YXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCj4gLQkJCQkJICAgICAgc2l6ZV90IHNpemUpCj4g
K3N0YXRpYyBzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICoKPiArZHJtX2dlbV9jbWFfY3JlYXRl
X2ZsYWdzKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHNpemVfdCBzaXplLCB1MzIgZmxhZ3MpCj4g
IHsKPiAgCXN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKmNtYV9vYmo7Cj4gIAlpbnQgcmV0Owo+
IEBAIC0xMDMsNiArOTAsOSBAQCBzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICpkcm1fZ2VtX2Nt
YV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKPiAgCWlmIChJU19FUlIoY21hX29iaikp
Cj4gIAkJcmV0dXJuIGNtYV9vYmo7Cj4gIAo+ICsJaWYgKCEoZmxhZ3MgJiBEUk1fTU9ERV9EVU1C
X0tFUk5FTF9NQVApKQo+ICsJCWNtYV9vYmotPmRtYV9hdHRycyB8PSBETUFfQVRUUl9OT19LRVJO
RUxfTUFQUElORzsKPiArCj4gIAljbWFfb2JqLT52YWRkciA9IGRtYV9hbGxvY19hdHRycyhkcm0t
PmRldiwgc2l6ZSwgJmNtYV9vYmotPnBhZGRyLAo+ICAJCQkJCSBHRlBfS0VSTkVMIHwgX19HRlBf
Tk9XQVJOLAo+ICAJCQkJCSBjbWFfb2JqLT5kbWFfYXR0cnMpOwo+IEBAIC0xMTksNiArMTA5LDI1
IEBAIHN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKmRybV9nZW1fY21hX2NyZWF0ZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtLAo+ICAJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKCZjbWFfb2Jq
LT5iYXNlKTsKPiAgCXJldHVybiBFUlJfUFRSKHJldCk7Cj4gIH0KPiArCj4gKy8qKgo+ICsgKiBk
cm1fZ2VtX2NtYV9jcmVhdGUgLSBhbGxvY2F0ZSBhbiBvYmplY3Qgd2l0aCB0aGUgZ2l2ZW4gc2l6
ZQo+ICsgKiBAZHJtOiBEUk0gZGV2aWNlCj4gKyAqIEBzaXplOiBzaXplIG9mIHRoZSBvYmplY3Qg
dG8gYWxsb2NhdGUKPiArICoKPiArICogVGhpcyBmdW5jdGlvbiBjcmVhdGVzIGEgQ01BIEdFTSBv
YmplY3QgYW5kIGFsbG9jYXRlcyBhIGNvbnRpZ3VvdXMgY2h1bmsgb2YKPiArICogbWVtb3J5IGFz
IGJhY2tpbmcgc3RvcmUuIFRoZSBiYWNraW5nIG1lbW9yeSBoYXMgdGhlIHdyaXRlY29tYmluZSBh
dHRyaWJ1dGUKPiArICogc2V0Lgo+ICsgKgo+ICsgKiBSZXR1cm5zOgo+ICsgKiBBIHN0cnVjdCBk
cm1fZ2VtX2NtYV9vYmplY3QgKiBvbiBzdWNjZXNzIG9yIGFuIEVSUl9QVFIoKS1lbmNvZGVkIG5l
Z2F0aXZlCj4gKyAqIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPiArICovCj4gK3N0cnVjdCBkcm1f
Z2VtX2NtYV9vYmplY3QgKmRybV9nZW1fY21hX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
LAo+ICsJCQkJCSAgICAgIHNpemVfdCBzaXplKQo+ICt7Cj4gKwlyZXR1cm4gZHJtX2dlbV9jbWFf
Y3JlYXRlX2ZsYWdzKGRybSwgc2l6ZSwgRFJNX01PREVfRFVNQl9LRVJORUxfTUFQKTsKPiArfQo+
ICBFWFBPUlRfU1lNQk9MX0dQTChkcm1fZ2VtX2NtYV9jcmVhdGUpOwo+ICAKPiAgLyoqCj4gQEAg
LTEzOSwxNCArMTQ4LDE0IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGRybV9nZW1fY21hX2NyZWF0ZSk7
Cj4gICAqLwo+ICBzdGF0aWMgc3RydWN0IGRybV9nZW1fY21hX29iamVjdCAqCj4gIGRybV9nZW1f
Y21hX2NyZWF0ZV93aXRoX2hhbmRsZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKPiAtCQkJ
ICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHNpemVfdCBzaXplLAo+ICsJCQkgICAgICAg
c3RydWN0IGRybV9kZXZpY2UgKmRybSwgc2l6ZV90IHNpemUsIHUzMiBmbGFncywKPiAgCQkJICAg
ICAgIHVpbnQzMl90ICpoYW5kbGUpCj4gIHsKPiAgCXN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3Qg
KmNtYV9vYmo7Cj4gIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmo7Cj4gIAlpbnQgcmV0
Owo+ICAKPiAtCWNtYV9vYmogPSBkcm1fZ2VtX2NtYV9jcmVhdGUoZHJtLCBzaXplKTsKPiArCWNt
YV9vYmogPSBkcm1fZ2VtX2NtYV9jcmVhdGVfZmxhZ3MoZHJtLCBzaXplLCBmbGFncyk7Cj4gIAlp
ZiAoSVNfRVJSKGNtYV9vYmopKQo+ICAJCXJldHVybiBjbWFfb2JqOwo+ICAKPiBAQCAtMjI1LDcg
KzIzNCw3IEBAIGludCBkcm1fZ2VtX2NtYV9kdW1iX2NyZWF0ZV9pbnRlcm5hbChzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbGVfcHJpdiwKPiAgCQlhcmdzLT5zaXplID0gYXJncy0+cGl0Y2ggKiBhcmdzLT5o
ZWlnaHQ7Cj4gIAo+ICAJY21hX29iaiA9IGRybV9nZW1fY21hX2NyZWF0ZV93aXRoX2hhbmRsZShm
aWxlX3ByaXYsIGRybSwgYXJncy0+c2l6ZSwKPiAtCQkJCQkJICZhcmdzLT5oYW5kbGUpOwo+ICsJ
CQkJCQkgYXJncy0+ZmxhZ3MsICZhcmdzLT5oYW5kbGUpOwo+ICAJcmV0dXJuIFBUUl9FUlJfT1Jf
WkVSTyhjbWFfb2JqKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChkcm1fZ2VtX2NtYV9kdW1i
X2NyZWF0ZV9pbnRlcm5hbCk7Cj4gQEAgLTI1Niw5ICsyNjUsMTAgQEAgaW50IGRybV9nZW1fY21h
X2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LAo+ICAKPiAgCWFyZ3MtPnBp
dGNoID0gRElWX1JPVU5EX1VQKGFyZ3MtPndpZHRoICogYXJncy0+YnBwLCA4KTsKPiAgCWFyZ3Mt
PnNpemUgPSBhcmdzLT5waXRjaCAqIGFyZ3MtPmhlaWdodDsKPiArCWFyZ3MtPmZsYWdzID0gRFJN
X01PREVfRFVNQl9LRVJORUxfTUFQOwo+ICAKPiAgCWNtYV9vYmogPSBkcm1fZ2VtX2NtYV9jcmVh
dGVfd2l0aF9oYW5kbGUoZmlsZV9wcml2LCBkcm0sIGFyZ3MtPnNpemUsCj4gLQkJCQkJCSAmYXJn
cy0+aGFuZGxlKTsKPiArCQkJCQkJIGFyZ3MtPmZsYWdzLCAmYXJncy0+aGFuZGxlKTsKPiAgCXJl
dHVybiBQVFJfRVJSX09SX1pFUk8oY21hX29iaik7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwo
ZHJtX2dlbV9jbWFfZHVtYl9jcmVhdGUpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPiBp
bmRleCAzOTdjMzMxODJmNGYuLjE1OTM1MThkY2JlNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fZHJ2LmMKPiBAQCAtODEsNiArODEsNyBAQCBzdGF0aWMgaW50IG1lc29uX2R1bWJfY3JlYXRl
KHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgCSAqLwo+
ICAJYXJncy0+cGl0Y2ggPSBBTElHTihESVZfUk9VTkRfVVAoYXJncy0+d2lkdGggKiBhcmdzLT5i
cHAsIDgpLCBTWl82NCk7Cj4gIAlhcmdzLT5zaXplID0gUEFHRV9BTElHTihhcmdzLT5waXRjaCAq
IGFyZ3MtPmhlaWdodCk7Cj4gKwlhcmdzLT5mbGFncyA9IERSTV9NT0RFX0RVTUJfS0VSTkVMX01B
UDsKPiAgCj4gIAlyZXR1cm4gZHJtX2dlbV9jbWFfZHVtYl9jcmVhdGVfaW50ZXJuYWwoZmlsZSwg
ZGV2LCBhcmdzKTsKPiAgfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2R1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwo+IGlu
ZGV4IDJkYzljYWVlODc2Ny4uYzliMWYyOThjZTdlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2R1X2ttcy5jCj4gQEAgLTI5OSw2ICsyOTksNyBAQCBpbnQgcmNhcl9kdV9kdW1iX2Ny
ZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJ
YWxpZ24gPSAxNiAqIGFyZ3MtPmJwcCAvIDg7Cj4gIAo+ICAJYXJncy0+cGl0Y2ggPSByb3VuZHVw
KG1pbl9waXRjaCwgYWxpZ24pOwo+ICsJYXJncy0+ZmxhZ3MgPSBEUk1fTU9ERV9EVU1CX0tFUk5F
TF9NQVA7Cj4gIAo+ICAJcmV0dXJuIGRybV9nZW1fY21hX2R1bWJfY3JlYXRlX2ludGVybmFsKGZp
bGUsIGRldiwgYXJncyk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fZ2VtLmMKPiBpbmRleCA3NTgyZDBlNmE2MGEuLmYwOWI5YTAzNTM3NiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2dlbS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9nZW0uYwo+IEBAIC00MTksNiAr
NDE5LDcgQEAgaW50IHJvY2tjaGlwX2dlbV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGVfcHJpdiwKPiAgCSAqIGFsaWduIHRvIDY0IGJ5dGVzIHNpbmNlIE1hbGkgcmVxdWlyZXMgaXQu
Cj4gIAkgKi8KPiAgCWFyZ3MtPnBpdGNoID0gQUxJR04obWluX3BpdGNoLCA2NCk7Cj4gKwlhcmdz
LT5mbGFncyA9IERSTV9NT0RFX0RVTUJfS0VSTkVMX01BUDsKPiAgCWFyZ3MtPnNpemUgPSBhcmdz
LT5waXRjaCAqIGFyZ3MtPmhlaWdodDsKPiAgCj4gIAlya19vYmogPSByb2NrY2hpcF9nZW1fY3Jl
YXRlX3dpdGhfaGFuZGxlKGZpbGVfcHJpdiwgZGV2LCBhcmdzLT5zaXplLAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYwo+
IGluZGV4IDVhOWY5YWNhOGJjMi4uMGY3NmE0YWM5NWIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zdG0vZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCj4gQEAg
LTQ3LDYgKzQ3LDcgQEAgc3RhdGljIGludCBzdG1fZ2VtX2NtYV9kdW1iX2NyZWF0ZShzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGUsCj4gIAkgKi8KPiAgCWFyZ3MtPnBpdGNoID0gcm91bmR1cChtaW5fcGl0
Y2gsIDEyOCk7Cj4gIAlhcmdzLT5oZWlnaHQgPSByb3VuZHVwKGFyZ3MtPmhlaWdodCwgNCk7Cj4g
KwlhcmdzLT5mbGFncyA9IERSTV9NT0RFX0RVTUJfS0VSTkVMX01BUDsKPiAgCj4gIAlyZXR1cm4g
ZHJtX2dlbV9jbWFfZHVtYl9jcmVhdGVfaW50ZXJuYWwoZmlsZSwgZGV2LCBhcmdzKTsKPiAgfQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMKPiBpbmRleCBhNTc1N2IxMWI3MzAuLmY2NTNhNWQx
ZTJkNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMKPiBAQCAtMzQsNiArMzQsNyBA
QCBzdGF0aWMgaW50IGRybV9zdW40aV9nZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpm
aWxlX3ByaXYsCj4gIHsKPiAgCS8qIFRoZSBoYXJkd2FyZSBvbmx5IGFsbG93cyBldmVuIHBpdGNo
ZXMgZm9yIFlVViBidWZmZXJzLiAqLwo+ICAJYXJncy0+cGl0Y2ggPSBBTElHTihESVZfUk9VTkRf
VVAoYXJncy0+d2lkdGggKiBhcmdzLT5icHAsIDgpLCAyKTsKPiArCWFyZ3MtPmZsYWdzID0gRFJN
X01PREVfRFVNQl9LRVJORUxfTUFQOwo+ICAKPiAgCXJldHVybiBkcm1fZ2VtX2NtYV9kdW1iX2Ny
ZWF0ZV9pbnRlcm5hbChmaWxlX3ByaXYsIGRybSwgYXJncyk7Cj4gIH0KPiAtLSAKPiAyLjIwLjEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
