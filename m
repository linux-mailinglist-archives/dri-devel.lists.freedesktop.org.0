Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21243C62934
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 07:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9ED10E2CA;
	Mon, 17 Nov 2025 06:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dRPKaa+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0946110E2CA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 06:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGPf+X9qhdNIs/kGcAJbV4+J7afsYbJsR2GVkZTBWbYHTbHG6r9rKX4xWnz39MU7RnGemL+jjepYKosr1Fio2OTTfNfmXrXPIxeI9aDiDPl9DgtS+Fk0qipBAPS6HEN8c7oKu5HuVAjx42F+NyxS7x60ng61AEgI4CeRFk2bHAf90elMHHoQgqx8h3yKBfF0PQ4pxfa1yFyOLFIYz+HaNL2/KBqIgZ/9pP7QHk+5kPphV8kMcl/8ZDyJX8ku2vTD6TAub6sZ54A73D7eaxZjOoKsYD1HigraPfnKLdA8tAEPgzwr+k5/uvDWwNzXX3WzHNy8Y4dGIr3AW2E8fMuXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFygtM8/tRaIMTlVdJ4uq6mjnvonA5KWZA3lEHhJ3Y4=;
 b=CXnRxAlhEhaKyez0zTWHZk+wGMzUBLwwjEt3jhgTnee5ohkSfLYFw/dIc9Pbn1+QL7yUsGfdA7GkKERlPHqXPbIFL7WCZSnAShjj2/+bxdzPR/tTqZMF5pG0ZYm7K9em4R0+CnIx1Mr9pjXhwdHuvJ14zWUfBwmnspGBpc50hotC3Gs6Yf7VLqxYm9y6eKzwZ9EIkTGHQDqlW4urhEET6FGot4B6euY6CpIVZS/fv6eZ4Ga4728QjTx/G+Bkp6BWh5L4yXbNehAbLKKJ+WZxei9SVTPelO/01buo2vWYBUriBsbikGooWO70ai6PSyKipK7kLwUdbgL4OeKiE9Hr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFygtM8/tRaIMTlVdJ4uq6mjnvonA5KWZA3lEHhJ3Y4=;
 b=dRPKaa+Mj3dN7QL/rPGyUcs7lZcJhKdH8rH+bFKvAiyGk1XEg9Ua/cvtIS/ldAfp6WW6C19eCVhr2DwUK8vD4mw1fdbL54TCgUsaYiVkhQO/webZIa/u/zsp++5pCP2AXeOUk4CGd3lW3SP8LNGZichD5GO+kAfJVx4vTOWE6gQ=
Received: from SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12)
 by MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:47:50 +0000
Received: from SA3PR12MB7922.namprd12.prod.outlook.com
 ([fe80::9b6:464:1a68:ed47]) by SA3PR12MB7922.namprd12.prod.outlook.com
 ([fe80::9b6:464:1a68:ed47%6]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 06:47:49 +0000
From: "Katakam, Harini" <harini.katakam@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>
Subject: Recall: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify dma-coherent
 property
Thread-Topic: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify dma-coherent
 property
Thread-Index: AQHcV44WwCgQ60w/FUSS7sA0fIX6QQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 17 Nov 2025 06:47:49 +0000
Message-ID: <SA3PR12MB7922952E6DE5C156FED760519EC9A@SA3PR12MB7922.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-traffictypediagnostic: SA3PR12MB7922:EE_|MW6PR12MB8959:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e2bea90-988b-4807-5ac0-08de25a53914
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1oz7vlERn1zqHk38+axJnzwnEbKBWXcDoVIbl6PDI3zNMyWNBnffu9ch+avE?=
 =?us-ascii?Q?+nhP0SNeM9SWaR66rUjbcgjoNJEGGp15WUoAOCeQdoZjyBVUUC1BnWZst6cH?=
 =?us-ascii?Q?WQgAgnZ0mGsSH4tdYW09g4Qgm9wyV5msM8WmiFw25TJ+KCi3wsUH6tAXtj/d?=
 =?us-ascii?Q?bfc+wLG5EnGas2R6ciLpL+C615satHHkTLoGZnkriiwMG+HckCmlJowrtGJp?=
 =?us-ascii?Q?Zc2D1PCKc9Y78waOFbYCsFr1T9VkHKs+DfAC6b/Nl9d745IQrGJufd1anIqA?=
 =?us-ascii?Q?Ii0S6xS2JDQjCRsXwLzLgzl2IB9rQ5vIfksk/hgK7Vvt7jbFMq4TZo1OW3vY?=
 =?us-ascii?Q?iOBUosG+x3EmzGQircwo81dwPj81uIieFGaTeron1fxkUhcK9lWaUNUb3MoZ?=
 =?us-ascii?Q?G/TCxgBSpNUfoix4alnx0c02yeZm4VG/pH79jSVgya0tkEifnntzA3y+x+X3?=
 =?us-ascii?Q?Pkr3SmRk+YLoM0J0iwNZ2l0N7BOiiLirfrtAle6N6HurL7PeaXTNhb4S5mVZ?=
 =?us-ascii?Q?q9t4siWJKo3heyS+nqCx7bizgAUO3eX8oSP9C+8LCgyeH6gOz9x2fcmKzb9w?=
 =?us-ascii?Q?hPHj8ImcG76J+8++ziUCAh6kUcwUX3NQuKtobcl5bOqM/jnXzq+OaSObG7PA?=
 =?us-ascii?Q?E8zEWTVuU2u98+p3DCcCffMhXEho3aEAQ1Xw+d3/YizEYFQCCRyKy4lFa+sK?=
 =?us-ascii?Q?Jn1OyxjKjz/6B31WYuS3yY7o0TaT3BN8o3zTgdWFqmVJy9XaZm3LBpUvWaDv?=
 =?us-ascii?Q?N51NY1LTlmiK+0nmiTBq82QSEGxxZp/9DGySnGyNq74WOY/XXx9FS/MeIq5k?=
 =?us-ascii?Q?+mSPeL/HJ8RTv73ZjjdQgszwtLbge9l5HbHyTD7mW89IXEvGkubbT9A82ix5?=
 =?us-ascii?Q?gJKqvF58w1uATLgy3981fD0ZW7xaF9gQzLb23czlk0vIMfleXSd8UTAU5C+d?=
 =?us-ascii?Q?TBLK7didz8GAEr3uiSaCSyrk0uegFVA0s8Ovife69JO47WvKbB5SmV6OK9Da?=
 =?us-ascii?Q?/5FTMAIXUK7QaWm84HLOXVYH92WLHyRhyjUEjkQm6UKWi9Sp7F45+I6PEA0j?=
 =?us-ascii?Q?LW4xybpIY15auXhTNbsit0rQP6GaDTnC/09OmTs3nx37hrtjlK1DHfws4oVp?=
 =?us-ascii?Q?CslleCvu1Ow7sWXX43gYmjdh6pjrKooYTU5i74T1bUm//Vcp9YJ4+numl4sA?=
 =?us-ascii?Q?YKWUDcJlSJ/kQfhCbNcKIA1pWGRh98iWwlYqB0QOAjSS89uT0eBwnVPrwj0M?=
 =?us-ascii?Q?V+syLXPSA7lIbkgMNg4bRNDQelA5hhbAQ0SetqSw34v/qyLIyXXX4HqV5RdB?=
 =?us-ascii?Q?91tjLRYo9rbNkzGMyMlLKwehQqQRN44/b7Y0GvC+ar69tFYzZqbIktMQcCoS?=
 =?us-ascii?Q?AonIystDL7Vniyr7pEsYvTCCcIwBUTgpt2jQshiHpGvpmk8qza0++RpEmXlU?=
 =?us-ascii?Q?JQ7EJhuBf953338bgl5jbqbaYtUFmVwRKtJuQEoWOEdAAp4Kl8pyC2xd01Qp?=
 =?us-ascii?Q?MgT2fUNbjADEgQe3hNqZj3Dzbd6S6vaUlRn2tOfSIaiYO8aKO1BWuLhqWw?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB7922.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V5kpwvzVlkRuuf7BTvp1u9n5TW8fuJ/OJKXKg23Q8kD86ybUymHTgTcRLiIj?=
 =?us-ascii?Q?hKaXGi22PZgpnb0/46OIA8bnUEQziv5vS/8w6Nfo+z7PmN1pPhTla8e9eMY9?=
 =?us-ascii?Q?yhJTmb808FdPBSKwq/iLvrCev4PR+axnjdtUr/dVbcLuEoJTa6Rp2iFZ79Hd?=
 =?us-ascii?Q?WY8C/vkOodELEoPYEJ4oIXPrXqDv3O1nzlz/Fk5a/EMXWfvJ8mQr8pFZ383o?=
 =?us-ascii?Q?VjWpR5H1876w1bfd/LpGl5JyGHhqs50/LJi6yuVScgIeCNdJxT0O6OGI2bJx?=
 =?us-ascii?Q?XvsetJKtJRcSXdbqUcHAS1vbMztRO8W5coLWQFTvyxf52AyTWfuXlMVocsQY?=
 =?us-ascii?Q?jX+bbU/q4SEQftv6fnpsLyr3FQ74QtS2pdV27GQ0u/zd6Z9wI9u8CJ9IxmPl?=
 =?us-ascii?Q?g0aw4m6k1V8Bd88uZwa5IsntNGZXEdwt/ZEgIEg+P8o5Q96/rVVvCQfkw68L?=
 =?us-ascii?Q?DNUMcZANu9fo1V8SgDmbdpk8nD2SaK0vfm6iWOZE7/CBYGt57jpAgfzxlYLB?=
 =?us-ascii?Q?YUVyoTDxS3G2i+nTzgKKopcOxmqX2M9OJVR/AOIyrEBrM06fLXZFp61BR1pR?=
 =?us-ascii?Q?V4SFMOzE0+HObN3byPqLJeLlPgCIp6wzeCobRW0MgT52xq1lbrjXZwLlcfbX?=
 =?us-ascii?Q?nuaESdJm8eY6tesxCpYgdDsMJVDAITbEpeZIC7Jd7u/3h1Hs+6mEzjbOQ6Hk?=
 =?us-ascii?Q?k8R66+Drb9JICetJEEuWYLM+di5EScJxWjoIcAxkRtU1190fM0EiTatqISSs?=
 =?us-ascii?Q?JyvDFFRmrZ+NSYanKkCU+uGBPg3/isV2OdDX/3RIZ0JUdCn7uJEN+lm8CXdx?=
 =?us-ascii?Q?ctjiZP+s4CYwax+o1tHefpT74tUDH04spbnU8l8MGREDk9Nw2bT1yOq7GaL/?=
 =?us-ascii?Q?waJ+QTjVOoh3P/z9+Gf2t1TjtxUNGExuEEeCjzYlLyAmNowngc1CdV/Wum6v?=
 =?us-ascii?Q?pfAuhsniqxiWoJDkqeePjjiJ/f5c7oarhJ4aYrwvSzy/l9aL+UNvLN+9tY5f?=
 =?us-ascii?Q?tbsRWtQvL9vGPRHxhkcie6pRWsXxBQjNrHzH1PeOT9h+ZwUGPiOrbygQ8eL/?=
 =?us-ascii?Q?i+opjjkknZLUr0Iw1wzEoogb4vTbklZbfyjaphWeDZMsP6cTcnE7G8aWJCML?=
 =?us-ascii?Q?4X3iQQVNODwH44AeykaiX3plFlNap9RW8RWKy89qrNNHDDMxlCmMPAtydfpF?=
 =?us-ascii?Q?LwQnpmwDoXS/hZ3qURDaMj78hcyximDjFLGaps/FMvuhB9lnzruUu8xptWYj?=
 =?us-ascii?Q?B9CyK9AQHhMXWjt3XprddN2NtZolsz0Seez7qaYaXWUqpWACoqJr2VLK2KYh?=
 =?us-ascii?Q?942jmyvTLm5f3/8cPD1zRL3O8IEcmZe7/GCNwnFZIvoYszl6Txby0gZuOeRG?=
 =?us-ascii?Q?9uAEfo+ZDkDYszQLLTJHBsytS+0ZgzgphwHKUjrcWZ8YLOGtJVmDt8Glllla?=
 =?us-ascii?Q?4IDd7/BFJCaU/+dbDZPNi3l8Zr31hu6vB1ZXEoNv4TT3jI7sDBrWAkOny0jY?=
 =?us-ascii?Q?TiDZF+OZb8XpwrVMF/wIhfrQaedyVFmJDYWCyONn7/dvKcBiWzUIL0ybyiSU?=
 =?us-ascii?Q?3hotKLpO1S7NXyjdlqQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7922.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2bea90-988b-4807-5ac0-08de25a53914
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:47:49.0614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NFu+qNpR7vuPVuvJcGVAvlydbo1OuW2z+UMuLAnEZ5Fv3lB/wKajN3ZvGVXkqODn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Katakam, Harini would like to recall the message, "[PATCH 2/3] dt-bindings:=
 dma: xilinx: Simplify dma-coherent property".=
