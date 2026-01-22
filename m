Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJyMGw6AcWk1IAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 02:40:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D74E606E8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 02:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6412310E05C;
	Thu, 22 Jan 2026 01:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="B1HHn9Ok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11022077.outbound.protection.outlook.com [52.101.53.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2535910E05C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 01:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nc5BtGFArl3Ttaj4Vw2EbhT70K623mn/RFqelzC5qbfOp8A74XxcQfghDlBO+dxtIOBFN+mJv4cOjJzEhxMVOolb6EtejxxnMhDLps/pPGIx2QMwBA9415675IgPO+tWE5UkmdpWq6wpP/HRYBcO9gu6j00KAit1CdO1QLOVGcn1axePO64HoAy3I0+UZggGnYHtdVZ4jnYCR/G3r3mtfrDt7kNlITpzFY+gNDFn3dsIF5jdcvgb7NmpNtM5ebUb5nkIC+uzO1mRpjxR3hsIHK77diSFg3lHP3UzU0JuaDdiLaAHNbWGu5kfbGcYhroKHHrRj3IvDl1CiMARIptErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkefsen0RqyghZYcgIGIMf6m5ZPQrVAuoseQnT4z35M=;
 b=bbEAALBZim834rFORnSrgbi7G7CPZe9hn9cctEFaeEeC2+rhPL7dSrmoTOMyzkiMvajWNDUF7Rp42CY+j8t/PiukrD09QOeFIvMAlASjTgYPX9G778dkV355lcGGmEa/h6OE90kA51CKIwuDNfuHbHJgdzDhUopdCSb9KCejIeHTT+qqFYCGxqmCnyFdHhWkeSUqaBmzCdH1+HC2qubeZ8a4pjHxK0wiTqEeEvggRj1nHlOlf6ADNbtv7r1NK6UdjJb15HNWJpzgokEsGSXZA02G+U8BG1w21ZRw/KcGDHGnLFyoHpztycDU6MmfLHGZZ6tns4zaeEW3kgM0MpS9mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkefsen0RqyghZYcgIGIMf6m5ZPQrVAuoseQnT4z35M=;
 b=B1HHn9Okl7Q9dIJqtYo6+EgRwFzAPBODQlLUrK+BpZ3uA/lbOeC+FuY58Htft6qZdw3oWVu9XfpjKeK/MkSj0JjB5x8akVuog2Y0HFH0i4HIYpUjWkvnSgnUWbrMfedxyYb9e2IIkAfI0kKCcXk8DQTk3+apelQpJ9Ss37fwbmo=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6929.namprd04.prod.outlook.com (2603:10b6:a03:22c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.7; Thu, 22 Jan
 2026 01:40:20 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::d0a9:7455:cb02:ca08]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::d0a9:7455:cb02:ca08%6]) with mapi id 15.20.9564.001; Thu, 22 Jan 2026
 01:40:19 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] drm: bridge: anx7625: implement message sending
Thread-Topic: [PATCH v2 3/3] drm: bridge: anx7625: implement message sending
Thread-Index: AQHcir7vCW+ehNc2qE6mt3Ev72YIm7VdZ8RQ
Date: Thu, 22 Jan 2026 01:40:19 +0000
Message-ID: <BY5PR04MB673983628727BCDAB1D53A96C797A@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
 <20260121-anx7625-typec-v2-3-d14f31256a17@oss.qualcomm.com>
In-Reply-To: <20260121-anx7625-typec-v2-3-d14f31256a17@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|BY5PR04MB6929:EE_
x-ms-office365-filtering-correlation-id: 50a07957-5820-4b8a-bc02-08de595733b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TDVXdWtCTHErZnN3V2prUXA4b05CN2VSaUt3MXNYRlZXK0M1ajh1YjdhalNR?=
 =?utf-8?B?Z1Y2YUlvTTY5eXFjckhiY0JDc0I4TXlydDRWajYrSVgyclpqR1orNnhlVC9j?=
 =?utf-8?B?T25ZVkdDSk5oWXh0M3BYUjZ0b1QrY0l6bUVDVTExUlNNc3NUQklYaExaandL?=
 =?utf-8?B?ZWNxRytPY0diRmtjU0xERy9HeUZkOTRrS0VCZlpRamVXV0dvVmpFZEFZeTI4?=
 =?utf-8?B?Y2dSSExBTFY3OE9JOC84RkxJbGVlRUR6NktaTDROeHdycU9SbndQVTN4T0do?=
 =?utf-8?B?aEFwMkFJVVYydW9RdElvUUNSTUJSUUNqL0dUSldsanFIdWZqazBpY0FjQmtt?=
 =?utf-8?B?UVBSUG9KWU51SENRRVRSa1BNSmZEQXNrMnJWcER3SWQ1YVhBSFpML2NtVldN?=
 =?utf-8?B?Q2pjd1BqczIxRFJnTGpBSkpGM04zdFhYOTBNUi9uUTFXd3dKWWdJQXVVRWZr?=
 =?utf-8?B?ektQdVlNV3R2RFdUbE9qL3dvamU3dG83QXBhMlZlWWFiR0dNZzFBV2tGOTlr?=
 =?utf-8?B?dC8zb2FVVi9tY0p3eUxtNUgzdDNBTVNRamlLK0J4L2xzaVdSRStaZEJtZVox?=
 =?utf-8?B?UXVzUnpKb2NpSThkQUVCM3E4NmFrZHpPT0xuL1F3M3hHQjdUaVhsajdsUjdh?=
 =?utf-8?B?dFlVNXdEelJLclJseXZidmJyUzBDTkxSdjJhd3Z5RE9CTDlsc01LbGVLOGox?=
 =?utf-8?B?TTFwdFpmSlp5WFYrbGRTWWVaQmVvUjZyRktHZVk1Vi9oeWtBbFlydUEyV2dq?=
 =?utf-8?B?WkVldHgxSmx0RUhNVzhYVWdzZnd2U0tteFhDdWUrSFB4RkE0TXdtY2hqc3Nq?=
 =?utf-8?B?ZmVzRDBKcUwrTStEVFJnRFcvMFhUb3loTzlWNFZ1Q2RQcDdIcU5VSjcxQTl3?=
 =?utf-8?B?d3IzMWtUaDlBcVZpNmxuQll0TWc3SXEyZko1NnZHNUJTSHBZcFBudXpLM21i?=
 =?utf-8?B?OURubHFFZ0hKd1AwWkJVRzZQNE0xa2ltWWtBWjhXYUNVdnJ3a0IxY1BjaENC?=
 =?utf-8?B?RG1HUUdKcWV4NVZxakJIMHJFclZxcXNFQXJtUXJhYkNkbmxPSThjc1RBcmdj?=
 =?utf-8?B?L0hBSDl5WEtwRmNhd3F1ckF2L3F6MjNHNnRxa0RIM0lwbUdwM2diZGhsdFBz?=
 =?utf-8?B?bHVKN0tmbTFFRyt5WFg2YVJMN2NFOXFxYnlxMjNDcUxUYmdORmxySXBWeVlw?=
 =?utf-8?B?VWEzQjlza2R0RDdwcUI0NUVsTzNxZERkYVZBVUJ5aWQ1ZkVuQW9OYnVZZThE?=
 =?utf-8?B?WGtpNXp2Q1pVVVNLTWRsQWtYWjZ5WVBzL1gyVFZhOGxaMXBuNEN0U1ZjMEcy?=
 =?utf-8?B?NEozeEVkVWlGRk9iYTA2SUpWdjVibVlUUFdCby91NG5pc3kvU0Z3dzIxYzcz?=
 =?utf-8?B?SDZhUUhNdUtvcCtXQkxLVHNMNlF2QkY1QlRCb3JsR1RWTVU0MGxPNzNzUzB0?=
 =?utf-8?B?a0JrdXRzNTJtSEdLYTM5RlVjazV4b1g2QnFHOXhXaVREY2xra1NydW5WUXJE?=
 =?utf-8?B?VzlKNjFOTWZycmF0QStkUDBuSVJDV0lWeWtxSFlJNFRTeW44NE01VUthdy9W?=
 =?utf-8?B?YVVKNFNwTjkweVl5a2tVUTVoYVFsbW5ydzZlZUloVXk3UENUTVRCczNTVEpQ?=
 =?utf-8?B?d0pKa3hxbDFDa01LYVl2S0R5bHVwYlJjSTVEOXhwbGtESGE3eHRKUXpvZ05Y?=
 =?utf-8?B?VFVGTFN6VWpIM29UY0REclJ2VHFiL3VkNyt6UTl6TGI2cmRPekErNlNZR1lL?=
 =?utf-8?B?MDFteHpUSmhWdFJZY3ZZL25aeFp0ZkpMSDFoNE9vOGN3Q2NxUGFUMXdnRnA5?=
 =?utf-8?B?Z1RaU2gvTWI3N2Rqa1FaVXdrMUpXUzVCTDdidW9EcDRIaHE3dnRnbSt3T1pr?=
 =?utf-8?B?VUEvMDlTbVVSdHpEVHFZckpMcy9rL2J3TTEySU9yTUR1U0kyOTFRMHZhZ2tp?=
 =?utf-8?B?Y2hCcWNQb3RGL2czQkpOdzc5M3VzNGV1cGZSR3RxWG94V0xDOEVmdnFFaU82?=
 =?utf-8?B?dGpzNDZwQllJNzN2YVEzb2lYSFlqVkxnVW5Rd0ttRTNzY2MwYTJBU0xiTFlC?=
 =?utf-8?B?dDFQUlZzRm9YTkdUQ0ZpYm5Fd0ZOeWhsMDlLVHdRcWllM1JFN1FJUDBkNy93?=
 =?utf-8?B?eGFNNEZGYzQzbGRmYi9iOUZJZWtxbEJGRTROMHNhVEVuK0xSdDB4K29tdUpx?=
 =?utf-8?Q?DdBWqUmXL4kuOnJLjsoFFtoKukiSaUHTjVSSYoUrwTVm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzlURi9TRHBPTEIyenZGWXRPR0x3cFg0cDdaL1lGclhGTDNwa2M5M1lFN0Uy?=
 =?utf-8?B?Y3J3SnVLdXl4b0lFOTMvVkVuSHNKblI0QlhJczhHYzkrdE5ZL3J6akZjOU9C?=
 =?utf-8?B?d2N5dlhWVGpnUFRqL0xnQVlUKzZTa01nVVd0YnJmOWxaOEY5K0VJeStSdVhI?=
 =?utf-8?B?bmJtWFJTOUNPYkl1b3lNV0MyZE56QlpDZmp5VlB3VzJZcThET3g4ZzRFVXY2?=
 =?utf-8?B?RDNRRGJ0SlIwczBZbllOaXl6MWtSczhBQWJDNGJBN1JkcnJyVW5jbUhWUHIv?=
 =?utf-8?B?N2FnTVVHV1J6OStwRktFYmY4Y1dUY3FTNXBYTVZiR3F5c2g0ZDNrNzI0QXFV?=
 =?utf-8?B?aG9JRWozMW9KbGk4MFdzK3ByT2tjMXlCMzdiUWZacXZ3SXZwZ1kyWDR5SkpZ?=
 =?utf-8?B?RXE0a0xYNVJlZEdlOS9BeXkzY2Rmd0E3bTBLL01XVG9sTFUxaEdaeFlPanVG?=
 =?utf-8?B?SHRDZUdmSkdndTBlUlF1VXRrUUM0UERrcStCTnlDbFl1aEk4T2dpUkxJSnhs?=
 =?utf-8?B?WWFGUlN1Z1VSanpTMTJxdXpRa2hiMExxaEVlc1Y0RjFNbFRnVDcyT1VFaytV?=
 =?utf-8?B?UktMMWp6M0ZVa2NuTTFqNGhqTTkzK3daakFCTWNNeUtkVUE5UkxEazhnNGMx?=
 =?utf-8?B?U3VKU1VUeWZySFh2KzBtK09PbXJ0V2RDSkIwT2d0VHlHZkZsaDRDU2Z0bXV2?=
 =?utf-8?B?bngzTnJvTXdCMStvVXpRZnR2SnlINFZubE43QUF0OUdvTGVNN1VvZmQ3LzVh?=
 =?utf-8?B?d2RoVWI1UXA0MGlCWi81Y00vZWpnL2Q0clJrQ0NJYjhIMEcyeE9VWjNpZWpS?=
 =?utf-8?B?NHZqYWNCNXhWdmpnVENwbHd1VTloMXh5UkZvLzBxd2o5WG4zdHBnaEZ2ZVVk?=
 =?utf-8?B?KzF2SEpDNGNscGkybUtTaGxieTlpUTAzbWFZYVdDc0sxaDIwTUZpRk9aQzlz?=
 =?utf-8?B?SHJpMm51S3ZDdVlTT1pxTXdkNXp2M0crbmR3WThhaXZvZEExbVlMZHYvbHdy?=
 =?utf-8?B?WGpLK3BpNFpSV2FrV0tNUWVXR0kvN1o3U1lESUhkQ0wzOHYvUDVxOFhBRzdI?=
 =?utf-8?B?OVpzZVVyWUFPcjlkNHNTMk9lZEllRGFCclgzdEZTNUZQYXg2cTBsRUFWL3RY?=
 =?utf-8?B?ZDM4SkFvUW5ieE1GOG9nYURXOXI2NmhLNXdVVUlYTmtsY1RaVm94ZDVqcGZO?=
 =?utf-8?B?UDZEOXBseCswc2dvRjE3eWhHT0Uvd2Z4L1A1aUszRlJpSjgvcU1CcWFZTnFO?=
 =?utf-8?B?eUpNZFByMy9WMk1wdFBIaGhJQytTcWZRbWhKdlFvb00yNDM3dmZVaEpxcDRQ?=
 =?utf-8?B?L0hTQnFxWmMyc3VMRmhqWnJ4S2NUNG1XanhUMEU0NzBBbDRtYzg0VHJjN3hW?=
 =?utf-8?B?Vm5TeWF6MXZvcVZoLzlaQW5iaDMvYm1adFpBVklEYit0UGttVnF5YTB0MUx2?=
 =?utf-8?B?d3FUaG1MNmZ6d0IzR3hoY2tMelR2ZUlzUGM5c3lZaGoyd0h0Mk1RSGV3c0lG?=
 =?utf-8?B?d2VlSVpuTVVqcHZ0MVVXOFBOd1lvdmJKYUEyeTdlNWowOUlHWkJhZmlqS3JK?=
 =?utf-8?B?b3BZaWxVZlhuZURUZCtCOVlkWFE0c2YrdlZPUGE1VjZ2UWRJemxMcllNSk5z?=
 =?utf-8?B?Z0hBM0VhTERzNEZiNmh3LzlDMzB4cGFEVkdoMlJmMks4eWQvaDMwRkt2YjNm?=
 =?utf-8?B?T0pZOGo0clJhV1hGV2VhMUVDaHh2VWZTZWE0ZXViQ3RJUm5Obm5nOVRSWmc2?=
 =?utf-8?B?MUdVU1N5NStvdTdnajdIMlFPS0xnOFFXOFFXWTNaTi82amQ1cGhDZXp3dGYy?=
 =?utf-8?B?ZlNYOHZ4MVkxSVZsc1NIM1plRUVneENkODFhN1ZVNEpCQmJJbmkxSU5NR1NF?=
 =?utf-8?B?VS9Zb2dyTEkvOGw4ZFZKU1puSElPK1JaTkRzQlkweEVZUjdDQ2h6cTQ3czBT?=
 =?utf-8?B?ZnpPbVZsRnUvYnRWSDZSdGlSSU9BNjFwSVQ1WS8zemhsZHFBNXF3NjlBVDBT?=
 =?utf-8?B?Q1RJMUs5dnQzY25RZFlmaDZFT1RwdWhXdTcvTWlPMVlGVEo4VGZBaTl2QnFW?=
 =?utf-8?B?NjA1a2N4eUh0Y21NZFlWVTNRNjZvYlh5VGJNT28xYWQ1UnJLVHlab1JHZDdU?=
 =?utf-8?B?Qy9tZDkrWUlCaTRzNHcyS3QxdDdqQmJ5TE1wWjZyUUxmL013ZTQ2STlWeStJ?=
 =?utf-8?B?RXFHN0p5S205bUVsRFk4SWt3Vm43VE5lcVJwcUJLWTZJK2U1c2huMGNQWE90?=
 =?utf-8?B?ait6a3FpdTJVbDFiamNFYTNiUWdBRDRTMmcvbTFhMnM4S1VHanpudHpUUlRq?=
 =?utf-8?Q?0PB9iVkt8hAb49Z+sW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a07957-5820-4b8a-bc02-08de595733b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 01:40:19.7185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxof89pn5yb0545k4pol6f0ykUjBAq/gUhjh02ADDsKuTiVD64RwgJ5DwM8yQO1MlNkQ9mIcTfN4i/u2tAknqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6929
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[analogixsemi.com,none];
	R_DKIM_ALLOW(-0.20)[analogixsemi.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xji@analogixsemi.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[xji@analogixsemi.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[analogixsemi.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,analogixsemi.com:email,analogixsemi.com:dkim,BY5PR04MB6739.namprd04.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 8D74E606E8
X-Rspamd-Action: no action

SGkgRG1pdHksIHRoYW5rcyBmb3IgdGhlIHBhdGNoLCBpdCBpcyBPSyBmb3IgbWUuDQoNClJldmll
d2VkLWJ5OiBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPg0KDQo+IFN3YXBwaW5nIHRoZSBk
YXRhIHJvbGUgcmVxdWlyZXMgc2VuZGluZyB0aGUgbWVzc2FnZSB0byB0aGUgb3RoZXIgVVNCLUMg
c2lkZS4NCj4gSW1wbGVtZW50IHNlbmRpbmcgdGhlc2UgbWVzc2FnZXMgdGhyb3VnaCB0aGUgT0NN
LiBUaGUgY29kZSBpcyBsYXJnZWx5DQo+IGJhc2VkIG9uIHRoZSBhbng3NDExLmMgVVNCLUMgZHJp
dmVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlz
aGtvdkBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YW5hbG9naXgvYW54NzYyNS5jIHwgNjgNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuaCB8IDEyICsrKysr
Kw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYw0KPiBpbmRleCA4ZGM2ZTNiMTY5Njgu
LmM0MzUxOTA5N2E0NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbng3NjI1LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bng3NjI1LmMNCj4gQEAgLTE0ODQsNiArMTQ4NCw3MyBAQCBzdGF0aWMgdm9pZCBhbng3NjI1X3N0
YXJ0X2RwX3dvcmsoc3RydWN0DQo+IGFueDc2MjVfZGF0YSAqY3R4KSAgfQ0KPiANCj4gICNpZiBJ
U19SRUFDSEFCTEUoQ09ORklHX1RZUEVDKQ0KPiArc3RhdGljIHU4IGFueDc2MjVfY2hlY2tzdW0o
dTggKmJ1ZiwgdTggbGVuKSB7DQo+ICsJdTggcmV0ID0gMDsNCj4gKwl1OCBpOw0KPiArDQo+ICsJ
Zm9yIChpID0gMDsgaSA8IGxlbjsgaSsrKQ0KPiArCQlyZXQgKz0gYnVmW2ldOw0KPiArDQo+ICsJ
cmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBhbng3NjI1X3JlYWRfbXNnX2N0
cmxfc3RhdHVzKHN0cnVjdCBhbng3NjI1X2RhdGEgKmN0eCkgew0KPiArCXJldHVybiBhbng3NjI1
X3JlZ19yZWFkKGN0eCwgY3R4LT5pMmMucnhfcDBfY2xpZW50LA0KPiBDTURfU0VORF9CVUYpOyB9
DQo+ICsNCj4gK3N0YXRpYyBpbnQgYW54NzYyNV93YWl0X21zZ19lbXB0eShzdHJ1Y3QgYW54NzYy
NV9kYXRhICpjdHgpIHsNCj4gKwlpbnQgdmFsOw0KPiArDQo+ICsJcmV0dXJuIHJlYWR4X3BvbGxf
dGltZW91dChhbng3NjI1X3JlYWRfbXNnX2N0cmxfc3RhdHVzLCBjdHgsDQo+ICsJCQkJICB2YWws
ICh2YWwgPCAwKSB8fCAodmFsID09IDApLA0KPiArCQkJCSAgMjAwMCwgMjAwMCAqIDE1MCk7DQo+
ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgYW54NzYyNV9zZW5kX21zZyhzdHJ1Y3QgYW54NzYyNV9k
YXRhICpjdHgsIHU4IHR5cGUsIHU4ICpidWYsDQo+ICt1OCBzaXplKSB7DQo+ICsJc3RydWN0IGZ3
X21zZyAqbXNnID0gJmN0eC0+c2VuZF9tc2c7DQo+ICsJdTggY3JjOw0KPiArCWludCByZXQ7DQo+
ICsNCj4gKwlzaXplID0gbWluX3QodTgsIHNpemUsICh1OClNQVhfQlVGX0xFTik7DQo+ICsJbWVt
Y3B5KG1zZy0+YnVmLCBidWYsIHNpemUpOw0KPiArCW1zZy0+bXNnX3R5cGUgPSB0eXBlOw0KPiAr
DQo+ICsJLyogbXNnIGxlbiBlcXVhbHMgYnVmZmVyIGxlbmd0aCArIG1zZ190eXBlICovDQo+ICsJ
bXNnLT5tc2dfbGVuID0gc2l6ZSArIDE7DQo+ICsNCj4gKwljcmMgPSBhbng3NjI1X2NoZWNrc3Vt
KCh1OCAqKW1zZywgc2l6ZSArIEhFQURFUl9MRU4pOw0KPiArCW1zZy0+YnVmW3NpemVdID0gMCAt
IGNyYzsNCj4gKw0KPiArCXJldCA9IGFueDc2MjVfd2FpdF9tc2dfZW1wdHkoY3R4KTsNCj4gKwlp
ZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0ID0gYW54NzYyNV9yZWdfYmxv
Y2tfd3JpdGUoY3R4LCBjdHgtPmkyYy5yeF9wMF9jbGllbnQsDQo+ICsJCQkJICAgICAgQ01EX1NF
TkRfQlVGICsgMSwgc2l6ZSArIEhFQURFUl9MRU4sDQo+ICsJCQkJICAgICAgJm1zZy0+bXNnX3R5
cGUpOw0KPiArCXJldCB8PSBhbng3NjI1X3JlZ193cml0ZShjdHgsIGN0eC0+aTJjLnJ4X3AwX2Ns
aWVudCwgQ01EX1NFTkRfQlVGLA0KPiArCQkJCSBtc2ctPm1zZ19sZW4pOw0KPiArCXJldHVybiBy
ZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgYW54NzYyNV90eXBlY19kcl9zZXQoc3RydWN0
IHR5cGVjX3BvcnQgKnBvcnQsIGVudW0NCj4gK3R5cGVjX2RhdGFfcm9sZSByb2xlKSB7DQo+ICsJ
c3RydWN0IGFueDc2MjVfZGF0YSAqY3R4ID0gdHlwZWNfZ2V0X2RydmRhdGEocG9ydCk7DQo+ICsN
Cj4gKwlpZiAocm9sZSA9PSBjdHgtPnR5cGVjX2RhdGFfcm9sZSkNCj4gKwkJcmV0dXJuIDA7DQo+
ICsNCj4gKwlyZXR1cm4gYW54NzYyNV9zZW5kX21zZyhjdHgsIDB4MTEsIE5VTEwsIDApOyB9DQo+
ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdHlwZWNfb3BlcmF0aW9ucyBhbng3NjI1X3R5cGVj
X29wcyA9IHsNCj4gKwkuZHJfc2V0ID0gYW54NzYyNV90eXBlY19kcl9zZXQsDQo+ICt9Ow0KPiAr
DQo+ICBzdGF0aWMgdm9pZCBhbng3NjI1X3R5cGVjX3NldF9vcmllbnRhdGlvbihzdHJ1Y3QgYW54
NzYyNV9kYXRhICpjdHgpICB7DQo+ICAJdTMyIHZhbCA9IGFueDc2MjVfcmVnX3JlYWQoY3R4LCBj
dHgtPmkyYy5yeF9wMF9jbGllbnQsDQo+IFNZU1RFTV9TVFNUVVMpOyBAQCAtMTU0Miw2ICsxNjA5
LDcgQEAgc3RhdGljIGludA0KPiBhbng3NjI1X3R5cGVjX3JlZ2lzdGVyKHN0cnVjdCBhbng3NjI1
X2RhdGEgKmN0eCkNCj4gIAl0eXBlY19jYXAub3JpZW50YXRpb25fYXdhcmUgPSB0cnVlOw0KPiAN
Cj4gIAl0eXBlY19jYXAuZHJpdmVyX2RhdGEgPSBjdHg7DQo+ICsJdHlwZWNfY2FwLm9wcyA9ICZh
bng3NjI1X3R5cGVjX29wczsNCj4gDQo+ICAJY3R4LT50eXBlY19wb3J0ID0gdHlwZWNfcmVnaXN0
ZXJfcG9ydChjdHgtPmRldiwgJnR5cGVjX2NhcCk7DQo+ICAJaWYgKElTX0VSUihjdHgtPnR5cGVj
X3BvcnQpKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bng3NjI1LmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuaA0K
PiBpbmRleCBhMTg1NjFjMjEzYWYuLjk1N2QyMzRlYzA3YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmgNCj4gQEAgLTY3LDYgKzY3LDkgQEANCj4gICNk
ZWZpbmUgQ0MyX1JBICAgICAgICAgICAgICAgICAgQklUKDUpDQo+ICAjZGVmaW5lIENDMl9SUAkJ
CShCSVQoNikgfCBCSVQoNykpDQo+IA0KPiArI2RlZmluZSBDTURfU0VORF9CVUYJCTB4QzANCj4g
KyNkZWZpbmUgQ01EX1JFQ1ZfQlVGCQkweEUwDQo+ICsNCj4gIC8qKioqKioqKiBFTkQgb2YgSTJD
IEFkZHJlc3MgMHg1OCAqKioqKioqKi8NCj4gDQo+IA0KPiAvKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+IC8NCj4gQEAgLTQ2
Miw2ICs0NjUsMTQgQEAgc3RydWN0IGFueDc2MjVfaTJjX2NsaWVudCB7ICBzdHJ1Y3QgdHlwZWNf
cG9ydDsgIHN0cnVjdA0KPiB1c2Jfcm9sZV9zd2l0Y2g7DQo+IA0KPiArI2RlZmluZSBNQVhfQlVG
X0xFTgkzMA0KPiArc3RydWN0IGZ3X21zZyB7DQo+ICsJdTggbXNnX2xlbjsNCj4gKwl1OCBtc2df
dHlwZTsNCj4gKwl1OCBidWZbTUFYX0JVRl9MRU5dOw0KPiArfSBfX3BhY2tlZDsNCj4gKyNkZWZp
bmUgSEVBREVSX0xFTgkJMg0KPiArDQo+ICBzdHJ1Y3QgYW54NzYyNV9kYXRhIHsNCj4gIAlzdHJ1
Y3QgYW54NzYyNV9wbGF0Zm9ybV9kYXRhIHBkYXRhOw0KPiAgCXN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKmF1ZGlvX3BkZXY7DQo+IEBAIC00OTcsNiArNTA4LDcgQEAgc3RydWN0IGFueDc2MjVfZGF0
YSB7DQo+ICAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsNCj4gIAlzdHJ1Y3QgbWlw
aV9kc2lfZGV2aWNlICpkc2k7DQo+ICAJc3RydWN0IGRybV9kcF9hdXggYXV4Ow0KPiArCXN0cnVj
dCBmd19tc2cgc2VuZF9tc2c7DQo+ICB9Ow0KPiANCj4gICNlbmRpZiAgLyogX19BTlg3NjI1X0hf
XyAqLw0KPiANCj4gLS0NCj4gMi40Ny4zDQoNCg==
