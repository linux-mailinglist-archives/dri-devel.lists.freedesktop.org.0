Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE82297AA75
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 05:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C2610E1D7;
	Tue, 17 Sep 2024 03:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="4Z+Qhy2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047EA10E1D7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 03:16:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdoIAbWtvGwsgufEuF9l9yR7Rp/kZPlAtB66h1fzP7SP+obwHePMIz4PvMtzbwVqUghz9+1/rpBYbRT+jWfw7vSaeFOJNNdVTeXlZKYTKVbgTLq355CDo4/bxOtdLy+mtky4C8qIrFJ7ndx1jcaydwrH/dCsVCi+hnECkc7GsCNLkFet5wMpRqeVjy0qaTFQLVaDvRi2QeYjfkZFujo3dbDEql02dIqXnO7gRBDf9esKQMYcyTFVUlxVOg9ILy60U+NkpHtTV5B5JnIv4Q+JQdMH9kCc4EEwaABVAz/ronpzrMgY7AZu5KZTxrMCYy+e9yAxiDsb7MtKTRhTRzbgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3b7jdovQ3G9zMLiFAZPvKECVrTDW4YH6J8nm/WPMNqM=;
 b=tnCUMxi0a+5yeBhFylZbfg0AzDmsgsdYyNRqgnV38ZJaxhXiJBT0VyoYA81tty0Kru+4CX4dQZLs/Xh5BbjN5lkoAUqxUiDUgfHajz1jp/M+ULI6g/zLIO8MinsIVthdLYcuJymswOpIrXAsF+qtyZOTIrEuJ4aqsSKjkRO6oSiWx4xqSOxzttpxaNv06jKECOHGPo9Tcrxam0CIl3XcAqW5kDLNO86bV+E0qfCZXfbLT7WGvGgRq1ars7s0QdQKaaqFvuNGhtYgeTp8IehnfRptKek4lZ1N3FcZF1Nru4xabefTvl8AcybOLkh96W65tI1oUmRbZHRWrlsD13z+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b7jdovQ3G9zMLiFAZPvKECVrTDW4YH6J8nm/WPMNqM=;
 b=4Z+Qhy2xl/gnrmAlLDyxAVqMtkcfqovAOoneySF76fFLCgNO/LEhi6i3mWFmdM6TiqOTwVzX5/8KNVGqAt/tY/dOVU8K50kVK9mnVY5o7opg33ErB7Pu47ff01aIqU4eqw1a4YbW6C5ezTRE0oiL3CA5UwuNiSMHBSds6JfVUpCrB5RzpZTaAuMajXB6f8RKXsKxTpu8tBFZ74JSJaqGgmfik0x6NmJBKlVzQMlkvBN//TjOn7fmG6nJDIG4Zp2khD2z8j47lcb6Smvq4zFksgDEcDg3QO9S0S5kyJ3HwHNV+WuXA1lpvtDaRGJUZWuD8LVcXDrgl5wXIjASafPxoA==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 03:16:53 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 03:16:53 +0000
From: <Manikandan.M@microchip.com>
To: <conor@kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <geert+renesas@glider.be>,
 <mpe@ellerman.id.au>, <rdunlap@infradead.org>, <Dharma.B@microchip.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: add sam9x75-mipi-dsi
 binding
Thread-Topic: [PATCH v3 1/4] dt-bindings: display: bridge: add
 sam9x75-mipi-dsi binding
Thread-Index: AQHa7jg/AxrwKF2pJU2+HZGoh+wjwbImx9aAgDS7zgA=
Date: Tue, 17 Sep 2024 03:16:53 +0000
Message-ID: <5cb63b40-9710-4a6d-984d-1be1394dcb63@microchip.com>
References: <20240814105256.177319-1-manikandan.m@microchip.com>
 <20240814105256.177319-2-manikandan.m@microchip.com>
 <20240814-anaerobic-unpainted-532b8b117b79@spud>
In-Reply-To: <20240814-anaerobic-unpainted-532b8b117b79@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|SJ0PR11MB5772:EE_
x-ms-office365-filtering-correlation-id: a72d10eb-b469-4160-4b5b-08dcd6c72dc1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aUZCbWM3S2ZPOFh2SmVRdGY4YURDeXFtODBSSHozRjViTHI5S1ZGR25UaFJt?=
 =?utf-8?B?K3Z3WkpjTGoxcjlNMzZ6Q2ZLem91VnFKVUcweGtDUVllMW1oK0JndytvSnBW?=
 =?utf-8?B?OG50WFBrbGJLeUh3SUUzK1Zoc2M3VEhPSUR1MC95TVl1SFo1MXJ4bWlrNkVw?=
 =?utf-8?B?UFlJNGtKbnFXNkJXdVdvck9NMmpPOHpEbHRCb2tsam9iaXBHUXAxYUFwYnQ3?=
 =?utf-8?B?NXdHTUVJaFYwUGlmUlVqdXYvZ2lqYTZtUHpWWkFraFVEQ2kwL3lxSEVBVXlK?=
 =?utf-8?B?QnJHWmpHNDV1M05lWFMxOTh6TGZYNmJLdXRMRlFPb3NuMGhZWDl4bG1PY2dq?=
 =?utf-8?B?bEpETW1DcndrbURUQ2poZUVpU3hQNEFUa0hRZlZmdmZUSWd5U28xWjR0RW5J?=
 =?utf-8?B?TTZ1TmEzTGVrWlV6UkhJVk9tdXlXZWRYaEtFbUk5TVUwSENSMGZhQnZNQ29U?=
 =?utf-8?B?WldJSnlVcWxEUEZhMW9QVHBKTG40RWJ2MnAwanlKcnBlNnk3L2J0LzRMWmg4?=
 =?utf-8?B?QjBWc3Mvc05EVFh5T0pmNFZteWVtZFNJWEtjY2c0c0diZkc3MVBjaXA4TkZE?=
 =?utf-8?B?MEpQcE1vbm1OY1dHK0xwbDcxS2xuUjJ1VFVyaWhHNlRBcm9oRURIODhmOCt0?=
 =?utf-8?B?SnlUbFQrSkxxNXBnV3RadTVxWno2RlhqZVlBZWo2T2ZWVUVZQUhtYTYrR3kv?=
 =?utf-8?B?KzJ3eUxoU2ttWTBCZXVUSVZmWVkwVmdmMGtBTUVITFpSRGJweUU2NCtPMTdE?=
 =?utf-8?B?d3FZTjNaeDlXTUU4R01rbUpySG9USkdHeHN3Q0I3a0ptYjRteVpxVEppSksr?=
 =?utf-8?B?WXB6K3BEamcxQjNKcXcvMHkzNTNtamEzanppMnhMNkR5eHVzcDBJZUVBVG0x?=
 =?utf-8?B?dk91elk4TmZKTE5rU08yazNhNEtRcmtCOUdhc3hwMEdpMWtOZ0Zha2VTZHJk?=
 =?utf-8?B?dEZLVlJiRE81ZGZLT2dWZGR4UkhoWW1VaXNEZjN0R05GMUdEWHc3WmN4U3JQ?=
 =?utf-8?B?Rzl3RzFwSTlXZENYd3ZOUmFERUNsSGdhMXQzYVVLQTRKdXNSVEs5N3d3V2pZ?=
 =?utf-8?B?eTY4am9Ebm1tWXdLdFpsQXlDOGxPUnBDWVRBcHZtRitIS09DN3NPS3pZYXRv?=
 =?utf-8?B?cm5rY2dHMDBFTUtDUFdsMVZsOVcwR2FDWkp3cDJMNldJbGdXNXpWeVFrZXZp?=
 =?utf-8?B?ekRWVWZCajloZFNVMWVYQTBZRU1NL0VSazgzc2c1VzZKMDhTZy9YWFN2Lzgr?=
 =?utf-8?B?RUpnYTVwN2tXRVprWE5GOWphc2dNSkxnZVdJU2VnM0V6b2VmK3FuV1U1dmE4?=
 =?utf-8?B?UHRRNDdiWGw2SlVXRWJlZjc4eVlTdElEN2RNT3FKZHlXMElrK25xcEdoQUlF?=
 =?utf-8?B?V2daV0NWS09zbnhmQkFqMkFGbkM0enh6QmpaRXcvWjNzY2Iva01OVUFJenVo?=
 =?utf-8?B?LzhTRkpyUThKTnlLOUVISWkxRTl6Um00Vk5kU1gxaVNxaWVrSXJsVDF6MHg5?=
 =?utf-8?B?U3ZKbVlmMXE3WmFLa2R3OU1BbVJkUVdWdmtkYUgwejkwL1doYm11TGxwSXFy?=
 =?utf-8?B?TEFxZHpMY2lYZnpBK1ZtbE1EZE93aHM1NTRpZE5BZ0ZFVkQwTnJFQzZpTUZm?=
 =?utf-8?B?Z3FKN3RtaHFJQUQvcVZhK2VaTEFKLzVjOGkxeGtOWDdJdE5RbU03N2E5b3g2?=
 =?utf-8?B?QTkyM2J4T3dCL01MSGUyY0lSSEw1RWcvZldUYVBVQkt1d0tiVXRQcnNpSndE?=
 =?utf-8?B?Y2NibDBUSzBUSFdFeEc4R0xscmR2bGJHMUhNNk9XazJxQXlHRDl2VTg1TDEx?=
 =?utf-8?Q?FjzN5mmWyDdi3GYdqE8X4MNFTx0qL3LI4CnR8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STZjSXl5eDlUa1ZYWmpHdm9rdGVDMWRXVmlVcERITmI0K3VZb0JxU3hySzQ4?=
 =?utf-8?B?NHVudlZRY1RteE5EMHdJM3ViZXlmS0svNkFEa2UyVHZ6V2dCTGI3RU45QUw1?=
 =?utf-8?B?QXFQQlhYSFhweEg0V2R5cUlDcWdDQmZjSDZNaC8xTEpBMjdCSVVwRGJ3N0lX?=
 =?utf-8?B?ZjdQVHJlZWtjL0JXcis3cGtMRG11SWNTTEE2WHlGVUVSUDZFNk95S2JHN04w?=
 =?utf-8?B?K3N5Q29zZ3JyMkY5NWdCUCtJMkZTR3J0dGZtMXRNdXJlV3Bzcm9WdGFFc3dN?=
 =?utf-8?B?ajAram1iVUN3MWYyOXpGZG92dm4wVVFPeUpPcXZCdFl1WXFGVjAxdU55alhF?=
 =?utf-8?B?N05sY0I5OXZJeDJ0NGFIMGtXUXV3WEFLMXdWM1gwb3p5VGJXNEVTSHlIZExL?=
 =?utf-8?B?UldNR28xV0pnRlNYZG12VjZBZDU5VTlLSGtUQzFzdGNFV1FFbXNjK3llUGRJ?=
 =?utf-8?B?YXErd1BTN2RIN1VMaU1IajV4VmRCVmIzcURzS3pMRndXQzVORTI5K0VYS1FE?=
 =?utf-8?B?T1JTUFNHaHpodmJlWHRBUFlCVVUzdW9lZEpRWGxVK2M5SCtTVVJsTUtVSHph?=
 =?utf-8?B?dHhNb2RyTkx3TzVVa2p6d2FOWEhRS1hQV2FFUTZLa0tWNlFrMDlDYnlYWUVy?=
 =?utf-8?B?NFpWcWxqazhQamxuLzIwbFdNWlY2TFNaRjZpZnR1KzdRUSt5bGV4VkRZWXJJ?=
 =?utf-8?B?ajNUdUVvTE9QbjYxSnJYVmFBaXRUTk5FTFJKK3RXMFhNVU9PNWtrVVZ2cEZt?=
 =?utf-8?B?SmtlckhuWXNVWi9XaFBFNE1yZkNPNXc4MWNiSjlmT2ZrR21Bc05adGJDYzNY?=
 =?utf-8?B?QTNkN0toQ2szbitZam90VHNXOVRLdkdJNmkwcHY3eHNOT0pFbkpwL01LVURj?=
 =?utf-8?B?bC9ReXNleDZVZVh6RFhzTDlQY0tqSDdoZXVsL09iNU5sdkI0SjdEclIvcTZ4?=
 =?utf-8?B?WGdPOUtMc2FybTFMaTJDa2NIOWNCdWorR04vaWdseHhvbHl0aHZNTWorVmZM?=
 =?utf-8?B?NXVJK05rOHJKWFVLUXZra2kyK0wyeXB0aUdic1lZNDFvZGtWYWVPdSs0Q2hn?=
 =?utf-8?B?S1BXbEduNkcyRUVGd0g1ajZLc3Z2bCtPUTRRNGJRbEFzbmcrWXFGRHJkYmFu?=
 =?utf-8?B?OHBGZ2ZOa0J4K3JlaTA2VEhUWXV4TmxzSEJNM0RTUDE1QStQVTFDMTJ0WmJL?=
 =?utf-8?B?MXRMc1JTbUVqeEtMMStrNmdGUnlRMitJcUNaN3I0Z3kyVVYyQUZLbnhOSU5t?=
 =?utf-8?B?NkxSTmJ0ZXBTeHdUcWozcVBzM29tRHRNd1FHNEdybGlmTEVRaXFnWGQwdEtG?=
 =?utf-8?B?NTRDaEZLN2JrazZYQzVPUE5sbGV6MWtZd2RDWGZ1V3NrYTFWR1NaWVFQMUZl?=
 =?utf-8?B?KysvaXVEZnFLR0QxVUhnd051MXZIV2E4Tnl2YkVvY2cyZ2VCVC9qeW9yZ1M3?=
 =?utf-8?B?L3FqTUxwSEFDcFBtV1EzQW9YeW9BRkdVMkFEQUtHekx0bjZNMW5lY1JnY1po?=
 =?utf-8?B?TUZ6T0lwVVZXeWVNNUY4VEZ1SGk1aUZ3MDY1UXRKTSsxUzhuSUJ1UWRxSk1P?=
 =?utf-8?B?bVJqb1JkYVdQYjYxdzJld2R3Zm9MZnB0Q1g3OTdLN211enBmOElyeVZIQW9J?=
 =?utf-8?B?VEdCUkRKKzk1TFZLdUN4bG4yTmFrWkhKOWlrZnlMQXd6TVdEajBwT2I0Ky8z?=
 =?utf-8?B?aTB6OXk0VEx5ZGJmWkNNRXE2RzVhUDRoTlNqTFR0OEFjYkdXalpwKzJCaXZn?=
 =?utf-8?B?d080ZXhoVUIwSkYraFI4VHFmR3lDaHBSWnJzTGhzdXU1d2o2UjVvQjB4dHB0?=
 =?utf-8?B?ZHFKS2d1c2l5ZEFGVjZyd3VaeC9wSkRYYllCT2lTNXMyWG9xNzBhTm5HdHRr?=
 =?utf-8?B?bmtIQkY0andzNmVZMG40dy96cDRTL3BVSVV2UnB1Z3h4aFBPRTlabEZMOUgz?=
 =?utf-8?B?VnpLUW5uVjhkbGtuemw0YVVaY05xUDRrVlJERHYvL3FHaThQMGNuNStvbngy?=
 =?utf-8?B?RklqVVltY1lCQm5YUFl2UVh5bXBacmsvMm9HVlByUnBpVzJCVk05dlFFRS9z?=
 =?utf-8?B?bCttVmFzdVlyQi9pNnVVcTlaWnJtUUk4SjlhNk11ZWpqRFBka2lvVzB3WFpD?=
 =?utf-8?Q?TNxjtPfn+6OvOIt/rVm4nffGs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4669A5A57250E74CAC9F6B104D624C12@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72d10eb-b469-4160-4b5b-08dcd6c72dc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 03:16:53.4150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +hLCJ1CtE+DobAnt5OsoN5HaJMcchoa2HA9ebupeOU0LbT5jz31uh3MyX6tSjCz9CAdoAOU9ygpCACexYQLaKomzyGOvzaz0c55skeW7xrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5772
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

SGkgQ29ub3IsDQoNCk9uIDE0LzA4LzI0IDc6MjkgcG0sIENvbm9yIERvb2xleSB3cm90ZToNCj4g
T24gV2VkLCBBdWcgMTQsIDIwMjQgYXQgMDQ6MjI6NTNQTSArMDUzMCwgTWFuaWthbmRhbiBNdXJh
bGlkaGFyYW4gd3JvdGU6DQo+PiBBZGQgdGhlICdzYW05eDc1LW1pcGktZHNpJyBjb21wYXRpYmxl
IGJpbmRpbmcsIHdoaWNoIGRlc2NyaWJlcyB0aGUNCj4+IE1pY3JvY2hpcCdzIHNwZWNpZmljIHdy
YXBwZXIgZm9yIHRoZSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkgRFNJIEhPU1QNCj4+IENvbnRy
b2xsZXIgZm9yIHRoZSBzYW05eDc1IHNlcmllcyBTeXN0ZW0tb24tQ2hpcCAoU29DKSBkZXZpY2Vz
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuPG1hbmlrYW5k
YW4ubUBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiBjaGFuZ2VzIGluIHYzOg0KPj4gLSBEZXNj
cmliZSB0aGUgY2xvY2tzIHVzZWQNCj4+DQo+PiBjaGFuZ2VzIGluIHYyOg0KPj4gLSBMaXN0IHRo
ZSBjbG9ja3Mgd2l0aCBkZXNjcmlwdGlvbg0KPj4gLSByZW1vdmUgZGVzY3JpYmluZyAncmVtb3Zl
LWVuZHBvaW50JyBwcm9wZXJ0aWVzDQo+PiAtIHJlbW92ZSB1bnVzZWQgbGFiZWwsIG5vZGUgYW5k
IGZpeCBleGFtcGxlIERUIGluZGVudGF0aW9uDQo+PiAtIGNvc21ldGljIGZpeGVzDQo+PiAtLS0N
Cj4+ICAgLi4uL2JyaWRnZS9taWNyb2NoaXAsc2FtOXg3NS1taXBpLWRzaS55YW1sICAgIHwgMTE2
ICsrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMo
KykNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9taWNyb2NoaXAsc2FtOXg3NS1taXBpLWRzaS55YW1sDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9taWNyb2NoaXAsc2FtOXg3NS1taXBpLWRzaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL21pY3JvY2hpcCxzYW05eDc1LW1pcGkt
ZHNpLnlhbWwNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAu
LjNjODZmMGNkNDllOQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL21pY3JvY2hpcCxzYW05eDc1LW1pcGkt
ZHNpLnlhbWwNCj4+IEBAIC0wLDAgKzEsMTE2IEBADQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+PiArJVlBTUwgMS4yDQo+PiAr
LS0tDQo+PiArJGlkOmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdl
L21pY3JvY2hpcCxzYW05eDc1LW1pcGktZHNpLnlhbWwjDQo+PiArJHNjaGVtYTpodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+ICsNCj4+ICt0aXRsZTogTWlj
cm9jaGlwIFNBTTlYNzUgTUlQSSBEU0kgQ29udHJvbGxlcg0KPj4gKw0KPj4gK21haW50YWluZXJz
Og0KPj4gKyAgLSBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbjxtYW5pa2FuZGFuLm1AbWljcm9jaGlw
LmNvbT4NCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjoNCj4+ICsgIE1pY3JvY2hpcCBzcGVjaWZpYyBl
eHRlbnNpb25zIG9yIHdyYXBwZXIgdG8gdGhlIFN5bm9wc3lzIERlc2lnbndhcmUgTUlQSSBEU0ku
DQo+PiArICBUaGUgTUlQSSBEaXNwbGF5IFNlcmlhbCBJbnRlcmZhY2UgKERTSSkgSG9zdCBDb250
cm9sbGVyIGltcGxlbWVudHMgYWxsDQo+PiArICBwcm90b2NvbCBmdW5jdGlvbnMgZGVmaW5lZCBp
biB0aGUgTUlQSSBEU0kgU3BlY2lmaWNhdGlvbi5UaGUgRFNJIEhvc3QNCj4+ICsgIHByb3ZpZGVz
IGFuIGludGVyZmFjZSBiZXR3ZWVuIHRoZSBMQ0QgQ29udHJvbGxlciAoTENEQykgYW5kIHRoZSBN
SVBJIEQtUEhZLA0KPj4gKyAgYWxsb3dpbmcgY29tbXVuaWNhdGlvbiB3aXRoIGEgRFNJLWNvbXBs
aWFudCBkaXNwbGF5Lg0KPj4gKw0KPj4gK2FsbE9mOg0KPj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9k
aXNwbGF5L2RzaS1jb250cm9sbGVyLnlhbWwjDQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+ICsg
IGNvbXBhdGlibGU6DQo+PiArICAgIGNvbnN0OiBtaWNyb2NoaXAsc2FtOXg3NS1taXBpLWRzaQ0K
Pj4gKw0KPj4gKyAgcmVnOg0KPj4gKyAgICBtYXhJdGVtczogMQ0KPj4gKw0KPj4gKyAgY2xvY2tz
Og0KPj4gKyAgICBpdGVtczoNCj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOg0KPj4gKyAgICAgICAg
ICBQZXJpcGhlcmFsIEJ1cyBDbG9jayBiZXR3ZWVuIExDREMgYW5kIE1JUEkgRFBIWQ0KPj4gKyAg
ICAgIC0gZGVzY3JpcHRpb246DQo+PiArICAgICAgICAgIE1JUEkgRFBIWSBJbnRlcmZhY2UgcmVm
ZXJlbmNlIGNsb2NrIGZvciBQTEwgYmxvY2sNCj4+ICsNCj4+ICsgIGNsb2NrLW5hbWVzOg0KPj4g
KyAgICBpdGVtczoNCj4+ICsgICAgICAtIGNvbnN0OiBwY2xrDQo+PiArICAgICAgLSBjb25zdDog
cmVmY2xrDQo+PiArDQo+PiArICBtaWNyb2NoaXAsc2ZyOg0KPj4gKyAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+PiArICAgIGRlc2NyaXB0aW9uOg0K
Pj4gKyAgICAgIHBoYW5kbGUgdG8gU3BlY2lhbCBGdW5jdGlvbiBSZWdpc3RlciAoU0ZSKSBub2Rl
LlRvIGVuYWJsZSB0aGUgRFNJL0NTSQ0KPj4gKyAgICAgIHNlbGVjdGlvbiBiaXQgaW4gU0ZSJ3Mg
SVNTIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIuDQo+IEknbSBjdXJpb3VzIC0gd2h5IGlzIHRoaXMg
cGhhbmRsZSByZXF1aXJlZD8gSG93IG1hbnkgU0ZSIG5vZGVzIGFyZSB0aGVyZQ0KPiBvbiB0aGUg
cGxhdGZvcm0/DQpUaGlzIHBoYW5kbGUgaXMgdG8gbWFwIHRoZSBtZW1vcnkgcmVnaW9uIG9mIFNG
UiBub2RlIGFuZCBjb25maWd1cmUgdGhlIA0KRFNJIGJpdCBpbiB0aGUgU0ZSJ3MgSVNTIGNvbmZp
Z3VyYXRpb24gcmVnaXN0ZXIuDQpjdXJyZW50bHkgdGhlcmUgaXMgb25seSBvbmUgU0ZSIG5vZGUg
aW4gdGhpcyBwbGF0Zm9ybS4NCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFu
IE0uDQoNCg==
