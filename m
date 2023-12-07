Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0718089CC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 15:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F2110E89C;
	Thu,  7 Dec 2023 14:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2040.outbound.protection.outlook.com [40.107.105.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE1D10E89C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 14:04:21 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jPUvGg6GRbL2aBJgdGNyqIGy32YiieNwZOm0B73pjXWjl3jbQPCagRGOOtbQwb/c3Vgo/9fc8W+m6PHfJcbU2I30/qe1QiPTmaEKW4/GvCLOOD0o5ZNpYEIr+fnN4dQxAXZF2JTRhw+mCGckBdYELb7wWKbtstkq9cxbDyEIH8Ht68MWZJJBzDj53aQohB/4qj3uKD6SUj8PrgW3XddCO6LujTv9ePKwRqK992eGEvDnwq+rycIpRKqaI+CmOCnfTG6YdYc8bBSWJUPmwn4kjbzI0PY9qchpKQZ64NYERVtvsZ5r5H8SzRPD2iJM6NiZ5riyvMtM05RUbpJEdmsEHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7hafag2Rb8vSkgYEinWeyyjaemCzG5YOVgToGleKBQ=;
 b=kSaGEbvd0M2AhbvVmuYVpHcv4qY6YA26zCnBg/gBL7jC/W9XsJ+snB4v8aabrKlEUf2Lq5t7gKQY1XkwNgpfCzXmzdy75OfS2mr/XKngX/7++MfkQHy5WIIGi7wjBYLKHYByDVLq+hnWzC0Jqxdpq9nXJ1b7J5kK+ga8SCxo6hzUDD7jViJzIcughkaYJs/hPJiwRj+6YhRvDj6uLS73Sw8bfQeJ+VWjXYJQYoNkTxFkVdVNhRrhY4vAnT51qahDrgH/kYRprboNE1pL+QHY/UjljwA+W+0pYEVNK1w3pN56Q4/8fglBvNrpAcqdNMxAgQ3tIEgSs7q3G1TY7cn/SA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7hafag2Rb8vSkgYEinWeyyjaemCzG5YOVgToGleKBQ=;
 b=G9F+qDaQueBOPKdDr7vr72xCXENXrdnpKo5iZQ7Yo/QjZ0yYQrN4OkCj/CoZb/QNEHNy/HA+Na3A8bc7XVSbAMwL5XF/KhSnHQzfDpmUpzkEZy4U9B0YEnEJN+7rZEoh7sFrBlbJKmUJxbP3p2VaQhObPBK16c+qpyTD3a6ciVY=
Received: from AS9PR06CA0039.eurprd06.prod.outlook.com (2603:10a6:20b:463::31)
 by PR3PR08MB5739.eurprd08.prod.outlook.com (2603:10a6:102:8e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 14:04:13 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:463:cafe::13) by AS9PR06CA0039.outlook.office365.com
 (2603:10a6:20b:463::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 14:04:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 14:04:13 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Thu, 07 Dec 2023 14:04:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 199cfa3f8f2bc1cf
X-CR-MTA-TID: 64aa7808
Received: from 86451138548f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ABA2B55B-1B86-4A89-BB4D-852F8A0EFFCE.1; 
 Thu, 07 Dec 2023 14:04:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 86451138548f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Dec 2023 14:04:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STAGhjou3pUeM957criofaTjpmXvB3s1WQeA59HBojnCBDwERk9igLFDqNdvHAfiugKE6APR73BZcE/kSrbomspBr2rh8n/HgdMr26YRx/847fhD+6w+bCoQ0kD2O2bIRSniKDOWILuksULg7XE9nJBG9qUdVpnGAMBCM2I8IgQEnT3itAKlhlTyhOCUIeq/JdoKsbuKW7jiiJnqp65Gjxfdyekrj82N/FHWbfPKzaf3v4UTmQVDwekKMW9gBtj8h7ymVNGpaDcAo0h7owaJjb/EpGhx2YErKTG7Hyg4Cwlau6dBewjqQR/az981RIr5XOZYaDJMfRUPSYGXSczBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7hafag2Rb8vSkgYEinWeyyjaemCzG5YOVgToGleKBQ=;
 b=dUM9rk6fCQ/OI4uLPO9o+Ozgn10EjcFu2eWN9ECIrUPdhZsuNhgdkWWQQLZd9llMAUXEhBqq2bhyNoCZu6y6AtvSf7WOrdmRkRbkg9tzA0uLW+0IMLpRpzdaydxupFlkaPHmWhDYtUuEPaW6WkYDZKodj+JRR3V362C+5E+YHOqHe1SvjA0DL/iJKf4/SRI8W6Gs5jbk19ksXjpSX7f1a0XUh/phezydqZpXEhljEIGVbr6zJgQah56E29VuXliCgPeRsJKJ6KJ7Dr0O4eOpMt4iGKp8Cty44JsKzT8zueHdLerdQdi8NwChYthWFDJLNcDSrssj/2iWNgs9oj1QXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7hafag2Rb8vSkgYEinWeyyjaemCzG5YOVgToGleKBQ=;
 b=G9F+qDaQueBOPKdDr7vr72xCXENXrdnpKo5iZQ7Yo/QjZ0yYQrN4OkCj/CoZb/QNEHNy/HA+Na3A8bc7XVSbAMwL5XF/KhSnHQzfDpmUpzkEZy4U9B0YEnEJN+7rZEoh7sFrBlbJKmUJxbP3p2VaQhObPBK16c+qpyTD3a6ciVY=
Received: from PA6PR08MB10766.eurprd08.prod.outlook.com
 (2603:10a6:102:3cd::17) by PAXPR08MB6560.eurprd08.prod.outlook.com
 (2603:10a6:102:12d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 14:04:03 +0000
Received: from PA6PR08MB10766.eurprd08.prod.outlook.com
 ([fe80::8c27:ae9d:320a:c8e0]) by PA6PR08MB10766.eurprd08.prod.outlook.com
 ([fe80::8c27:ae9d:320a:c8e0%2]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 14:04:03 +0000
From: Lingkai Dong <Lingkai.Dong@arm.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: Re: [PATCH] drm: Fix FD ownership check in drm_master_check_perm()
Thread-Topic: [PATCH] drm: Fix FD ownership check in drm_master_check_perm()
Thread-Index: AQHaKEsCo6nWPH/KmkyDAqKUxClNU7CdmxcAgAABtwCAAAEJAIAAO5mAgAAB6Oc=
Date: Thu, 7 Dec 2023 14:04:03 +0000
Message-ID: <PA6PR08MB1076622BEB63806629161FB05888BA@PA6PR08MB10766.eurprd08.prod.outlook.com>
References: <PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com>
 <CACRpkdbPoDGrxCsuwmz-ep7V38Gi5P74jkfMBX+XJMPXFb=SJg@mail.gmail.com>
 <bed6544c-9434-42df-ba4c-a32022823b24@amd.com>
 <c3eba2be-2498-4271-b1e5-305432600bc4@linux.intel.com>
 <db412bd5-cc75-4d27-b0b2-b01a9de48be3@amd.com>
In-Reply-To: <db412bd5-cc75-4d27-b0b2-b01a9de48be3@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PA6PR08MB10766:EE_|PAXPR08MB6560:EE_|AM2PEPF0001C70D:EE_|PR3PR08MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f4819d-a5a4-44e7-1cb6-08dbf72d6445
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: s0a58ScnqHpD6oZAnKUx2nWibAkr06RoAEnBuqHiqTYOZ3+cuEc64b9LNwCLIjNpilUeytm1NPrQIg2qfvk2fhIzFZu7KEztsWTOfMtpsEl+2ENaVgqttJyqNhnOwufpBDybqyl3hZBjxbPjWQ1iXmqnAB2qqKRpBzWiXMLbDo9tXAcXWtv3Q6PpFkzBNliKnsQym140sRRrBcZbYYlmLY8eJSVplMhiwIqx69BgTPkOTfJWIdwbEP3RbfrYMQwrn4iXCaYNUEvRCgjzg0eKC02soObHdfpjipDXiCQ9U48wxxR1jCrCgEtBwdDAQLq79BLInWsJQ1SOuWjXj9PKihEylHs0HL2VNBUmUCNt/htBpGltpSOp6hVzA6SbcY6p6vZieQ7SAoGCQgF5XaH6XK8iCHPYVW8z0bdGE6v2HjwxIZOA8QZ5DvXA8FyBmnYd94JI2pj3EICN1g7jh4vCAQSZGZKWBbCaTbsdTFyMB4AfQDOIsimlLy8fEfYQGEOxfpHgqRKQOBG89UOlO6r2BpLyfROq2aNE3UKnVcs+CqIinJ4zvUE/VZYp/yMvwPtZI3whsVjdHemWFJCb9BJV4IFukJXbEW3Z8eYpnJ0N7EQ=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PA6PR08MB10766.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(52536014)(19627405001)(8676002)(8936002)(5660300002)(7696005)(966005)(71200400001)(53546011)(6506007)(76116006)(91956017)(54906003)(110136005)(316002)(45080400002)(66476007)(66556008)(64756008)(478600001)(66946007)(9686003)(66446008)(41300700001)(4326008)(2906002)(38070700009)(38100700002)(122000001)(33656002)(166002)(26005)(83380400001)(86362001)(55016003);
 DIR:OUT; SFP:1101; 
Content-Type: multipart/alternative;
 boundary="_000_PA6PR08MB1076622BEB63806629161FB05888BAPA6PR08MB10766eu_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6560
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bf7f21a5-9499-47c0-e3c8-08dbf72d5e9c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8aAfTccrU8gvLuhFdhH6sXUDibQCbU+9eZUzY4Pv7yPcos/FtT9bRpQD9cN+TLdZDREdpYUD+kqz1B6piS0D7ixCq/4e9jEKiW2UOu2lArdyG0mqOBTkdWxd86R1yQdeZ5wru45UjvCbU1a2doTdkRIBmS1QFKPrXst4MxxI79MQt0HaGVSsWlQch9gBMWaBVg07znFL2v3u0uyBuwhwT8zOjQCxRFx7oj9pN3PFQJaAQsBffAXLUXP0rZYYO0PlZ9xAkXhEv5pWhaa34evN1zupJxmfDkalpf/BNsM6mw3JhN7VIbBdVZ19KXtcVjCc4L8UNFsG5BcgnfCyG4tIRhH5HchDuEVwu2Sh/w+SL/Nw6Hk4Ar45uxRODM1CIuXCQ8/HgasOj0fwCpfTYZCVtzCyB965hTmjBEvTEWaL0nxxGgR/N2FcasPOvYWbZZF2fhhPNVIrwrQQSMMIXQqHfl83zb0gHK+DAsryFbb72vqQLU6p1lmVi29joMykFANn4RfQhVagQmY6kJfqXJZuScCxAny620bg1nGoW2jAvloxWWDUBpbiU7Nd/xrk6+SFEuVRHKnfUForezr5/JULKlVsLxB5LFHr3l/YQaf7q4PiLCqTctnRajkc7v3KKxbQ+q6+KgcVzpPhWFeTfmhpHhdCT3Yf05FVlNcyOSIbS6d30oOUZnfoevumXTPts9mviAUPiZm7xcntmn8a5SWFeZPMyjnz1RnXOmNVwEtwThQ=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(1800799012)(82310400011)(64100799003)(451199024)(186009)(36840700001)(40470700004)(46966006)(55016003)(19627405001)(40480700001)(40460700003)(36860700001)(41300700001)(5660300002)(2906002)(33656002)(8676002)(316002)(4326008)(336012)(81166007)(110136005)(356005)(166002)(478600001)(45080400002)(53546011)(9686003)(7696005)(6506007)(33964004)(54906003)(86362001)(70586007)(82740400003)(26005)(70206006)(8936002)(52536014)(966005)(47076005)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 14:04:13.0115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f4819d-a5a4-44e7-1cb6-08dbf72d6445
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5739
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
Cc: nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_PA6PR08MB1076622BEB63806629161FB05888BAPA6PR08MB10766eu_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmsgeW91IGFsbCENCg0KUmVnYXJkcywNCkxpbmdrYWkNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCkZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4NClNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciA3LCAyMDIzIDE6NTUgUE0NClRvOiBU
dnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPjsgTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgTGluZ2thaSBEb25nIDxMaW5na2FpLkRv
bmdAYXJtLmNvbT47IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+DQpD
YzogbmQgPG5kQGFybS5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtOiBG
aXggRkQgb3duZXJzaGlwIGNoZWNrIGluIGRybV9tYXN0ZXJfY2hlY2tfcGVybSgpDQoNCkFtIDA3
LjEyLjIzIHVtIDExOjIyIHNjaHJpZWIgVHZydGtvIFVyc3VsaW46DQo+DQo+DQo+IE9uIDA3LzEy
LzIwMjMgMTA6MTgsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBBbSAwNy4xMi4yMyB1bSAx
MToxMiBzY2hyaWViIExpbnVzIFdhbGxlaWo6DQo+Pj4gT24gV2VkLCBEZWMgNiwgMjAyMyBhdCAy
OjUy4oCvUE0gTGluZ2thaSBEb25nIDxMaW5na2FpLkRvbmdAYXJtLmNvbT4NCj4+PiB3cm90ZToN
Cj4+Pg0KPj4+PiBUaGUgRFJNIHN1YnN5c3RlbSBrZWVwcyBhIHJlY29yZCBvZiB0aGUgb3duZXIg
b2YgYSBEUk0gZGV2aWNlIGZpbGUNCj4+Pj4gZGVzY3JpcHRvciB1c2luZyB0aHJlYWQgZ3JvdXAg
SUQgKFRHSUQpIGluc3RlYWQgb2YgcHJvY2VzcyBJRA0KPj4+PiAoUElEKSwgdG8NCj4+Pj4gZW5z
dXJlcyBhbGwgdGhyZWFkcyB3aXRoaW4gdGhlIHNhbWUgdXNlcnNwYWNlIHByb2Nlc3MgYXJlDQo+
Pj4+IGNvbnNpZGVyZWQgdGhlDQo+Pj4+IG93bmVyLiBIb3dldmVyLCB0aGUgRFJNIG1hc3RlciBv
d25lcnNoaXAgY2hlY2sgY29tcGFyZXMgdGhlIGN1cnJlbnQNCj4+Pj4gdGhyZWFkJ3MgUElEIGFn
YWluc3QgdGhlIHJlY29yZCwgc28gdGhlIHRocmVhZCBpcyBpbmNvcnJlY3RseQ0KPj4+PiBjb25z
aWRlcmVkIHRvDQo+Pj4+IGJlIG5vdCB0aGUgRkQgb3duZXIgaWYgdGhlIFBJRCBpcyBub3QgZXF1
YWwgdG8gdGhlIFRHSUQuIFRoaXMNCj4+Pj4gY2F1c2VzIERSTQ0KPj4+PiBpb2N0bHMgdG8gYmUg
ZGVuaWVkIG1hc3RlciBwcml2aWxlZ2VzLCBldmVuIGlmIHRoZSBzYW1lIHRocmVhZCB0aGF0DQo+
Pj4+IG9wZW5lZA0KPj4+PiB0aGUgRkQgcGVyZm9ybXMgYW4gaW9jdGwuIEZpeCB0aGlzIGJ5IGNo
ZWNraW5nIFRHSUQuDQo+Pj4+DQo+Pj4+IEZpeGVzOiA0MjMwY2VhODljYWZiICgiZHJtOiBUcmFj
ayBjbGllbnRzIGJ5IHRnaWQgYW5kIG5vdCB0aWQiKQ0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBMaW5n
a2FpIERvbmcgPGxpbmdrYWkuZG9uZ0Bhcm0uY29tPg0KPj4+IFBhZ2luZyB0aGUgcGF0Y2ggYXV0
aG9yIChUdnJrbykgYW5kIGNvbW1pdHRlciAoQ2hyaXN0aWFuKS4NCj4+PiBIZXJlIGlzIHRoZSBw
YXRjaCBpZiB5b3UgZG9uJ3QgaGF2ZSBpdCBpbiB5b3VyIG1haWxib3g6DQo+Pj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsL1BBNlBSMDhNQjEwNzY2NTkyMEJFOUE5NjY1OENEQTA0
Q0U4ODg0QUBQQTZQUjA4TUIxMDc2Ni5ldXJwcmQwOC5wcm9kLm91dGxvb2suY29tLw0KPj4+DQo+
Pj4NCj4+PiBJJ20gc2VlaW5nIHRoaXMgYXMgd2VsbCAob24gQW5kcm9pZCkuDQo+Pj4NCj4+PiBU
dnJrbywgQ2hyaXN0aWFuOiBjYW4geW91IGxvb2sgYXQgdGhpcz8NCj4+DQo+PiBHb29kIGNhdGNo
LCBsb29rcyBsaWtlIHdlIG1pc3NlZCB0aGlzIG9jY2FzaW9uIHdoaWxlIHN3aXRjaGluZyBmcm9t
DQo+PiBQSUQgdG8gVEdJRC4NCj4NCj4gT29wcywgeWVzLi4NCj4NCj4gUmV2aWV3ZWQtYnk6IFR2
cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+DQo+DQo+Pj4gV2lsbCB5b3Ug
YXBwbHkgaXQgdG8gdGhlIEFNRCB0cmVlIGZvciBmaXhlcyBpZiBpdCBsb29rcyBPSw0KPj4+IG9y
IGRvZXMgaXQgZ28gZWxzZXdoZXJlPw0KPj4NCj4+IEkgY2FuIHB1c2ggdGhpcyB0byBkcm0tbWlz
Yy1maXhlcyBhcyBsb25nIGFzIG5vYm9keSBvYmplY3RzIGluIHRoZQ0KPj4gbmV4dCBob3VyIG9y
IHNvLg0KPj4NCj4+IENDOiBzdGFibGU/IElmIHllcyB3aGljaCB2ZXJzaW9ucz8NCj4NCj4gQ2M6
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY2LjQrDQoNCkFuZCBwdXNoZWQgdG8gZHJtLW1p
c2MtZml4ZXMuDQoNClRoYW5rcywNCkNocmlzdGlhbi4NCg0KPg0KPiBSZWdhcmRzLA0KPg0KPiBU
dnJ0a28NCg0K

--_000_PA6PR08MB1076622BEB63806629161FB05888BAPA6PR08MB10766eu_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFt
aWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxp
YnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigw
LCAwLCAwKTsiIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+VGhhbmsgeW91IGFsbCE8L3NwYW4+PC9k
aXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5
OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJp
LCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAw
LCAwKTsiIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+PGJyPg0KPC9zcGFuPjwvZGl2Pg0KPGRpdiBj
bGFzcz0iZWxlbWVudFRvUHJvb2YiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFw
dG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFz
cz0iZWxlbWVudFRvUHJvb2YiPlJlZ2FyZHMsPGJyPg0KPC9zcGFuPjwvZGl2Pg0KPGRpdiBjbGFz
cz0iZWxlbWVudFRvUHJvb2YiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9z
X0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBz
YW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiPkxpbmdrYWk8YnI+DQo8L3NwYW4+PC9kaXY+DQo8ZGl2IGNsYXNzPSJl
bGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRG
b250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7
IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8
ZGl2IGlkPSJhcHBlbmRvbnNlbmQiPjwvZGl2Pg0KPGhyIHN0eWxlPSJkaXNwbGF5OmlubGluZS1i
bG9jazt3aWR0aDo5OCUiIHRhYmluZGV4PSItMSI+DQo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBk
aXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6
ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IENocmlzdGlhbiBLw7ZuaWcgJmx0
O2NocmlzdGlhbi5rb2VuaWdAYW1kLmNvbSZndDs8YnI+DQo8Yj5TZW50OjwvYj4gVGh1cnNkYXks
IERlY2VtYmVyIDcsIDIwMjMgMTo1NSBQTTxicj4NCjxiPlRvOjwvYj4gVHZydGtvIFVyc3VsaW4g
Jmx0O3R2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbSZndDs7IExpbnVzIFdhbGxlaWogJmx0
O2xpbnVzLndhbGxlaWpAbGluYXJvLm9yZyZndDs7IExpbmdrYWkgRG9uZyAmbHQ7TGluZ2thaS5E
b25nQGFybS5jb20mZ3Q7OyBUdnJ0a28gVXJzdWxpbiAmbHQ7dHZydGtvLnVyc3VsaW5AaW50ZWwu
Y29tJmd0Ozxicj4NCjxiPkNjOjwvYj4gbmQgJmx0O25kQGFybS5jb20mZ3Q7OyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnICZsdDtkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Jmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW1BBVENIXSBkcm06IEZpeCBGRCBvd25lcnNo
aXAgY2hlY2sgaW4gZHJtX21hc3Rlcl9jaGVja19wZXJtKCk8L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwv
ZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21lbnQiPjxmb250IHNpemU9IjIiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPg0KPGRpdiBjbGFzcz0iUGxhaW5UZXh0Ij5BbSAw
Ny4xMi4yMyB1bSAxMToyMiBzY2hyaWViIFR2cnRrbyBVcnN1bGluOjxicj4NCiZndDs8YnI+DQom
Z3Q7PGJyPg0KJmd0OyBPbiAwNy8xMi8yMDIzIDEwOjE4LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ojxicj4NCiZndDsmZ3Q7IEFtIDA3LjEyLjIzIHVtIDExOjEyIHNjaHJpZWIgTGludXMgV2FsbGVp
ajo8YnI+DQomZ3Q7Jmd0OyZndDsgT24gV2VkLCBEZWMgNiwgMjAyMyBhdCAyOjUy4oCvUE0gTGlu
Z2thaSBEb25nICZsdDtMaW5na2FpLkRvbmdAYXJtLmNvbSZndDsgPGJyPg0KJmd0OyZndDsmZ3Q7
IHdyb3RlOjxicj4NCiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7Jmd0OyZndDsgVGhlIERSTSBz
dWJzeXN0ZW0ga2VlcHMgYSByZWNvcmQgb2YgdGhlIG93bmVyIG9mIGEgRFJNIGRldmljZSBmaWxl
PGJyPg0KJmd0OyZndDsmZ3Q7Jmd0OyBkZXNjcmlwdG9yIHVzaW5nIHRocmVhZCBncm91cCBJRCAo
VEdJRCkgaW5zdGVhZCBvZiBwcm9jZXNzIElEIDxicj4NCiZndDsmZ3Q7Jmd0OyZndDsgKFBJRCks
IHRvPGJyPg0KJmd0OyZndDsmZ3Q7Jmd0OyBlbnN1cmVzIGFsbCB0aHJlYWRzIHdpdGhpbiB0aGUg
c2FtZSB1c2Vyc3BhY2UgcHJvY2VzcyBhcmUgPGJyPg0KJmd0OyZndDsmZ3Q7Jmd0OyBjb25zaWRl
cmVkIHRoZTxicj4NCiZndDsmZ3Q7Jmd0OyZndDsgb3duZXIuIEhvd2V2ZXIsIHRoZSBEUk0gbWFz
dGVyIG93bmVyc2hpcCBjaGVjayBjb21wYXJlcyB0aGUgY3VycmVudDxicj4NCiZndDsmZ3Q7Jmd0
OyZndDsgdGhyZWFkJ3MgUElEIGFnYWluc3QgdGhlIHJlY29yZCwgc28gdGhlIHRocmVhZCBpcyBp
bmNvcnJlY3RseSA8YnI+DQomZ3Q7Jmd0OyZndDsmZ3Q7IGNvbnNpZGVyZWQgdG88YnI+DQomZ3Q7
Jmd0OyZndDsmZ3Q7IGJlIG5vdCB0aGUgRkQgb3duZXIgaWYgdGhlIFBJRCBpcyBub3QgZXF1YWwg
dG8gdGhlIFRHSUQuIFRoaXMgPGJyPg0KJmd0OyZndDsmZ3Q7Jmd0OyBjYXVzZXMgRFJNPGJyPg0K
Jmd0OyZndDsmZ3Q7Jmd0OyBpb2N0bHMgdG8gYmUgZGVuaWVkIG1hc3RlciBwcml2aWxlZ2VzLCBl
dmVuIGlmIHRoZSBzYW1lIHRocmVhZCB0aGF0IDxicj4NCiZndDsmZ3Q7Jmd0OyZndDsgb3BlbmVk
PGJyPg0KJmd0OyZndDsmZ3Q7Jmd0OyB0aGUgRkQgcGVyZm9ybXMgYW4gaW9jdGwuIEZpeCB0aGlz
IGJ5IGNoZWNraW5nIFRHSUQuPGJyPg0KJmd0OyZndDsmZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7Jmd0
OyZndDsgRml4ZXM6IDQyMzBjZWE4OWNhZmIgKCZxdW90O2RybTogVHJhY2sgY2xpZW50cyBieSB0
Z2lkIGFuZCBub3QgdGlkJnF1b3Q7KTxicj4NCiZndDsmZ3Q7Jmd0OyZndDsgU2lnbmVkLW9mZi1i
eTogTGluZ2thaSBEb25nICZsdDtsaW5na2FpLmRvbmdAYXJtLmNvbSZndDs8YnI+DQomZ3Q7Jmd0
OyZndDsgUGFnaW5nIHRoZSBwYXRjaCBhdXRob3IgKFR2cmtvKSBhbmQgY29tbWl0dGVyIChDaHJp
c3RpYW4pLjxicj4NCiZndDsmZ3Q7Jmd0OyBIZXJlIGlzIHRoZSBwYXRjaCBpZiB5b3UgZG9uJ3Qg
aGF2ZSBpdCBpbiB5b3VyIG1haWxib3g6PGJyPg0KJmd0OyZndDsmZ3Q7IDxhIGhyZWY9Imh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9QQTZQUjA4TUIxMDc2NjU5MjBCRTlBOTY2NThD
REEwNENFODg4NEFAUEE2UFIwOE1CMTA3NjYuZXVycHJkMDgucHJvZC5vdXRsb29rLmNvbS8iPg0K
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsL1BBNlBSMDhNQjEwNzY2NTkyMEJFOUE5
NjY1OENEQTA0Q0U4ODg0QUBQQTZQUjA4TUIxMDc2Ni5ldXJwcmQwOC5wcm9kLm91dGxvb2suY29t
LzwvYT4NCjxicj4NCiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7
Jmd0OyBJJ20gc2VlaW5nIHRoaXMgYXMgd2VsbCAob24gQW5kcm9pZCkuPGJyPg0KJmd0OyZndDsm
Z3Q7PGJyPg0KJmd0OyZndDsmZ3Q7IFR2cmtvLCBDaHJpc3RpYW46IGNhbiB5b3UgbG9vayBhdCB0
aGlzPzxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDsgR29vZCBjYXRjaCwgbG9va3MgbGlrZSB3
ZSBtaXNzZWQgdGhpcyBvY2Nhc2lvbiB3aGlsZSBzd2l0Y2hpbmcgZnJvbSA8YnI+DQomZ3Q7Jmd0
OyBQSUQgdG8gVEdJRC48YnI+DQomZ3Q7PGJyPg0KJmd0OyBPb3BzLCB5ZXMuLjxicj4NCiZndDs8
YnI+DQomZ3Q7IFJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiAmbHQ7dHZydGtvLnVyc3VsaW5A
aW50ZWwuY29tJmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7Jmd0OyZndDsgV2lsbCB5b3UgYXBwbHkg
aXQgdG8gdGhlIEFNRCB0cmVlIGZvciBmaXhlcyBpZiBpdCBsb29rcyBPSzxicj4NCiZndDsmZ3Q7
Jmd0OyBvciBkb2VzIGl0IGdvIGVsc2V3aGVyZT88YnI+DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7
IEkgY2FuIHB1c2ggdGhpcyB0byBkcm0tbWlzYy1maXhlcyBhcyBsb25nIGFzIG5vYm9keSBvYmpl
Y3RzIGluIHRoZSA8YnI+DQomZ3Q7Jmd0OyBuZXh0IGhvdXIgb3Igc28uPGJyPg0KJmd0OyZndDs8
YnI+DQomZ3Q7Jmd0OyBDQzogc3RhYmxlPyBJZiB5ZXMgd2hpY2ggdmVyc2lvbnM/PGJyPg0KJmd0
Ozxicj4NCiZndDsgQ2M6ICZsdDtzdGFibGVAdmdlci5rZXJuZWwub3JnJmd0OyAjIHY2LjQrPGJy
Pg0KPGJyPg0KQW5kIHB1c2hlZCB0byBkcm0tbWlzYy1maXhlcy48YnI+DQo8YnI+DQpUaGFua3Ms
PGJyPg0KQ2hyaXN0aWFuLjxicj4NCjxicj4NCiZndDs8YnI+DQomZ3Q7IFJlZ2FyZHMsPGJyPg0K
Jmd0Ozxicj4NCiZndDsgVHZydGtvPGJyPg0KPGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9mb250Pjwv
ZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_PA6PR08MB1076622BEB63806629161FB05888BAPA6PR08MB10766eu_--
