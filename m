Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B4E986E99
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 10:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96B010EB02;
	Thu, 26 Sep 2024 08:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="FziVE3ZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E78D10EB02
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRAixUBhlsGE+RXpm+imMCFsd76MalUZS26jPEoXGws1F9rKou2QquQXxfvUaXaFYWoVoy28ipc1AiDsFdOpnbuxlQgYiyPPdRXG0Tr6F+gc9Egt1O0K5dZOtp2fvEUSKlIwGwUv3siteptqGg0rxTBUtFKyPevatgWeu9j+YhS/60X9V7AvTZ6+f+VIUneGi4HdcpnxHd2TqxHnEdUflh56+xwZh3j49f78zmPsM2pchYHtKexNvOsJ+pbRqVYdFmUJrL16+Eilm6PkuD3w4d4qLW6v8VxwpKy6XvMGYmF9fZ/je7lqRcmWzyIYQa8oPv4aKiPWYQ9Ca+jJyr25oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gz1T2OKZPe4N0W3TXe1Ff9ua1xFidRwn7t4RJI5+Aw=;
 b=wNxPwhdFsnmAPgZ4GfgY9E6gu0MTYHnaM9i4pnhwsSBjtUF9SpLFFmrmS8aYJzrL0SEGkxFVzdzOX1hJdwfQw9xZFvp8JfaVjv2+7PNWe9a9v/XvyxDi2SvZ4vvyCXvC4DQyzyIkgj9fzIKmhi7pg0rTJvQov9gJ9/rQsJqEUSnoJtpEVXp1ytTNgbWFi7p5TsLrQEzrYB95VTFetA9X3kjlxWdi3NX7kk1ZqwIKCDFFRJrlqRIGTp5nQKFZceUKTF2BJzU1WxlMldZX1neXZuAf48ZEwX8ccaLPcz2OcyV93zMPMyItZdCuZ81bCjk+IluVxV5yDxUXxL563FRMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Gz1T2OKZPe4N0W3TXe1Ff9ua1xFidRwn7t4RJI5+Aw=;
 b=FziVE3ZGfmZLvyF6Sn0fq+LBG6uzvemIaZwDrVsP+evrBblC4ONRxrqO0qQvVcnDoJ4BXtplm+Uc+cqcDhRUxlk4PmeFNx83GyP2M2+X+J2TssaOg34ikV5cPw8o49wWfNtudHyOK8K87b0wkumb3rH5YWh9smL7+OSsIEU7SSWjHMTzkRJS/ZkvJ7Mndw191nr7zkl/x0yFyQSW0yMieUMGP5F3Cr45ZDgzCGCaiF+QCQcb5fNNiKNT2g72OmdTg3oa6Cj+BQHYWhBjc7sfJvTQtVP4qryEBDe9OPaV5eOgStS+6haj07YExUbw3tJPktPkq72lKZg9i3XyDRbn4Q==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by CY5PR11MB6536.namprd11.prod.outlook.com (2603:10b6:930:40::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Thu, 26 Sep
 2024 08:17:11 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 08:17:09 +0000
From: <Manikandan.M@microchip.com>
To: <dmitry.baryshkov@linaro.org>
CC: <neil.armstrong@linaro.org>, <quic_jesszhan@quicinc.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Dharma.B@microchip.com>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Thread-Topic: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Thread-Index: AQHbCnSYAKfSHYvzgEG+hCzJDy3M9bJg0qeAgAQRYgCAAATmAIAE2xwA
Date: Thu, 26 Sep 2024 08:17:09 +0000
Message-ID: <17b5a11c-b9a8-4172-831e-d52f1a4270e9@microchip.com>
References: <20240919091548.430285-1-manikandan.m@microchip.com>
 <20240919091548.430285-2-manikandan.m@microchip.com>
 <zognzunciriytm3uvoolxjsvu43v3m2lnctsz5swusnmm3aj2z@ag7zkncccdmf>
 <83e9d20d-f294-4303-b570-816ebc989bcf@microchip.com>
 <f4z2egmrcoh7kih2pyr3mq7fzuwtvod6vxlzzim2iw3ly7jcr3@2uxiyzlfixhp>
In-Reply-To: <f4z2egmrcoh7kih2pyr3mq7fzuwtvod6vxlzzim2iw3ly7jcr3@2uxiyzlfixhp>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|CY5PR11MB6536:EE_
x-ms-office365-filtering-correlation-id: 0d7bb681-a937-4280-6dfb-08dcde039de5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?K3NaZnpCdE1KN0ZLOE40OVlVZXZkMHVaZGw1TkpoaTErZXBKbmpjOStOMk8r?=
 =?utf-8?B?WkhsT3RCcC9nOHZzRTBHeU94eUVsS2JSTDhrSEdPNE1XRFMxTXlDazVKN2FP?=
 =?utf-8?B?YVVlT1RyMDhSZ05Wc3FrNDY5akdFcUVzVGtsZUNBQ2J1Q2JRWmNaZnd5Y3Qv?=
 =?utf-8?B?ZVROQ3FycEZ5Y2MreXVDTkMwVWlHZktIWjF5bTZHeFdtRm8xalExYXBNeDRJ?=
 =?utf-8?B?L2lsNEVLUGFYdlh3TlVMSU52S1k3OERqTTFvdDBMWTRuaTNaU2VmakZxZytz?=
 =?utf-8?B?UHE1dlphOWQ5MjFCUGZnSlpMQWk0NTFRN1FKZDllMi9BZHNiUW1LTUFiTXZW?=
 =?utf-8?B?eFM5dExoTmNKT3FmNE9vQ0dkeVUyWlNHUEpoOUlIc2EyZHVwMlIvTDV0QXVx?=
 =?utf-8?B?aVJKZHc0blkzL0lxU1ZZZEU0bjdMOEpiTHNnRGxPZjFUeGpWTnlhb0hZVWtz?=
 =?utf-8?B?MG9UQ3ovTXNyQkorY0ZrT0dJMUtIZ3VXME1JMFhrenhzUXYvNjNVK3BMY0dH?=
 =?utf-8?B?bHF6RzlwWGkrbHgrQm1lK1hSaXA0TWRmN2V4MTJYbTM2eFZDRXR5QlpSYmZC?=
 =?utf-8?B?Umd5R1V6T2dNR3p1d2dmRk10ZHJQQXVHY21qY040bWthM3pUWkVnY2dOZmpC?=
 =?utf-8?B?ajRHMnhITUFMaUwzdTRZSThwaGJRTlpGeUNLWXFqUlZmL1F6LzBjQXNuMG5I?=
 =?utf-8?B?a3VRS3RoWGJzcWtmdVlWallqOHhWRTZpeVYxS0JpUTBBYS9YNEdwZUVLWWtx?=
 =?utf-8?B?dm1ZNC9EMVNweVp0Q1Flc0lNT21ySUdyRmF3djNOc2MvMlBjUHpRMmNucFlK?=
 =?utf-8?B?bUdNbUZjblZlWlJ3N0ZLL0pFb3R5MjB1WU1lTmFSRlc0Nld3dWpYTXdGQ0E5?=
 =?utf-8?B?QU1KMkxuNmUwSXp1U2xwM0ZEbGhKVW9zTHBPR1A4S3dRVWkwd1ZqRTBaK2ZI?=
 =?utf-8?B?d3VDYjBjUFNVWlNrVXQwcTRqL2l6ditJRmx1WmcvY2hvVUhzbzhRbC9xam5r?=
 =?utf-8?B?VjFjUjAwUUpiL3V3aGtRM1M4Y1JDSFVpMWQ1c2xaeENVb1FveGVBaENNS09H?=
 =?utf-8?B?ekRWNFF0M2Nid1ZlUlRXQXUxUFpqeFhGNEhoRlB1WHBBSXFWSmNUSFVBRXVR?=
 =?utf-8?B?OGRPcFB6K3QwaTloQzdUU3Zvb0xzR3BQT05mazlNaHZoeWM5M3gwa0E3N09R?=
 =?utf-8?B?UXZOeUVNNFRsUmVJUWRmalg3QmpoVjdhUlRxZk03a1k3YlNZU29aM3dhcmR0?=
 =?utf-8?B?ZGovZDlLWFRBWnoyRHhiK2tESkxNak1BWmtreTREaW1HVGxhcmlFK3AzWWxY?=
 =?utf-8?B?NlhXVzM3dlEvMTg5b3NTMFptbzFaUm5hSTlsdFJDT3k1R3V3QzA5cGo0aFhM?=
 =?utf-8?B?VmdlMEs2eGwzelhSVmkwbkUvUDg3S1dwZW1CL1cvcERXWkJCVHBHbFpwbEpX?=
 =?utf-8?B?WEFQT1Q1L2g5Q0kvc0JLcXNjc2Q0dm8zYUFBZUV6NW81SEJLWWpWWlRYNkpE?=
 =?utf-8?B?TlFvUTIzSlViT3ZoelVOekkzWWtqMXJ4MmZLUlhjTkdibzFQV3pTblRocEFx?=
 =?utf-8?B?MDFpWUhoRTlublhOSzFDb2pmR3pLTUs0aGc3MXJCUUU4SW9KNm11Ylo5RVNm?=
 =?utf-8?B?WnFvNUlteFlHU1NWdFJyci9GU1laZ3dnaXlhUnNJYnRyL3c2a0dDNlRsOThX?=
 =?utf-8?B?ZnM0ckx4M3d4dkIrU1RnSXBPck9OMjhwNGlRY0xkVzBJY1ZKTVFDYVBnPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmJmdHRZTTByL2xlc2FSbDNSRXpGYVIrT0Q0eXBwM1R3VG5Pa0hFZ3lxNGpJ?=
 =?utf-8?B?SE1aMlkxSUowZWEyT0JLYk9Oa2JOd1Y0Qld2WXJlam1WQXNSd3F0cmZYWGJD?=
 =?utf-8?B?aDJpN2lTKzNpeGdDQUJ4RlQrQ3R1dlhBWnZZUG1VVzN2TUozaWlPMVJyN3hi?=
 =?utf-8?B?M25RZUcyZXp6Rlp1RG4wQUhmK1o2YlNWQjZHV1dsQm54SXd4Y0JWR1YvbVJ3?=
 =?utf-8?B?Wnl6dmpiYlNiZEJNOEZWekpNNGZDUzdQRUhUM0M2SjhGNi9ydGRXaEFSWGVw?=
 =?utf-8?B?UWgrR0ZFOTRzTW9QV2hrcklsTkl4NDZIY3J1Y0lMNjBXUEZteEFJc2IyNDVw?=
 =?utf-8?B?VTkvME85L2cycXNVM3VVdmxlNlZ3WEVybnVuVDlhYldYaGdydUhSNXJiQ0pT?=
 =?utf-8?B?c3VFRHlwRlVFL3NwbytuUEZnUW1RQkxvaksyZVZzSHZTL3ZwSUFKOHlrUUt2?=
 =?utf-8?B?d2MrbWtOWVRUMWthcmo3cC9EcGFqb1BxUWV5SG1vTFMxajIyNGJLTFYxdFlu?=
 =?utf-8?B?Nk9uV2E2TkJ1MjFuQWpLUm1vMDJJM0hNTXdVRFI5Y0UvQ1g3dGF2VEV2dTZz?=
 =?utf-8?B?ZjZyaXRxRzFoVVZ4MVFNcDhEaDh3a1JQSzFTUzNCOUFOb2pIUGVja2FycW9H?=
 =?utf-8?B?TE1oRWh3Qlg4bUlqNHRWdjZDT1gvdVc3aE5uYlVrNm9CclY0eW94c2NnOW5B?=
 =?utf-8?B?ekw5dHFMK05xNTA5VjExdVprUUtOekVURnMxNXUxdVdBSWxERkxjR0hyZDVZ?=
 =?utf-8?B?YzZ5N3BjeCs5WW1VeU1ZdU11MDlJT3hjQVNFalRyZXZYVWZFbzh1SXhwMWoz?=
 =?utf-8?B?bDFJQUVESWFJQmdLNll6MFl6eGdCa0FJTC9tOThkdDIxVHN5Sk1PR3Mvc1p2?=
 =?utf-8?B?dWFEUDF2NjVaeWNUc3RCOGdkN0sxWjNnRzQ0c3JQbEU3czltVXpVa1l1U3h1?=
 =?utf-8?B?bzE4NVpKMW1hLy9DN2tNNDVoR0twdVNOUWNuS0tlRWpRdDhOVGVuSzVZQVFM?=
 =?utf-8?B?NDJCQmdySkgxK0VBaVJoSnl2WlZqWEdDNTJFb2NwcHVybldOdU9nbzAxWitS?=
 =?utf-8?B?RE1LVzV5dERxRENOTmpVWUlodWdJeEJ3bXF2Y2hiYUJTMlUxWnprVDVkd0lh?=
 =?utf-8?B?N1VsbzFENnd0aW5iTlVxanF0cHZ2K3FsOG92SVV0akM0UTdrMjNXVkRqRXpv?=
 =?utf-8?B?UFhLVG9FYlhPazdyZEdueXNSdlFmRWZ2T0tmUDdqcHBxTjJyZGxVVGhJODlv?=
 =?utf-8?B?UE1YYncwMmdQWWNSc0VEd3lOQVpuVnp6OGdQT0dhQlVjWk5aT1dqTXVua1RH?=
 =?utf-8?B?ZFo0S2dybzQyRTJSYy9WMXJ0VE5mV2hROFlza0FnUmovZ1I3bDhDZXl2UFI0?=
 =?utf-8?B?cWJhYkdsdS82eGVZM1k0Q3hmUHNoWWVEc2pvLzRwVUZWSVdKTlV0ZDRWVlFn?=
 =?utf-8?B?L1pLWGxXVCtBbVJLc0tkQ3VPSEN4K2xQSmsycktOdXE1WjIvSXkybGdLTkM4?=
 =?utf-8?B?RXdWeUp3OS9BQ0lpN0d6Q256V0pRbEVtMVJqbUdZRndlbWxlTjd3UERkM1Nq?=
 =?utf-8?B?MHJtbUNIdzlQdHNUenRPRmFvdURYODBSc3dwTU5ZejI0d1lINHVFK1NpMEJ4?=
 =?utf-8?B?aFhhbE9YR21VdnVRU2JzSGttbTRBNm50UlJVQ3hPdjNJdFlaQkZUM01qNVdm?=
 =?utf-8?B?bk0xR2FBZG5IbVlWL1pDMUVnZG40S0ZJc1ZFNWt1Q3JCNkFuM2taUGQzb0hx?=
 =?utf-8?B?NjRwNzZTcXE5QVZtbGdTTXlQdmJLV2VGeUMxWEJUTDlGalBISjFVYzRYSmpL?=
 =?utf-8?B?dHpFN3ZkdEFFdGwvTVlWQUpkOGd3MUNNL2JLQmdZaGI2Y09Ia3c4WTc5T1Ir?=
 =?utf-8?B?V200MERhbklFOWtKMUp1ajJLcUxnTU03VW5aV1ZsbStzSnhJVU9taFpxUThQ?=
 =?utf-8?B?K3c3V0o2RWxqbGRLcUFHcURUZThvUFIweTlOdTQ3ZXdZUHBpZkF5SE9DWDla?=
 =?utf-8?B?YVdaQVJXQmVVSlJiVFp1NnlacDhzYlFmQzF4S3M2MzU1WTd1QmVwdU43bWdu?=
 =?utf-8?B?QVQzSW9vQlpOdmpmdFo4WXBLR3BtOVhyRXFhcmhWUkpYdisvdnU1Qi9PZHFO?=
 =?utf-8?Q?hra6ep+sjKCiQcuY86tAf6QyO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A60915D7A982A54EAF1793DA74AFA37E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7bb681-a937-4280-6dfb-08dcde039de5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 08:17:09.4899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a183gIBaTzZtQOlmSmAtL4MAXdcNXMhYXidW41HCHGkXpt5AQaulAxsnWi3TBMng1awdLGEk0vkjClQXMFcxUENI2oLEbkfbf72QbXGfsbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6536
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

T24gMjMvMDkvMjQgMTE6MzcgYW0sIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gTW9uLCBTZXAgMjMsIDIwMjQgYXQg
MDU6NTA6MjJBTSBHTVQsIE1hbmlrYW5kYW4uTUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gT24g
MjAvMDkvMjQgOToxMyBwbSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4+PiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IE9uIFRodSwgU2VwIDE5LCAyMDI0IGF0
IDAyOjQ1OjQ4UE0gR01ULCBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiB3cm90ZToNCj4+Pj4gQWRk
IHN1cHBvcnQgZm9yIE1pY3JvY2hpcCBBQzY5VDg4QSA1IGluY2ggVEZUIExDRCA4MDB4NDgwDQo+
Pj4+IERpc3BsYXkgbW9kdWxlIHdpdGggTFZEUyBpbnRlcmZhY2UuVGhlIHBhbmVsIHVzZXMgdGhl
IFNpdHJvbml4DQo+Pj4+IFNUNzI2MiA4MDB4NDgwIERpc3BsYXkgZHJpdmVyDQo+Pj4NCj4+PiBB
QzY5VDg4QSBzZWVtcyB0byBiZSBhIG1vZHVsZSBuYW1lLCByYXRoZXIgdGhhbiBhIHBhbmVsIG5h
bWUuIFdoYXQgaXMNCj4+PiB0aGUgYWN0dWFsIHBhbmVsIG5hbWUgcHJlc2VudCBvbiB0aGlzIG1v
ZHVsZT8NCj4+IEJvdGggbmFtZXMsICJNaWNyb2NoaXAgQUM2OVQ4OEEiIGFuZCAiTVBVMzItTFZE
Uy1ESVNQTEFZLVdWR0EiIGFyZQ0KPj4gcHJlc2VudCBvbiB0aGUgZGlzcGxheSBtb2R1bGUNCj4g
DQo+IFdoaWNoIHBhbmVsIHdhcyB1c2VkIGZvciB0aGUgbW9kdWxlPyBJIGRvbid0IHRoaW5rIHRo
YXQgTWljcm9jaGlwDQo+IHByb2R1Y2VzIExWRFMgcGFuZWxzLg0KSXRzIGEgbmV3IExWRFMgZGlz
cGxheSBmcm9tIE1pY3JvY2hpcCB0aGF0IHVzZXMgU2l0cm9uaXggU1Q3MjYyIFRGVCBMQ0QgDQpk
cml2ZXINCg0KaHR0cHM6Ly93d3cuY3J5c3RhbGZvbnR6LmNvbS9jb250cm9sbGVycy9kYXRhc2hl
ZXQtdmlld2VyLnBocD9pZD00ODYNCj4gDQo+Pj4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTog
TWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBEaGFybWEgQmFsYXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hp
cC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBjaGFuZ2VzIGluIHYyOg0KPj4+PiAtIHJlcGxhY2UgbWlj
cm9jaGlwLGFjNjl0ODhhLWx2ZHMtcGFuZWwgd2l0aA0KPj4+PiBtaWNyb2NoaXAsYWM2OXQ4OGEN
Cj4+Pj4gLS0tDQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8
IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pg0KPj4+IC0tDQo+Pj4gV2l0aCBiZXN0IHdpc2hl
cw0KPj4+IERtaXRyeQ0KPj4NCj4+IC0tDQo+PiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+PiBNYW5p
a2FuZGFuIE0uDQo+Pg0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg0K
LS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
