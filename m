Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F1E96ED16
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EE810E98C;
	Fri,  6 Sep 2024 08:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Tehxvqaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCAB10E98C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:03:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucZTwX8E3U8sWmPSXqBoMYiJrkueeTaVLtvNWF8P/WeFRK7R1y5M5OUjQ34tT4NYGNG8FOOcBcOXpvAeJM4EfDUlk6RN39adG1yQL0sppkOUMchbuVBDAutX/Pg5zXgibPfSsPCtEXhyz8EHyZD1qw6dDQjWtTYf8MMp3dRoCmauCE+nKVThSRXsGk4nZ147c3ltXCG6Wp8ujGQpcJA4/IyHmJEiaHTeWjsP8/MSqO87NA3iAM5rV93myP2jOWiKC4WX4SCm9NClQ108ne6PTklzXXuadDXLaAMFSOn5iXZyzmXd1onCC56Gv3vmUCHqsUughD6uHTXFOZvcU8Ho7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLGR8k59+20b3bj53Pw+hWewFI6zlEoN9MzbKPZAwKk=;
 b=EDlGPUsuAy6bBJMsEidf+Hq2fYFcJypjOOxYoqfWRDHsGok1Wv4Thl9DcIeLsnz7iNIa/Sq66bhcTHKtLd3u0TCHB3jhEhKvF3S1IvIyNsL6PM03gx4arUy5+t5RQIQnwz/TvdNV4+z4GLHHijKVkJrO/ZhbzjhWLqvKV40nRooxANzrQufKdjGU5laCqBbTZwJB4yi59n5tSvlNps1p2Ly0lC5B7lB+5tj+P/Eiz+1pZeBmOkMImB3FokaQuUfXP9qaMgJy3bjX/rEdrct+9MEWO7SpcyAmcbSjXeC0rVS/rX8sFluaRzIqut0hmBbZb5Bb8zAZuLujQff62Oi4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLGR8k59+20b3bj53Pw+hWewFI6zlEoN9MzbKPZAwKk=;
 b=TehxvqawvHLwEbpIPJhpex61CePwKrAO6gM/4rGhoaRWadYRSY4Cu4OaPb769dPlw4W5XoHvRQKOszx0blwjKQYyMWfx5sF4Hi2wBIOLe1aFWpKAy6GvS386HupHmpdi2NLSpCWcs3DjB0viZOuK2Qe1iQgmqHeRd7GqWyBQ29rvug+artGnEh4sCh65RH/mkVHxflCQDypbI5ut5S+Heie+e0gv91BtLRdHKWGIpSUwH4h4JznrN7IGjwKJJxbDyDTeturEUDdQrjVFDgEc33GQWSomSnUQdiMbvqlWNMUGplzuPlp54gMUXx4jnHliAxzN1T9CKpUCqTQgwossow==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9324.eurprd04.prod.outlook.com (2603:10a6:10:357::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 08:03:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 08:03:38 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Adam Ford <aford173@gmail.com>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, Marek Vasut <marex@denx.de>, Stefan Agner
 <stefan@agner.ch>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, arm-soc
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Schrempf Frieder
 <frieder.schrempf@kontron.de>, Dominique MARTINET
 <dominique.martinet@atmark-techno.com>, "robh@kernel.org" <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: RE: i.MX8MP IMX-LCDIF Underrun Question(s)
Thread-Topic: i.MX8MP IMX-LCDIF Underrun Question(s)
Thread-Index: AQHa//6WtlDuwFi4/UGB5Pg318IjnrJKZVtw
Date: Fri, 6 Sep 2024 08:03:38 +0000
Message-ID: <PAXPR04MB84592996FD8101BC0CF9E366889E2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <CAHCN7xLL4hrTK1OqsqUa78cdp9ZcG0sC+cO5QKC3x_Y9-QVzSA@mail.gmail.com>
In-Reply-To: <CAHCN7xLL4hrTK1OqsqUa78cdp9ZcG0sC+cO5QKC3x_Y9-QVzSA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU0PR04MB9324:EE_
x-ms-office365-filtering-correlation-id: a5d51cf2-9552-4d1f-6fe0-08dcce4a6a19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?enZDWHhxK1ZOYlVoUjBkc2NMdC9oUG00eEtZY3owSkdUOGpHR3MvSVcxMVhE?=
 =?utf-8?B?N0pSMG1KQ1F2RUpBQlhkUG5kQU5JN0pqV1VIK3FxODNCOUk0K1lCaXFlTnJm?=
 =?utf-8?B?U1ZodjQ4ZjhLZnlKeEs2NUthc0JuWElEOC9BRW10d2xjRDZKVmRWL2ZzTzY1?=
 =?utf-8?B?R0grSFdjcFRoVzlJUlIwaVE2azFZaVA0aktINXJpeG15UWRwQ0IxVzhCSlNo?=
 =?utf-8?B?YUEzdXlCNkZQSStiK3hLdjM0bXVuM1pTK3FpWld0bDNFWGkwRFBGZTlUbFhj?=
 =?utf-8?B?UFpmRjRobmVEZTZqN0ZHS1p3QVdRL3hXbTBNTHBUN3hJY3B4ais2VXZkTjJv?=
 =?utf-8?B?UVNsTGRXT1o0cVlxYjczZHVDOC8wdkV3NG5ndzJ2VjFsQ01FU2NEU2ZFQ01z?=
 =?utf-8?B?RXdXSVZkWWtwM1pVdnVsUXdGa3IxR293QTQ0L3QxakJCRVErejQwWTlnM0Vh?=
 =?utf-8?B?NlZ4azB6blUwUWQyQkpYY012UDNMSDRxZnh6ZVpTeUZCTzBPc2dDc25rbURD?=
 =?utf-8?B?eElIRjcyQ0VGaTM1U05PZmZFQzQxUS8vTDY2V0RxMEZwZUE3TzYrN2ZhWGJu?=
 =?utf-8?B?RlVnYUJtSmxINGhsZE1HN3RNOVV1Sk5OZ2VTSkd4eCswd0lCVTJJV1ozZEdp?=
 =?utf-8?B?S2IxV3ZWZU5OZERkNE44d3ZpdU9qS094b0xQU25UNjRmM3o0OFdsUjlFV1Vh?=
 =?utf-8?B?dmxTUGVSZ3psamxybzJMZzN0ZjVERWFJZWU2SjdpM0t4UmFOVm5jMlp0czNa?=
 =?utf-8?B?b0lrdVoxZy9xcDdDYmN6U3U4TVJoNzNkNlgzUWhRUnJFSktpWmNCMUFnS0xF?=
 =?utf-8?B?dm1YZ0VPdmxSRm9mV3lNWjZ0Mi9yekFUZUxGaC9UNmJ3b29RM0dIcEI0SklB?=
 =?utf-8?B?R3dJQktyS09YNkJQaUV2RU5NL2lrWlZ4MEVSUDdCMS9UdWVjN2VzdVliN1c0?=
 =?utf-8?B?K041Ujg0WVM4MUN1VjVyc3h6MGc1MWRLTFpOWXBQVHJ3OTlLSzdqL09mTTY2?=
 =?utf-8?B?RlhLZVlRRWIwRitmOXBOc0svZFlrWUZFbTlwVEp4dHQxMXQyOElzMk1RdHdT?=
 =?utf-8?B?YjZ2b3FHZnpEa01VQytoQk9uQ204YkhRenNRU1pqbm91N1Z1K255cFdEVDdU?=
 =?utf-8?B?bU9taXlCR2NGQ09pazRsb0hQM2QvWWplOFVpV3dmaFFyb1pGSUhIUDdPUkJv?=
 =?utf-8?B?UU1BRXBxM1VERDU5eUFpT2pnSFhUWEcrRXE0b3V1U0lrWHdhanFHMGRUeXc5?=
 =?utf-8?B?Vzd1OG02aXUzdmVjYk1iWlpCRml2ZFlCMU5Kc2hCMlRZVUtvMzQweU94cE82?=
 =?utf-8?B?ZGJkY2dxWTdHd3JKOHBsN2VyNWxZWVFkTEV4WUNRWHJualpRcVJjRXQ3OWVo?=
 =?utf-8?B?QzlITU9LaTJTWGVYa0JjaXBUMjkwMUk0OUtUZXpCRktSRFA5KzhxY21nblNQ?=
 =?utf-8?B?V1pic1Vob3N4Q3Q3V0pqOSt5YXhuWmZkNSt4bVYwaDBLakplQlAvdkpVZ0p4?=
 =?utf-8?B?MENJb1Q3N3M3TDJyTWxWczN0d3BtNThRUDF6bjF6WWhiWXZxYnl0eEQ1dkVm?=
 =?utf-8?B?OTZGUFZDZzhSc005YjcrbUFvaEREdzgxVEFTMVpWbVdBdXdhdUNwckhOTzQy?=
 =?utf-8?B?VU1iS0R4SHozbHVMMDhyb0FUemtGbFh4M25GeEZHZVVOcWZvN2pib0xoNXFP?=
 =?utf-8?B?ckcyWEliMXVlYVlvY3FKcGk2MktiVloxWmZyamJxaWJtYTExL2ZJSmVjaGZn?=
 =?utf-8?B?bVFPSUVjT0dsRmRQYmw5LzJ4TUphMXJKL2hnU1FHdXVINFlRL29VRVl0NjRn?=
 =?utf-8?B?VFRDdHdiSTJzV0xNK2NocUN3SkovVVFaNmZyODNqMnNSZTRsa0d6cStRNjJu?=
 =?utf-8?B?WE1DZ0NuTHp4Yzl4K2oyTEoremZFNUk4d2tNazFhb0g0bjZWV0EwcS9iV1Ft?=
 =?utf-8?Q?ercFAJRuuKk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmF4M2hOc3BIaUJWaDhLL1J0TFJmdHJNOEJ1OUl3MmlLaEVNZ2lpVFRLMmdK?=
 =?utf-8?B?T3JSMzh0cHlKZmZCeEZDd2RsaTFKeU5VVi9ObGFUd1hQRXljUGpDMjZFWGxn?=
 =?utf-8?B?M3BUZWp3ZDEvcXNsVkRXcWxRTUJCMFh4bmFBb1FEQVBGV0I5ZkxJSFRxK3RN?=
 =?utf-8?B?VWVXOUIxc09EWXRMWEFKbXg5RjQzamliblFwTDlidzVDbkhkUk5VSWNsaWdq?=
 =?utf-8?B?YXdrOXZtNjMwR250cmduQnpGRlNJUCszVzJDMFpxZys5UU5RRWxLMko5VnlI?=
 =?utf-8?B?bURqTUZGWEpLRW14bm1TeitNSFZVZ0NLbjE3a3g1SGVZMGp3U2RiN1I3MGNu?=
 =?utf-8?B?MXlHSnJqQ084SXZZMHREYUhWWlc4Y2NubHMxMml0Q01CS1BKTG80S3NPQlEw?=
 =?utf-8?B?OW1oZ2RsWTRUUjhDNjR3VXdNMGhIdEN1UmZsSnhkWUo2TWxLTnRyZXd3R1VR?=
 =?utf-8?B?eW1sWUZjNGhjRGE5VkN0cmlweGJvai9hV3FzZ1pjM2M2UlY2Nzc0NEZrSFBi?=
 =?utf-8?B?Z0draDcyTWhRZHVzYjRrVGkybjhnbmRoNHVQLyt5eDNGMGd6WWl4MXlSK05r?=
 =?utf-8?B?TnZsMXJPd1ZuODNXK1hwNUl6SzA2Ym1QdG5Da0FZMzd3NERXeHRVcWpDWW1x?=
 =?utf-8?B?RFZhTnZaeEl6K1JYejJ0U09SRlhCY1NHSE1scW55UnVmdC9ab1ZMWDA0cCsw?=
 =?utf-8?B?Mmw1ZFFmVVBiU1ZVZHFVblFyUGc3NVhHYnVIQ2NVdzJ5eHZraG9hcGVSK1RD?=
 =?utf-8?B?RkJjSlJZaDBIcXBQT2pGSXljejd5Tjd1M0J0bVN4dXgwbk1IMTZKWW5DSlc2?=
 =?utf-8?B?QWtUVUJrUnR1OHYvbjJQMHdHcGJ3eW9aRVZrdHo5UERLalEvRDYwc05WbHNZ?=
 =?utf-8?B?YXFaVTFRc2pjM0ErQ0h6UWI5RGlNV3lET1FTeFNwaXgwMkJyay95ZHpUSnZ3?=
 =?utf-8?B?UlllMGx1bitFdjUxWEpqYW8rUEdMWEdraEhzRCtwNHNZdllkSHpMR09mQjN0?=
 =?utf-8?B?TWlISXlFb3dOZnVIdmlITjJSQ2J5NDJpQjd3ekhxY09PZjYvLzZGd0NvV3do?=
 =?utf-8?B?NlZUb0R1Y2ZoeHFNU3BxaUJUdmRtWDlnaWl1cDFuQW11eTM3aGFaUTdnelM0?=
 =?utf-8?B?N01lOUY2cTBhYzZFY0xXdHJrem5Hd3ltN3RvZGE5TU5zRnljQzF5a2FuWE9M?=
 =?utf-8?B?RGlPNllDNDNOMEc4V2FxeHlsUmpxV0h4cko2OUhKaUwxQmVjdEpyWUV6dWM3?=
 =?utf-8?B?RHA5Ri8xUzd2c3pyMjk1QmtCSWJEbkhHYWJJRzNBTW5jVE1hOTF2RjlDa0lH?=
 =?utf-8?B?RlR2U1BkcHB1ZzR5Z1BWOHEweXlaU2VKRTdFSFBxSXVzT3Q3VVc1SndNeVBB?=
 =?utf-8?B?WTdUaVZQYUFBcXdYZlBCRDkvenJqWC9FbldWTTdNWUc4TmMxT1g4Tmp0c1Mz?=
 =?utf-8?B?TFJDSUY5aGJ0OWRqbHQzUk84SXFvTk5NR3lENWR2R3krdEFQdENZbld0SXYr?=
 =?utf-8?B?T080UEk5TFR3MmtkcHlQejR1VTFiMEFjOHRST2dIRDg5UkhwRHdabDUySndm?=
 =?utf-8?B?dnphU05odU0wOTVOdk42QjlUZUVCRTFZeEtvdEw1VEZZZkE3RkkxUm9LQS9v?=
 =?utf-8?B?bDZqOFhFRExTRzBTd3RDK2ZneXJ0R3NRUE9laW1rTndmM05XQVRZVklubTcr?=
 =?utf-8?B?U0FZdUYxSjMzdG5IZnVYYkFKNjJUQjRMMjI4VVFJNWM0MS9TQlQzWHpuR093?=
 =?utf-8?B?YzhMVWVBZEp2NEFGRUFvL01EdXUwN3hFeTk1YmJzR2gwaDlBSWVRQ3pBVlha?=
 =?utf-8?B?ckhJVFF3TkEyNXJUWUhEeUNBci9CWUJQVGJVRHByOWdKMnFmZ3A0cHdZRlVh?=
 =?utf-8?B?MW1Yalo2WE8vSTN3ajh0eWxuVDFZQ0dyTUZOL0gxNURvV2UvT0RTUkt2bC9q?=
 =?utf-8?B?a0tJQzZnSkFEbUdic25OOUJlRW9ZcVdtR3FRV2ZHSGI3Rlp5SnpycWs3TmN4?=
 =?utf-8?B?UWkxN1ZLWmNlYzFqdUEwZGVLWGQ5eVFkanduY2VTZnNxQXJId0oyc29aVFYw?=
 =?utf-8?B?dTlWaUJUZDhGSDB2cSt5bFIvYTlVNXFFSEJkaEM4OGdvSzMrdTBEQU1UejZl?=
 =?utf-8?Q?XWI8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d51cf2-9552-4d1f-6fe0-08dcce4a6a19
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 08:03:38.2486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPQyxcDMWRTzs+AeYMA7Z4dlQJRKTThZsQp4LhDIoPRbed8H3B9ct38S4ucmHLI297XQgP5132qiOSnsCU509g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9324
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

PiBTdWJqZWN0OiBpLk1YOE1QIElNWC1MQ0RJRiBVbmRlcnJ1biBRdWVzdGlvbihzKQ0KPiANCj4g
SSBoYXZlIGJlZW4gdGVzdGluZyB2YXJpb3VzIHNldHRpbmdzIG9uIHRoZSBIRE1JIG91dCBvZiB0
aGUgaS5NWDhNUC4NCj4gDQo+IEkgbm90aWNlZCB0aGF0IHNvbWV0aW1lcyBteSBtb25pdG9yIHdv
dWxkIG5vdCBzeW5jLCBidXQgc29tZXRpbWVzIGl0DQo+IHdvdWxkIG9uIHRoZSBzYW1lIHJlc29s
dXRpb24vcmVmcmVzaCByYXRlLiAgRnJpZWRlciBub3RlZCB0aGUgTENESUYNCj4gd2FzIHNvbWV0
aW1lcyB1bmRlcmZsb3dpbmcsIHNvIHJlYWQgdXAgb24gaXQgYSBsaXR0bGUgYml0Lg0KPiANCj4g
SW4gdGhlIGNvbW1lbnRzIG9mIHRoZSBMQ0RJRiBkcml2ZXIsIGl0J3Mgbm90ZWQ6DQo+ICAgICBT
ZXQgRklGTyBQYW5pYyB3YXRlcm1hcmtzLCBsb3cgMS8zLCBoaWdoIDIvMyAuDQo+IA0KPiBIb3dl
dmVyLCBpbiB0aGUgZG93bnN0cmVhbSBrZXJuZWxzLCBOWFAgY2hhbmdlcyB0aGUgdGhyZXNob2xk
IHRvDQo+IDEvMiBhbmQgMy80IG9uIHRoZSBMQ0RJRiB0aGF0IGRyaXZlcyB0aGUgSERNSSwgd2hp
bGUgbGVhdmluZyB0aGUgb3RoZXINCj4gTENESUYgaW50ZXJmYWNlcyBhdCB0aGUgZGVmYXVsdC4N
Cj4gDQo+IFdoZW4gSSBpbmNyZWFzZWQgdGhlIHRocmVzaG9sZCB0byAxLzIgYW5kIDMvNCwgaXQg
YXBwZWFyZWQgdGhhdCBzZXZlcmFsDQo+IHJlc29sdXRpb25zIHRoYXQgbXkgbW9uaXRvciB3YXMg
c3RydWdnbGluZyB0byBzeW5jIHN0YXJ0ZWQgd29ya2luZywNCj4gYW5kIGl0IGFwcGVhcmVkIHRv
IHN5bmMgZmFzdGVyLiAgSSBkb24ndCBoYXZlIGFuIEhETUkgYW5hbHl6ZXIsIHNvIEkNCj4gY2Fu
bm90IHZlcmlmeSBtdWNoIGJleW9uZCBrbm93aW5nIGlmIG15IG1vbml0b3IgY2FuIG9yIGNhbm5v
dCBzeW5jLg0KDQpZb3UgbWVhbiB0aGUgdHdvPw0KICAgICAgICB0aHJlcy1sb3cgID0gPDEgMj47
ICAgICAgICAgICAgIC8qIChGSUZPICogMSAvIDIpICovICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIA0KICAgICAgICB0aHJlcy1oaWdoID0gPDMgND47ICAgICAgICAgICAg
IC8qIChGSUZPICogMyAvIDQpICovDQo+IA0KPiBDb3VsZCB0aGUgdGhyZXNob2xkIGFuZCB1bmRl
cnJ1biBjYXVzZSB0aGlzIG1vbml0b3IgaW50ZXJtaXR0ZW50IGlzc3VlLA0KPiBvciB3b3VsZCB0
aGlzIGJlIHNvbWV0aGluZyBlbHNlPw0KDQpUaGUgdGhyZXNob2xkIGNvdWxkIGNhdXNlIGRpc3Bs
YXkgZmxpY2tlciBpZiB0aGUgdmFsdWUgY291bGQgbm90IHNhdGlzZnkNCnRoZSBiYW5kd2lkdGgu
DQoNCj4gDQo+IERvZXMgaXQgbWFrZSBzZW5zZSB0byBoYXZlIGEgZmxhZyBvciBkZXZpY2UgdHJl
ZSBvcHRpb24gdG8gb3ZlcnJpZGUgdGhlDQo+IGRlZmF1bHQgdGhyZXNob2xkcyB0byBjaGFuZ2Ug
dGhlIHBhbmljIGxldmVsPw0KDQpJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBhIHBy
b3BlcnR5IGFzIGFib3ZlLg0KDQorIERUIG1haW50YWluZXIgdG8gY29tbWVudC4NCg0KUmVnYXJk
cw0KUGVuZy4NCj4gDQo+IGFkYW0NCg0K
