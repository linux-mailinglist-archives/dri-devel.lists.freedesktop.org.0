Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5D3EBE21
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 07:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD786F6DF;
	Fri,  1 Nov 2019 06:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40060.outbound.protection.outlook.com [40.107.4.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E906F6DF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 06:53:53 +0000 (UTC)
Received: from VE1PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:803:104::14)
 by AM5PR0801MB2067.eurprd08.prod.outlook.com (2603:10a6:203:4c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23; Fri, 1 Nov
 2019 06:53:50 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VE1PR08CA0001.outlook.office365.com
 (2603:10a6:803:104::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17 via Frontend
 Transport; Fri, 1 Nov 2019 06:53:50 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Fri, 1 Nov 2019 06:53:50 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Fri, 01 Nov 2019 06:53:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: afc7a4bc6c2ddb6e
X-CR-MTA-TID: 64aa7808
Received: from 365a51563c8f.2 (cr-mta-lb-1.cr-mta-net [104.47.12.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8528E9D0-152F-4980-8CC2-034399548CFA.1; 
 Fri, 01 Nov 2019 06:53:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 365a51563c8f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Nov 2019 06:53:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oij4OC59eut+RWuoaJVA9wFpdtsFr8IV7+PrBPf72gSVbbJ97UQJC61PJSlNsO+HFQwbRcpRStQWAqqX63tZrGH3OPkt0NKjxdEBif9v9oO9FhNJeAroPvrLjgbGcvM1z4IhWTcx0pNzawDB+3DLlXpd+C433ej3SQf1e7axjj49XaxaounnmASG0weYkvh2xIMVL1qwljVkfTVDE8fVr8tXpHFymj0f7W1JPyfVrbI4ryycrLgRDl1oYvx3p9HJZH2UDq3hkUiDKm+6IuKzU93dFUMAjIi6yOjHFajBwUCMZdqdBcxj7gJnlna7iDkh9apyWPcA0/FjSz+ZGrpdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1D24k7HU0R9r/oHzcqJoqA3lobn3dtEv+1CmAU99Gg=;
 b=hcvqukfHrBzOWLzAltkJHpGPpPCTCSDVlqnGgc4KHHQ83P1EWPOU19wCzL+9RfOPM6uQnWTrXL65AmUDX5hCOI0GHDZbVep5bxYSiI0eRVysXgeztgI1RHs1sDdhiTlZuwgzrpuZPhJWeCxIgudnfCgMaS0w89GGCH/pgFbFSyEznkoR1opuKEmIHQs5mAKg4KsBztH9S7bSLq7VnuprnnBZVS6/X3hA4mtEFFucn+ckm5EvLR1YaE6B4uajjvKl8k6O0y+x6SciPlYzKUM+87sjpsMhVnC8c41Kg+uy1LlhKLBWOIoxAQZUw23CL8nmopCmmXWOXJ4SgtxMiI8KNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1SPR01MB0002.eurprd08.prod.outlook.com (20.179.193.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Fri, 1 Nov 2019 06:53:40 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2387.030; Fri, 1 Nov 2019
 06:53:40 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v8 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH v8 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHVkIEXNSRZprgrzkynrrlyleMEKQ==
Date: Fri, 1 Nov 2019 06:53:40 +0000
Message-ID: <20191101065319.29251-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52867ae3-563d-4bed-d6df-08d75e984062
X-MS-TrafficTypeDiagnostic: VE1SPR01MB0002:|VE1SPR01MB0002:|AM5PR0801MB2067:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20673C18DA08DF7521ECD9BAB3620@AM5PR0801MB2067.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 020877E0CB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(66066001)(2616005)(486006)(36756003)(8676002)(966005)(14454004)(5660300002)(476003)(103116003)(2501003)(2171002)(86362001)(3846002)(6116002)(305945005)(2201001)(25786009)(1076003)(6512007)(66476007)(52116002)(71200400001)(71190400001)(386003)(55236004)(6506007)(6436002)(102836004)(6486002)(7736002)(14444005)(6306002)(186003)(99286004)(8936002)(110136005)(4326008)(54906003)(50226002)(478600001)(64756008)(2906002)(66446008)(81156014)(66556008)(316002)(66946007)(81166006)(256004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1SPR01MB0002;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BO5NfdAZIUNwy+Y+uzRGCp2N7fan96Vx46NItzUSQk3DW/dmkAtNlv11pI7A+BIpouWH2ts9qUM/MjlpFBCzsp++jUrIDztpJKl6/WfPNyyiUM0CRKo2QzNW6PZy6E6cFm+rVrYFqGch30qMImcI2kzPVAIteI5J1jwL1LMk+U36COCia3zmP2v1TPldMwjpL9RCtTptw3LWo9FMQ4NVbmPuAOIJzuPjQKNSMzL2oX1Hv9HUrJMKPxt5wChIyeudRnYN3i/lxOBwOW3f0ZiX1vxdVA7DgMmxxEW7ohfngOlWqoj/RefIQ0D8SZ4A0SWHz2t8ibINNzqLnBL/H0N6qo9lkm+47Ns9Os5TwxTs9j0waYgPlb3DCPEseWjIbRJd65FEMmUJ+ebztdnDnW492VWlne5LXCHC2WLPAGXc5JykqKr1oHG1zKTi3YR1zoLuImykoBOBkm7YLj1DXcryfZcduH8zz3IAtlN9kx4OW7c=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1SPR01MB0002
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(1110001)(339900001)(199004)(189003)(26826003)(126002)(110136005)(7736002)(76130400001)(54906003)(2616005)(1076003)(476003)(305945005)(336012)(47776003)(36756003)(36906005)(8936002)(8746002)(50466002)(2501003)(8676002)(81166006)(14444005)(99286004)(81156014)(6306002)(66066001)(316002)(6512007)(486006)(2906002)(22756006)(6486002)(26005)(6506007)(105606002)(966005)(2201001)(4326008)(6116002)(23756003)(3846002)(186003)(102836004)(386003)(103116003)(25786009)(86362001)(70206006)(70586007)(2171002)(14454004)(50226002)(5660300002)(478600001)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB2067;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2ec3120d-4d69-4d85-d3a5-08d75e983a08
NoDisclaimer: True
X-Forefront-PRVS: 020877E0CB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 27RaMlYLsu9xNGl25Wy/gy37upGwLlMaudvRLPhVBd3mEm7KrH7M/mtBBL2y/HEje5WyUsiYXq4BjBwIHWK9SWagUUNohwckysr1BJYoyNkKqvp108eEKAyYVAL4u8fhi2u4gMIJgn4M0HmBefsqxrz+8n2AvaIkf9ylQjB3Xz25A8xGtyrJ2H7WV8tw2+ZUgCpEYGe6STd+LLMwtpE/A95QiYBsmjTZhWY30cVbOUWaTksN/fRj7dvlZyteq3paRUASCPD840OAfQ9s2vpdHEH1j0Pk2fX+Je1quGd/bSB5wMgGkUa91Iz38+auWvPjm53OtEAwXeV/3U7fWl5r2UyCBTNmD1fA7HCz9AL1asTwO+Vh6utubaIh1dXcCXEDeSAuAtWO2baKS5lfYDRJ/7qYcRaDwL+hRe77E2B+WOavHttlQeuU+3/1XhfUPeZopgYeusDEhXzgJpGd9KKQsf/bNen2Gkh1wjfnFt1aGjw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2019 06:53:50.3853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52867ae3-563d-4bed-d6df-08d75e984062
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2067
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1D24k7HU0R9r/oHzcqJoqA3lobn3dtEv+1CmAU99Gg=;
 b=GfxNNiPjc6hGwvXtOaEjgYDSwgMBLnYKCKacyTdOP9mMq+Ljnya2zXJe/UeBIUmW6pebf00l+DisixnPp6o3Rw9pZ65A/7TlUkh7CML+uFEPg/3m6Lj6RYYSqAYKG75YYd46A7pMvKzif+PNsbyfL8U2MSS2V3w3AVivjYiP460=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1D24k7HU0R9r/oHzcqJoqA3lobn3dtEv+1CmAU99Gg=;
 b=GfxNNiPjc6hGwvXtOaEjgYDSwgMBLnYKCKacyTdOP9mMq+Ljnya2zXJe/UeBIUmW6pebf00l+DisixnPp6o3Rw9pZ65A/7TlUkh7CML+uFEPg/3m6Lj6RYYSqAYKG75YYd46A7pMvKzif+PNsbyfL8U2MSS2V3w3AVivjYiP460=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWN0dWFsbHkgYXJlIHJlZ3JvdXBlZCBmcm9tOgotIGRybS9rb21lZGE6IEVu
YWJsZSBsYXllci9wbGFuZSBjb2xvci1tZ210OgogIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvNjA4OTMvCgotIGRybS9rb21lZGE6IEVuYWJsZSBDUlRDIGNvbG9yLW1n
bXQKICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxMzcwLwoKRm9y
IHJlbW92aW5nIHRoZSBkZXBlbmRlbmNlIG9uOgotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvMzA4NzYvCgpMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgx
KToKICBkcm0va29tZWRhOiBBZGRzIGdhbW1hIGFuZCBjb2xvci10cmFuc2Zvcm0gc3VwcG9ydCBm
b3IgRE9VLUlQUwoKamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgKDMpOgog
IGRybS9rb21lZGE6IEFkZCBhIG5ldyBoZWxwZXIgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1f
bigpCiAgZHJtL2tvbWVkYTogQWRkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcygpCiAgZHJtL2tv
bWVkYTogQWRkIGRybV9jdG1fdG9fY29lZmZzKCkKCnYyOgogIE1vdmUgdGhlIGZpeHBvaW50IGNv
bnZlcnNpb24gZnVuY3Rpb24gczMxXzMyX3RvX3EyXzEyKCkgdG8gZHJtIGNvcmUKICBhcyBhIHNo
YXJlZCBoZWxwZXIuCgp2NDoKICBBZGRyZXNzIHJldmlldyBjb21tZW50cyBmcm9tIE1paGFpLCBE
YW5pZWwgYW5kIElsaWEuCgpWNToKLSBJbmNsdWRlcyB0aGUgc2lnbiBiaXQgaW4gdGhlIHZhbHVl
IG9mIG0gKFFtLm4pLgotIFJlYmFzZSB3aXRoIGRybS1taXNjLW5leHQKCnY2OgogIEFsbG93cyBt
ID09IDAgYWNjb3JkaW5nIHRvIE1paGFpbCdzIGNvbW1lbnRzLgoKTG93cnkgTGkgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSAoMSk6CiAgZHJtL2tvbWVkYTogQWRkcyBnYW1tYSBhbmQgY29sb3ItdHJh
bnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMKCmphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpICgzKToKICBkcm06IEFkZCBhIG5ldyBoZWxwZXIgZHJtX2NvbG9yX2N0bV9zMzFf
MzJfdG9fcW1fbigpCiAgZHJtL2tvbWVkYTogQWRkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcygp
CiAgZHJtL2tvbWVkYTogQWRkIGRybV9jdG1fdG9fY29lZmZzKCkKCiAuLi4vYXJtL2Rpc3BsYXkv
a29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAyMCArKysrKysKIC4uLi9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyAgICB8IDY2ICsrKysrKysrKysrKysrKysrKysK
IC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaCAgICB8IDEwICsrLQog
Li4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgIDIgKwogLi4u
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKwogLi4uL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgIDYgKysKIGRyaXZlcnMv
Z3B1L2RybS9kcm1fY29sb3JfbWdtdC5jICAgICAgICAgICAgICB8IDM0ICsrKysrKysrKysKIGlu
Y2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggICAgICAgICAgICAgICAgICB8ICAxICsKIDggZmls
ZXMgY2hhbmdlZCwgMTQxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tCjIuMjAuMQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
