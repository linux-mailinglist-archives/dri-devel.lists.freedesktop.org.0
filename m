Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E8D8DF6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 12:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABB26E072;
	Wed, 16 Oct 2019 10:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33ED26E072
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 10:34:21 +0000 (UTC)
Received: from AM4PR08CA0061.eurprd08.prod.outlook.com (2603:10a6:205:2::32)
 by AM4PR08MB2785.eurprd08.prod.outlook.com (2603:10a6:205:5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Wed, 16 Oct
 2019 10:34:16 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by AM4PR08CA0061.outlook.office365.com
 (2603:10a6:205:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 10:34:16 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 10:34:15 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Wed, 16 Oct 2019 10:34:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 067d89d41c5ecfaf
X-CR-MTA-TID: 64aa7808
Received: from 86eb13a6e5c8.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A87B71A0-EBA1-45C9-B8C9-06C94C3A2FB4.1; 
 Wed, 16 Oct 2019 10:34:03 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 86eb13a6e5c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 10:34:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8iISnhWFe2qJI6HwJibyaVRP4WtgJrMWECkxVU0tcpUky7kOTMGg//FVLDw8lubzFoSOGHCipr54ZTan69NvuzES+j5sRvDjzrhN8UXqJBo4o4fqoSS+AW2evEULMMbWneq79g8Fg4L4svcyxVw7xMq17PWoLPSxVgBBSYuQlT/tGQrB+dXZrYpnGxYmji0iscIWve9YliJYj5TjWJ4gfJeR5ywsj2oFuPlMde0UuBDKhDypjDUS9QwJTMzLDqnDEZhP8CoIbqbSi6bb4UCA4oMFgFagG3tPIt1JcJnQsSr/TgbuVOh9D+7JulZ++MhwY2W5IXbQQwZvO3LGYJ5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvsOmkRSMnj04Xocdc9OWJufW8g0vLPexZfqLFFKCwQ=;
 b=JFP1P47ppOVh8mYwqM/SpLsXvr57vgHYeq/R0E4tTCf1CfjhOUjcfdfpK2PMmUgFTWWuB/8iESBiwk+TD1bRlhkaNzYy8Gk2ztmAp9qfomfn8OZakeBBNzX2SybObjy32YkAkI5aMZZlIN2AzjADchPW3iDT7UJ6vgZm+xyDK0N/5Yxd18vRlumz5/atEQTDxm1ECEA7vbUkgR0vaniZxhjoUsBAjSQwr4PVtALb2jK6PGBdnLUFJOEob5FCJv5tgafdOBZVby4Ds7x2+BOxEGN+yPxXVRMKj4zqzSseebJxgbxgB4yDqYQMa8w9jYpDLlptRaltJjZFqupFROodrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5182.eurprd08.prod.outlook.com (20.179.31.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 10:34:01 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 10:34:00 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v5 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH v5 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHVhA05K3a87ww2REG7o6++3/JrAw==
Date: Wed, 16 Oct 2019 10:34:00 +0000
Message-ID: <20191016103339.25858-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:36::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 559bb930-f0d5-405d-f803-08d75224644d
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5182:|VE1PR08MB5182:|AM4PR08MB2785:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR08MB2785C4EE1BBC2346DA1B650DB3920@AM4PR08MB2785.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(199004)(189003)(1076003)(64756008)(66446008)(66946007)(66556008)(66476007)(2171002)(6486002)(66066001)(71190400001)(8676002)(2201001)(14454004)(6436002)(71200400001)(5660300002)(81166006)(81156014)(36756003)(2501003)(52116002)(966005)(386003)(6506007)(86362001)(25786009)(256004)(476003)(2616005)(305945005)(3846002)(8936002)(186003)(103116003)(14444005)(6512007)(6306002)(478600001)(6116002)(55236004)(2906002)(486006)(54906003)(50226002)(4326008)(7736002)(110136005)(26005)(316002)(102836004)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5182;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7BYgXXZyQp5E1wGKJEj1/up+hh/TsA2jHt/bLL/bDBJNfR1ir0/nNEm2RZsKV4yqfqm0DVQICevpIfQiay2AsTEC/lKW/ndhG7hVqvGDwuD6+mbQGedYzEzkCIqCS8mq6pQkyN4jQBs67fcfDF2R41uRLeXAchjospAPFHXfTDqtLgeiTwhI9dPCUCQMqc4VlbupyV4EyQ7VnfJaKITn6bsVJkU4cN7v0rEmswmcZOxD0iz5/pSDeMFY482UrNo4sLkg8VFBND6CugHr5AiaKD9jAfD+iKw/a1gs1EjnPkfMhUifLS+UlkO2IwUG+3+P0dwPjLd33UbgMnbnO6O5AYXOWxqWSRp3P2/1UcBthpdc2LV8kf9FJvGtARpWfMwRJ2A7mjkJ3tW+rAwXEg4O7IkHb7oP38BwQF6q2knHribnKQG5g7CPiauKDp93cqrn7gmgXUmwGSqghPUDps0riA==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5182
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(189003)(199004)(1076003)(99286004)(356004)(47776003)(26005)(7736002)(70586007)(305945005)(86362001)(186003)(23756003)(336012)(50466002)(5660300002)(76130400001)(36756003)(22756006)(2501003)(70206006)(14454004)(2201001)(54906003)(66066001)(110136005)(6306002)(3846002)(966005)(478600001)(8746002)(14444005)(6512007)(6506007)(6116002)(386003)(26826003)(36906005)(63350400001)(103116003)(2906002)(316002)(126002)(476003)(25786009)(6486002)(2616005)(486006)(50226002)(81156014)(8936002)(4326008)(102836004)(8676002)(81166006)(2171002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR08MB2785;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e3c7f39e-3024-4f0b-006a-08d752245b74
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jlUIGrhvj06SJs8rXRfmgrSOGIEGSLELkY/gUXmA9rN1Lr1qppHC2s7pGOC6Duez8vJ3C1N+b/77RF5DAId/yVHWPiiJz+TGScmQA1xBVejGZ7HqDOcXI2bKuKbYnXnn2cOkji2sJ3/WPKuyusZBxVxMjA1PbeSXAy0j1gq4LlwvmzqBVgS3ulH+Lr5ipHp0jgX8XX4sOJhntjL7YXf+3wSNJRfaf7fapS4VVvxwa2hhtWUGblKQ/Gad9VLMSiBUNkxJCLhYKpAdXBEa8ypsdFmXvbOddo7Qlu6AVZl4EW3r9h9FrfOWmNhNli9xNfZcNDzhjJq4GgWqPRnLatEz8Vylk+SP8QEDPeQNAVP6DYIFuJU3dwr9jy0w1XSTR39/0NnMQwy6VAoNltI7rJVUbMdl0zaz0cARRrZIx79Bsb2ulBvh9h2lwoNj5zu0n5ZGMoUUNU8ht8e+4ho/oKiMzA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 10:34:15.0755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 559bb930-f0d5-405d-f803-08d75224644d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2785
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvsOmkRSMnj04Xocdc9OWJufW8g0vLPexZfqLFFKCwQ=;
 b=IMqnCyzH9IoGOtSeJ3uV2xJk3fmsR8qKo/Zc/Cw4MM+eS1Zs/397c0Mlri7nDdiiYH2oQpXiqzrdUeY2abJ8Bvk1XXR/n9+r28lcsiz8Zj7q81LUgTsomXzHoNPGl7HNLgFTyUFi1wJvOd+iwK+oHROeud+lq0zYN5Gx6czJDKM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvsOmkRSMnj04Xocdc9OWJufW8g0vLPexZfqLFFKCwQ=;
 b=IMqnCyzH9IoGOtSeJ3uV2xJk3fmsR8qKo/Zc/Cw4MM+eS1Zs/397c0Mlri7nDdiiYH2oQpXiqzrdUeY2abJ8Bvk1XXR/n9+r28lcsiz8Zj7q81LUgTsomXzHoNPGl7HNLgFTyUFi1wJvOd+iwK+oHROeud+lq0zYN5Gx6czJDKM=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgZW5hYmxlIENSVEMgY29sb3ItbWdtdCBmb3Iga29tZWRhIGRyaXZlciwgZm9y
IGN1cnJlbnQga29tZWRhIEhXCndoaWNoIG9ubHkgc3VwcG9ydHMgY29sb3IgY29udmVyc2lvbiBh
bmQgZm9yd2FyZCBnYW1tYSBmb3IgQ1JUQy4KClRoaXMgc2VyaWVzIGFjdHVhbGx5IGFyZSByZWdy
b3VwZWQgZnJvbToKLSBkcm0va29tZWRhOiBFbmFibGUgbGF5ZXIvcGxhbmUgY29sb3ItbWdtdDoK
ICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYwODkzLwoKLSBkcm0v
a29tZWRhOiBFbmFibGUgQ1JUQyBjb2xvci1tZ210CiAgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy82MTM3MC8KCkZvciByZW1vdmluZyB0aGUgZGVwZW5kZW5jZSBvbjoK
LSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzMwODc2LwoKTG93cnkg
TGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMSk6CiAgZHJtL2tvbWVkYTogQWRkcyBnYW1tYSBh
bmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMKCmphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgzKToKICBkcm0va29tZWRhOiBBZGQgYSBuZXcgaGVscGVy
IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24oKQogIGRybS9rb21lZGE6IEFkZCBkcm1fbHV0
X3RvX2ZnYW1tYV9jb2VmZnMoKQogIGRybS9rb21lZGE6IEFkZCBkcm1fY3RtX3RvX2NvZWZmcygp
Cgp2MjoKICBNb3ZlIHRoZSBmaXhwb2ludCBjb252ZXJzaW9uIGZ1bmN0aW9uIHMzMV8zMl90b19x
Ml8xMigpIHRvIGRybSBjb3JlCiAgYXMgYSBzaGFyZWQgaGVscGVyLgoKdjQ6CiAgQWRkcmVzcyBy
ZXZpZXcgY29tbWVudHMgZnJvbSBNaWhhaSwgRGFuaWVsIGFuZCBJbGlhLgoKVjU6Ci0gSW5jbHVk
ZXMgdGhlIHNpZ24gYml0IGluIHRoZSB2YWx1ZSBvZiBtIChRbS5uKS4KLSBSZWJhc2Ugd2l0aCBk
cm0tbWlzYy1uZXh0CgpMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgxKToKICBkcm0v
a29tZWRhOiBBZGRzIGdhbW1hIGFuZCBjb2xvci10cmFuc2Zvcm0gc3VwcG9ydCBmb3IgRE9VLUlQ
UwoKamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgKDMpOgogIGRybTogQWRk
IGEgbmV3IGhlbHBlciBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkKICBkcm0va29tZWRh
OiBBZGQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKCkKICBkcm0va29tZWRhOiBBZGQgZHJtX2N0
bV90b19jb2VmZnMoKQoKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
YyAgICB8IDIwICsrKysrKwogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdt
dC5jICAgIHwgNjYgKysrKysrKysrKysrKysrKysrKwogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY29sb3JfbWdtdC5oICAgIHwgMTAgKystCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2NydGMuYyAgfCAgMiArCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGlwZWxpbmUuaCAgfCAgMyArCiAuLi4vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVs
aW5lX3N0YXRlLmMgICAgfCAgNiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMg
ICAgICAgICAgICAgIHwgMjcgKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210Lmgg
ICAgICAgICAgICAgICAgICB8ICAyICsKIDggZmlsZXMgY2hhbmdlZCwgMTM1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCi0tCjIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
