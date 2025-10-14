Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62294BDB59A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 23:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B0710E23C;
	Tue, 14 Oct 2025 21:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AZ4Xx3hC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A2810E23C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 21:02:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVasghkdRiwLc+EBvsOXDVH0PSh0RoAdVaZ7cglrsQUCk+GrmYz5bCW+9RfLRqoPpKZNYXkgccuvPfpN7HEC8nx8UKdnKO1/qrHI8wdaUUQ29BUUrTFcm0N1lfhOthzAXVXkkluTGI36tRRmlIku+FSmkZFWgtENir6BUBOfQKBU62/zbn3qeJlhECBI6k3PosjsXcojnmm4fB+Wnp2Ez4rHKfBUKVijOWUnZtweyO/RWG6oWRkXxQAzMItYTnEP8bY2gd6eH6wI9jh7WCgxsHxEl8Yb8GlSNTY/GWdPklUqadDRdC28nnjCnuouKsEEzAJXjhVZdBbp7dUmv8+lag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbPn9SNt4bcPVPLoSToMIK189vR3ddTUdFeTxiaGXsY=;
 b=B+j7WeO4OTb0pY2JoE+GegMgEYYqHr2NbnjDyNbOSlnkn9u4nPx2+zuFSpqe9NDbnH0vfD07YSRO3UEi5c197/riXmEb8sDUtuWV8L1+aFEesplTNiWsiLTLWVfP/gx0ECxjWFHSm/zFE7IxcWD48dxwk+ZpTlHfx1+u660V2vRA4CGEGaBuVya61TZWYAawEvXwrg/cLJarYPuQPk/xv01UGUN7Ry8NhbEGOLhvM5BMgiYaB36ltN20KGTSSTk4IhRAg8LC23T/4zaSUqhsnFTboWBfRxPzvyjc5FluPm8lUm3GHaAwCRI5Mfjbr4ZODtSbZZNQxDyca+b0TnNxVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbPn9SNt4bcPVPLoSToMIK189vR3ddTUdFeTxiaGXsY=;
 b=AZ4Xx3hCXbeWptJF1xllxSPrb+Qdk0kXkD9SJADxAzG4dDBGMZ7dcWOHS/u7FIsLAAnXpD/OBVbk6qvype657+Wx3B5YfZzZHwTcUBnEQuOmiZesvnRdWITVGAU0mCN1FmkpFhvFb2PILyF7TnZMly3DdIzv4klvwawth0VkZio=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 21:02:34 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 21:02:33 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Thread-Topic: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Thread-Index: AQHb53L5eS0Zbjv6x0+FvyDSoajsQrQXUQ+AgAQK6QCAAAUPgIAAbGUAgACob4CAplI4cIAABFbg
Date: Tue, 14 Oct 2025 21:02:33 +0000
Message-ID: <MW4PR12MB71656AAACAD8F3F2D3CADD1DE6EBA@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630082123.GA23516@pendragon.ideasonboard.com>
 <21227b4e-d345-4e12-bbfb-b2ab5330d0d2@topic.nl>
 <MW4PR12MB7165259AD14396697AE2A0D1E641A@MW4PR12MB7165.namprd12.prod.outlook.com>
 <MW4PR12MB7165061E0765E5B0C9C0E6DFE6EBA@MW4PR12MB7165.namprd12.prod.outlook.com>
In-Reply-To: <MW4PR12MB7165061E0765E5B0C9C0E6DFE6EBA@MW4PR12MB7165.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-01T00:52:11.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|DM4PR12MB8497:EE_
x-ms-office365-filtering-correlation-id: 7891ca92-e5c4-4d7e-bd55-08de0b64fedd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OW1iOVRrSUdMWU1DTlJsbVZkUXJqLzJ4Q0pLYVdTb2MweVFNN1pHeG45TlNv?=
 =?utf-8?B?c1JPajJLMGdjV0N4SkVzVHRpNDUrRUcwM1JpMDh6QjNKVGhXdUlFSFB2eUds?=
 =?utf-8?B?MnpRUGZ1dWYweVdlZ3F3MldhK0NrdTNpVG9ydFpwQXJvNEVBVGRPbjZoc2Np?=
 =?utf-8?B?dk5ZME95V1FuQkhidUh4Wko0Z2JlK2RkKzc2dlJURGY5NHZaYzlXRm5KZVNw?=
 =?utf-8?B?TlozaXVqaStMZEhLYlp0Y2pxbUxDT2JxWEdUdi9YZlBKWm9EcUZvT2pDRDkr?=
 =?utf-8?B?bHgySkQwSVhnTXM1V0ZtVEZKMndrWC83TzQ2bm9ZNm53NGZhWXk2Y1Q0S0NT?=
 =?utf-8?B?b0Y4bTd1RGlwRkhRaFJ4T1N6cndIK3ZlTFdMeXFXK011a0J3WjFxNTVLOFQw?=
 =?utf-8?B?aVZIdHgrNFpacDRXSVRhOGRFamp4d05TcUZ3OWZUUVUxdUx6WjlUWGNRTDR2?=
 =?utf-8?B?ZHZSWGZPYnJFT1VGbTdjMHlSL0luN003R2szSlppandSeVJzTE9iZE9wTDFT?=
 =?utf-8?B?U0NrWTd2bjg3REU3L3MyRUpEZHJyS3BETGd1dDVKNHVFbER3NlBmZnhhdllC?=
 =?utf-8?B?d1VCRUhmYi9RRXdzRmVpaTFyeDd5aHNPWXM4K1J5eEdvWTQwVUpqQ2NRRU04?=
 =?utf-8?B?U2NKRlBjU1E2Mi9iTGR5VzBDbHY2N2R5bGpyakZNeWozallyTUt3cnNKa3o0?=
 =?utf-8?B?bVl3Y3MxQ2dRNXYxR3VoWDFZQXZyNWgzemFFMnpQQXJHQmEzUHoyTU9mb3JH?=
 =?utf-8?B?cVFFL3ZraUdKdGY5dUg0Q2hkNEJ6VDFhaWpWSlNxYWYvMm1UN3JBU05QZ3Vk?=
 =?utf-8?B?R1lTeE5LRWQxbVRWN0lZa3poN1ZPenI5U3hSR2t2QVUvdk5xeENLM2ZmWFYw?=
 =?utf-8?B?ZEl1SUltUFpTOTI4ZitlcStHcVdiM1Y0b0M1c3lNcnJTQm1hNmxuZ1dIRFhI?=
 =?utf-8?B?Y3FIUHRCdkVGRWg4Y2FvVm5HWUVLMmxTNFBVLzArS3JUalFsVVkzcVdkUUxY?=
 =?utf-8?B?WmJsc2Q4eFRqTy83NFZMSm53TjFPdXFha1MxRVgwbXZSVncxTVZLN1owTzI2?=
 =?utf-8?B?N0JSZjdpendrbnBFb2NKbm9xVlZ3ZXJwMFlyckhveERSby9ObnJkcDBRVDg0?=
 =?utf-8?B?bWIveXI3N2t5QTRvbDR0M3FnMmZyWVdYMjM3MXEvSit2cFd6ZXI5TmVJZUQ1?=
 =?utf-8?B?T3JQeDI2N2ladzVaQW5XbmRBTytOWDBEby9nNjBYSVhUVU1JdTNGa3U2RWJI?=
 =?utf-8?B?KzhXMUpJQUJtRG9kM2hvem9ySUxiSUlRMDBWbkFrMG9VQTF1WXZHNFJOaW0y?=
 =?utf-8?B?UVlxK2FWZXdSRWdFdG1JZmdwdWlaa2ZHVzd1dWhVaDhJWEpkQTc1Z2l4N0pl?=
 =?utf-8?B?V3k5eHRQMUVDQU5IdDEzYzV4bUlPejBxbCtxcHhzUEtMVm5xanlSdmtBZUtS?=
 =?utf-8?B?MThKNUxxZ0FnOVFhN3ZqN0k1aE40ekZWMmkyUlVKaFpSalcvWjNTb3poYWVx?=
 =?utf-8?B?LzFzNXVLaUxINHhlV3VxcklSRTVidXgrWm10MjhOM3BBT1loayt0UFc4eHEv?=
 =?utf-8?B?M1FxQUJ4UVZ5RGNOWEdqdHRqUGMwQU1renlXSTYzRHByajZoZGhmb1RBd1hO?=
 =?utf-8?B?ZEZFamRrZ28xejN6U014aGlvM0RiYWJOSTByNEduSEwzaThhaW1oaVFYTG5y?=
 =?utf-8?B?Z2tsMklVK3YrNUJCOG5EenlKcU4rRGttamFzZkJYNDJOT1BzYWxuR3ZySlVs?=
 =?utf-8?B?RDc0Y013QlFvM2lrcU5BSlJ0c1BIcFRnL1p6VTlBTms5VWRZQ2Jzc0Rvemov?=
 =?utf-8?B?VXYxK3FhMjZwWFlnK0N5aGkwdjI4bHpqa1hTT2hNYlBjRDV2c1lsQkpiTXNi?=
 =?utf-8?B?WGErODcvL0Y0dzlaNFBBak5mWlphU0s1TjkydHRMV0QyVEN6ZkhlV1V3T2ZH?=
 =?utf-8?B?T01HakwwcUZDdDFzMjc5Si90UVpPT2xtOHVxYy9qbFEvbmtwcDRRRGYyb0VU?=
 =?utf-8?B?YjlDV0psWjlBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDNEQ0tEOE9iZEpqS3pVdWxrRXI3eVlyaWtXdmYwbC94ZmFSSU03UCtsUmtX?=
 =?utf-8?B?UWdHV1dJMkNtTmdYN28vdGVjenBtandQQTY5QmJCYmQrb3dKMGpxVVUvaXo1?=
 =?utf-8?B?TUtzTFI0U2VsRlRiSU1YeEJtN0RRMkpiaEg4RnJKd1BiTE14STU0TXA5cU93?=
 =?utf-8?B?T01GNzMzem9LOFFCMVk0ekhheU5lamxkS2Y2Tm5uaVpiVnRaUGIvbURUdkdJ?=
 =?utf-8?B?bkN3L0NnQ0w2L2pseW5YQ010cU82RjBKUkpvQ25jUDk0VWpobDZzVURBdng1?=
 =?utf-8?B?cElISFIvajBFUUE0bjBpcmFKcGFVcXlja3M0L1hMdzZBTXgvdnpRT3k5RWF0?=
 =?utf-8?B?aW1mU3ErRUdGVVJ2c2ZFZFQwdGZ3QUNPSXZaRmNQZHRTK0x6YkVlNitDdXRM?=
 =?utf-8?B?RHRJVlVHdEw0aVgvRU93WHBQdFl2TjRHSncxenVaWXgxdG5GT2kyQmw0MFM1?=
 =?utf-8?B?VFNUd0dFbHJhVUtmSlZjYVowREk1SExnbnNWZTA3TTRUaTQyVzFMdW5YSlNh?=
 =?utf-8?B?OTJSOEJBUEJnYk1xWXRhOHlsQS8zdnh2UmNIN2RGOTJraDQycGNHUzhJWkRH?=
 =?utf-8?B?ZzJCTFdSemJUOUZmdUdOL015NGpaSHJGcjNubmRKb3pvTGhhQ3o2RExVcTNJ?=
 =?utf-8?B?b3VEOWZTUGZRMVNsVkFEemR5anA3aEZWcGkwOTVLTHNNeUNhUDRpRlM1eUlP?=
 =?utf-8?B?NXRFSDJaTWtScmw3dWdJc085ekU1dG5rZmQycDJ0bVVEVlpzcEFHbUV5N203?=
 =?utf-8?B?N2Z1ZmpNbHBjbUk4bFBkdkZvWmFsOGJ2aHI4WWY2RGZBRGQySWNTSDk2WDVt?=
 =?utf-8?B?RXFUS2FwUExlU2Y1QS9rNk1RWE9JMXEwdDEyYk9rNmZINWNRQUhvVS84ZENR?=
 =?utf-8?B?d2xEZ2hPaGFnOGZhYWNoSUFHZWJQU1lLZGJDMnRlUmhPekVvS1RVMWxTYktV?=
 =?utf-8?B?bmZ5djNhNE95ZiszR2NSMmk1OUVER2RBUWdOd21TVmx2d2IzbTBZMk1aUS9C?=
 =?utf-8?B?OHhWNEoxQ09sV0VkQXhrdHBLUnBCWnpnZWxwL3JPanNZcE5odDdMSU85ZzVh?=
 =?utf-8?B?bE9EK1RVaGRqQ01nUU1IQVRGTEIzajFpV0RqTlQrS29jRFIva25oM21ueFB5?=
 =?utf-8?B?dUx6Y0hVVlF2d1lkR1FRNFFPSzFlK2ZlZTlwWEIyanRsRk4vLytmUTJhSlc3?=
 =?utf-8?B?dy84S0VCRUNJazBvNlBLVmFxK05uNmZHS1RwK29wV0I2MUJqUmdQamR0NXdp?=
 =?utf-8?B?VDdRZDFKenVXMElFUGVoTVhKUHkyZnJvekVhWmFGcWgrMmsyWHhOR2lPVjZQ?=
 =?utf-8?B?bncxeXBaMnRtaEZqRjBSNTFQdnNIRG1xRUptdjg1VFFaZVJaWkNoTkxGWEF3?=
 =?utf-8?B?Vm5kS3J6MitlNVhQWnZmSURnMTVpYWlrOUtvS2YrZ2J1NnhKZGlsZFBBTWVp?=
 =?utf-8?B?ekJzNlJSRUtYTFpuUkcyQUZXdHVZaXh0QTBDUG5VNUJJcy9yT2hHT2s1ejdq?=
 =?utf-8?B?LzRoQTlkbDIwTDRHUVVFQWZ3dXkvYzRGWkZNdlhmaTNKamdBUW56QTErMG44?=
 =?utf-8?B?Yk10R3QwTUp0Yk40aHphcEVGbE1aWEpoQXBTMWlkY2Fsb2FTZERTSVZQS3Aw?=
 =?utf-8?B?ZEJ0VC9mck8rY3p0dzVxeTR6Vng2d0c3TzlJZjNOQVlNRk5KWTg4SjlmM1Vt?=
 =?utf-8?B?cjFMMzJqUXFVbFBwb2VQU2hGMkhMcEs3eE1nbHNqbVVqNExiSnJ4UjVKQXpX?=
 =?utf-8?B?c2x5SkNxQnZERm9yNGhQTWJWR3ZUSElCcGxBYkVVclBFSHdNbDBadklQZmJU?=
 =?utf-8?B?aVhkRkpFbjk4U3dOODM4MWVCNU5xbktCVmZLamxBaFBlSXJ3SWd3ZHNDelFa?=
 =?utf-8?B?VElKRDB5WnZ5TW41ZGJCVkNTSDY0NlVyYWFOVERzMThHUzJiYitVcUZzZS9j?=
 =?utf-8?B?SW5pV3RPTGwrOTk4dWpaa0Y4WjBBci8wTmd6MzdnSjY5eDdKSGlLUkVJcVhB?=
 =?utf-8?B?MU95TE9JZEovUVNCSUY5R1hGQWwzSms5aWJkUDNDZ0dqNGhRNFVBcEJUZmw5?=
 =?utf-8?B?ZTI5UWd2QkNPWk9HNllYU2V5VG9WUCtjM3Y2NUhodnRzb0M4RURFR1lNdjF4?=
 =?utf-8?Q?H8sE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7891ca92-e5c4-4d7e-bd55-08de0b64fedd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 21:02:33.3134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sIvJWVtkg54nXp0hrpJz2YO2VsC2BauLYnm5umMQCdLfP8UeiI20clMD3X9rOHvjfxTWY4wLm7cBsL7uSV8BYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLbHltZW5rbywgQW5hdG9s
aXkNCj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxNCwgMjAyNSAxOjU3IFBNDQo+IFRvOiBNaWtl
IExvb2lqbWFucyA8bWlrZS5sb29pam1hbnNAdG9waWMubmw+OyBMYXVyZW50IFBpbmNoYXJ0DQo+
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgTWFh
cnRlbg0KPiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1h
eGltZSBSaXBhcmQNCj4gPG1yaXBhcmRAa2VybmVsLm9yZz47IFNpbWVrLCBNaWNoYWwgPG1pY2hh
bC5zaW1la0BhbWQuY29tPjsgU2ltb25hDQo+IFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsgVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ow0KPiBUb21pIFZhbGtlaW5lbiA8
dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT47IGxpbnV4LWFybS0NCj4ga2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVj
dDogUkU6IFtQQVRDSF0gZHJtOiB4bG54OiB6eW5xbXBfZHA6IFN1cHBvcnQNCj4gRFJNX0ZPUk1B
VF9YUkdCODg4OA0KPg0KPiBIaSBBbGwsDQo+DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiBGcm9tOiBLbHltZW5rbywgQW5hdG9saXkNCj4gPiBTZW50OiBNb25kYXksIEp1bmUg
MzAsIDIwMjUgNjowMyBQTQ0KPiA+IFRvOiBNaWtlIExvb2lqbWFucyA8bWlrZS5sb29pam1hbnNA
dG9waWMubmw+OyBMYXVyZW50IFBpbmNoYXJ0DQo+ID4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4NCj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGF2
aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47DQo+IE1hYXJ0ZW4NCj4gPiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQNCj4gPiA8
bXJpcGFyZEBrZXJuZWwub3JnPjsgU2ltZWssIE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+
OyBTaW1vbmENCj4gPiBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD47IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPjsNCj4gPiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWlu
ZW5AaWRlYXNvbmJvYXJkLmNvbT47IGxpbnV4LWFybS0NCj4gPiBrZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiA+IFN1YmplY3Q6IFJFOiBb
UEFUQ0hdIGRybTogeGxueDogenlucW1wX2RwOiBTdXBwb3J0DQo+ID4gRFJNX0ZPUk1BVF9YUkdC
ODg4OA0KPiA+DQo+ID4gSGkgTWlrZSwNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gTWlrZQ0KPiA+ID4gTG9vaWptYW5zDQo+ID4g
PiBTZW50OiBNb25kYXksIEp1bmUgMzAsIDIwMjUgNzo0OSBBTQ0KPiA+ID4gVG86IExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPjsNCj4gPiBNYWFydGVuDQo+ID4gPiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQNCj4gPiA+IDxtcmlwYXJkQGtlcm5lbC5v
cmc+OyBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IFNpbW9uYQ0KPiA+ID4g
VmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBUaG9tYXMgWmltbWVybWFubg0KPiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT47DQo+ID4gPiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNv
bmJvYXJkLmNvbT47IGxpbnV4LWFybS0NCj4gPiA+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENI
XSBkcm06IHhsbng6IHp5bnFtcF9kcDogU3VwcG9ydA0KPiA+ID4gRFJNX0ZPUk1BVF9YUkdCODg4
OA0KPiA+ID4NCj4gPiA+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4g
RXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyDQo+ID4gY2F1dGlvbg0KPiA+ID4gd2hlbiBvcGVu
aW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4gPiA+DQo+
ID4gPg0KPiA+ID4gT24gMzAtMDYtMjAyNSAxMDoyMSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToN
Cj4gPiA+ID4gT24gTW9uLCBKdW4gMzAsIDIwMjUgYXQgMTA6MDM6MTZBTSArMDIwMCwgTWlrZSBM
b29pam1hbnMgd3JvdGU6DQo+ID4gPiA+PiBPbiAyNy0wNi0yMDI1IDIwOjE5LCBMYXVyZW50IFBp
bmNoYXJ0IHdyb3RlOg0KPiA+ID4gPj4+IE9uIEZyaSwgSnVuIDI3LCAyMDI1IGF0IDA0OjUwOjQ2
UE0gKzAyMDAsIE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiA+ID4gPj4+PiBYUkdCODg4OCBpcyB0
aGUgZGVmYXVsdCBtb2RlIHRoYXQgWG9yZyB3aWxsIHdhbnQgdG8gdXNlLiBBZGQgc3VwcG9ydA0K
PiA+ID4gPj4+PiBmb3IgdGhpcyB0byB0aGUgWnlucW1wIERpc3BsYXlQb3J0IGRyaXZlciwgc28g
dGhhdCBhcHBsaWNhdGlvbnMgY2FuIHVzZQ0KPiA+ID4gPj4+PiAzMi1iaXQgZnJhbWVidWZmZXJz
LiBUaGlzIHNvbHZlcyB0aGF0IHRoZSBYIHNlcnZlciB3b3VsZCBmYWlsIHRvIHN0YXJ0DQo+ID4g
PiA+Pj4+IHVubGVzcyBvbmUgcHJvdmlkZWQgYW4geG9yZy5jb25mIHRoYXQgc2V0cyBEZWZhdWx0
RGVwdGggdG8gMTYuDQo+ID4gPiA+Pj4+DQo+ID4gPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pa2Ug
TG9vaWptYW5zIDxtaWtlLmxvb2lqbWFuc0B0b3BpYy5ubD4NCj4gPiA+ID4+Pj4gLS0tDQo+ID4g
PiA+Pj4+DQo+ID4gPiA+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMg
fCA1ICsrKysrDQo+ID4gPiA+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykN
Cj4gPiA+ID4+Pj4NCj4gPiA+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94bG54
L3p5bnFtcF9kaXNwLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3Au
Yw0KPiA+ID4gPj4+PiBpbmRleCA4MGQxZTQ5OWExOGQuLjUwMTQyODQzNzAwMCAxMDA2NDQNCj4g
PiA+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYw0KPiA+ID4g
Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jDQo+ID4gPiA+Pj4+
IEBAIC0zMTIsNiArMzEyLDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgenlucW1wX2Rpc3BfZm9y
bWF0DQo+ID4gPiBhdmJ1Zl9nZnhfZm10c1tdID0gew0KPiA+ID4gPj4+PiAgICAgICAgICAgICAg
ICAgICAgLmJ1Zl9mbXQgICAgICAgID0NCj4gPiA+IFpZTlFNUF9ESVNQX0FWX0JVRl9GTVRfTkxf
R0ZYX1JHQkE4ODg4LA0KPiA+ID4gPj4+PiAgICAgICAgICAgICAgICAgICAgLnN3YXAgICAgICAg
ICAgID0gdHJ1ZSwNCj4gPiA+ID4+Pj4gICAgICAgICAgICAgICAgICAgIC5zZiAgICAgICAgICAg
ICA9IHNjYWxpbmdfZmFjdG9yc184ODgsDQo+ID4gPiA+Pj4+ICsgIH0sIHsNCj4gPiA+ID4+Pj4g
KyAgICAgICAgICAuZHJtX2ZtdCAgICAgICAgPSBEUk1fRk9STUFUX1hSR0I4ODg4LA0KPiA+ID4g
Pj4+PiArICAgICAgICAgIC5idWZfZm10ICAgICAgICA9DQo+ID4gPiBaWU5RTVBfRElTUF9BVl9C
VUZfRk1UX05MX0dGWF9SR0JBODg4OCwNCj4gPiA+ID4+Pj4gKyAgICAgICAgICAuc3dhcCAgICAg
ICAgICAgPSB0cnVlLA0KPiA+ID4gPj4+PiArICAgICAgICAgIC5zZiAgICAgICAgICAgICA9IHNj
YWxpbmdfZmFjdG9yc184ODgsDQo+ID4gPiA+Pj4gSSdtIGFmcmFpZCB0aGF0J3Mgbm90IGVub3Vn
aC4gVGhlcmUncyBhIGNydWNpYWwgZGlmZmVyZW5jZSBiZXR3ZWVuDQo+ID4gPiA+Pj4gRFJNX0ZP
Uk1BVF9BUkdCODg4OCAoYWxyZWFkeSBzdXBwb3J0ZWQgYnkgdGhpcyBkcml2ZXIpIGFuZA0KPiA+
ID4gPj4+IERSTV9GT1JNQVRfWFJHQjg4ODg6IGZvciB0aGUgbGF0dGVyLCB0aGUgJ1gnIGNvbXBv
bmVudCBtdXN0IGJlDQo+ID4gPiBpZ25vcmVkLg0KPiA+ID4gPj4+IFRoZSBncmFwaGljcyBsYXll
ciBpcyBibGVuZGVkIG9uIHRvcCBvZiB0aGUgdmlkZW8gbGF5ZXIsIGFuZCB0aGUgYmxlbmRlcg0K
PiA+ID4gPj4+IHVzZXMgYm90aCBhIGdsb2JhbCBhbHBoYSBwYXJhbWV0ZXIgYW5kIHRoZSBhbHBo
YSBjaGFubmVsIG9mIHRoZQ0KPiBncmFwaGljcw0KPiA+ID4gPj4+IGxheWVyIGZvciAzMi1iaXQg
UkdCIGZvcm1hdHMuIFRoaXMgd2lsbCBsZWFkIHRvIGluY29ycmVjdCBvcGVyYXRpb24gd2hlbg0K
PiA+ID4gPj4+IHRoZSAnWCcgY29tcG9uZW50IGlzIG5vdCBzZXQgdG8gZnVsbCBvcGFjaXR5Lg0K
PiA+ID4gPj4gSSBzcGVudCBhIGZldyBob3VycyBkaWdnaW5nIGluIHRoZSBzb3VyY2UgY29kZSBh
bmQgd2hhdCBJIGNvdWxkIGZpbmQgaW4NCj4gPiA+ID4+IHRoZSBUUk0gYW5kIHJlZ2lzdGVyIG1h
cHMsIGJ1dCB0aGVyZSdzIG5vdCBlbm91Z2ggaW5mb3JtYXRpb24gaW4gdGhlcmUNCj4gPiA+ID4+
IHRvIGV4cGxhaW4gaG93IHRoZSBibGVuZGVyIHdvcmtzLiBUaGUgb2J2aW91cyAiWFJHQiIgaW1w
bGVtZW50YXRpb24NCj4gPiA+ID4+IHdvdWxkIGJlIHRvIGp1c3QgZGlzYWJsZSB0aGUgYmxlbmRl
ci4NCj4gPiA+ID4gVGhhdCB3b24ndCB3b3JrIHdoZW4gdXNpbmcgZ2xvYmFsIGFscGhhIHVuZm9y
dHVuYXRlbHkgOi0oDQo+ID4gPiA+DQo+ID4gPiA+PiBXaGF0IEkgZ290IGZyb20gZXhwZXJpbWVu
dGluZyBzbyBmYXIgaXMgdGhhdCB0aGUgYWxwaGEgY29tcG9uZW50IGlzDQo+ID4gPiA+PiBpZ25v
cmVkIGFueXdheSB3aGlsZSB0aGUgdmlkZW8gcGF0aCBpc24ndCBhY3RpdmUuIFNvIGFzIGxvbmcg
YXMgb25lDQo+ID4gPiA+PiBpc24ndCB1c2luZyB0aGUgdmlkZW8gYmxlbmRpbmcgcGF0aCwgdGhl
IEFSR0IgYW5kIFhSR0IgbW9kZXMgYXJlDQo+ID4gPiBpZGVudGljYWwuDQo+ID4gPiA+IENvcnJl
Y3QsICppZiogZ2xvYmFsIGFscGhhIGlzIHNldCB0byBmdWxsIG9wYXF1ZSwgdGhlbiB5b3UgY2Fu
IGRpc2FibGUNCj4gPiA+ID4gdGhlIGJsZW5kZXIuIFRoYXQgY291bGQgY29uZnVzZSB1c2Vyc3Bh
Y2UgdGhvdWdoLCBlbmFibGluZyB0aGUgZ3JhcGhpY3MNCj4gPiA+ID4gcGxhbmUgd2l0aCBYUkdC
IHdvdWxkIHdvcmssIGFuZCB0aGVuIGVuYWJsaW5nIHRoZSB2aWRlbyBwbGFuZSB3aXRoDQo+ID4g
PiA+IGdsb2JhbCBhbHBoYSB3b3VsZCBmYWlsLg0KPiA+ID4gPg0KPiA+ID4gPj4gR3Vlc3MgSSds
bCBuZWVkIGFzc2lzdGFuY2UgZnJvbSBBTUQvWGlsaW54IHRvIGNvbXBsZXRlbHkgaW1wbGVtZW50
IHRoZQ0KPiA+ID4gPj4gWFJHQiBtb2Rlcy4NCj4gPiA+ID4gVGhlIGJsZW5kZXIgY2FuIGlnbm9y
ZSB0aGUgYWxwaGEgY2hhbm5lbCBvZiB0aGUgZ3JhcGhpY3MgcGxhbmUgZm9yDQo+ID4gPiA+IGZv
cm1hdHMgdGhhdCBoYXZlIG5vIGFscGhhIGNoYW5uZWwuIEl0IHdvdWxkIGJlIG5pY2UgaWYgdGhl
cmUgd2FzIGEgYml0DQo+ID4gPiA+IHRvIGZvcmNlIHRoYXQgYmVoYXZpb3VyIGZvciAzMi1iaXQg
UkdCIHRvbywgYnV0IEkgY291bGRuJ3QgZmluZCBhbnkgOi0oDQo+ID4gPiA+IEl0J3Mgd29ydGgg
YXNraW5nIHRob3VnaC4NCj4gPiA+DQo+ID4NCj4gPiBVbmZvcnR1bmF0ZWx5LCB0aGVyZSBhcmUg
bm8gc3VjaCBleHBsaWNpdCBmbGFnIG9uIHRoZSBIVyBzaWRlLiBBbHRob3VnaCwNCj4gPiBzb21l
IGJsZW5kZXIgbW9kZXMgbWF5IHR1cm4gb2ZmIHBlci1waXhlbCBhbHBoYSBhcyBhIHNpZGUgZWZm
ZWN0LiBMZXQgbWUNCj4gPiBjaGVjayBpZiBJIGNhbiBmaW5kIHNvbWUgdHJpY2sgdG8gbWFrZSBp
dCBoYXBwZW4uDQo+ID4NCj4NCj4gQWZ0ZXIgc29tZSBpbnZlc3RpZ2F0aW9ucyBJIG1heSBjb25m
aXJtIHRoYXQgdGhpcyBwYXRjaCB3b3JrcywgYW5kIGl0IGlzDQo+IHNhZmUgdG8gYWNjZXB0IGl0
LiBUaGUgWnlucU1QIERQIGJsZW5kZXIgaWdub3JlcyBwZXIgcGl4ZWwgYWxwaGEgaWYgdG9wDQo+
IHBsYW5lIGFscGhhIGlzIGVuYWJsZWQgKHdoaWNoIGlzIGFsd2F5cyB0aGUgY2FzZSBpbiB0aGUg
ZHJpdmVyKS4gU28sIEFSMjQNCj4gaXMgZWZmZWN0aXZlbHkgdHJlYXRlZCBhcyBYUjI0IGJ5IHRo
ZSBoYXJkd2FyZS4NCj4NCj4gPiA+IFllcywgbXkgcHJvYmxlbSBleGFjdGx5Lg0KPiA+ID4NCj4g
PiA+DQo+ID4gPiA+DQo+ID4gPiA+PiAoRm9yIG91ciBhcHBsaWNhdGlvbiwgdGhpcyBwYXRjaCBp
cyBzdWZmaWNpZW50IGFzIGl0IHNvbHZlcyB0aGUgaXNzdWVzDQo+ID4gPiA+PiBsaWtlIFgxMSBu
b3Qgc3RhcnRpbmcgdXAsIE9wZW5HTCBub3Qgd29ya2luZyBhbmQgaG9ycmVuZG91c2x5IHNsb3cN
Cj4gPiA+ID4+IHNjYWxpbmcgcGVyZm9ybWFuY2UpDQo+ID4gPiA+Pg0KPiA+ID4gPj4+PiAgICAg
ICAgICAgIH0sIHsNCj4gPiA+ID4+Pj4gICAgICAgICAgICAgICAgICAgIC5kcm1fZm10ICAgICAg
ICA9IERSTV9GT1JNQVRfUkdCQTg4ODgsDQo+ID4gPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAu
YnVmX2ZtdCAgICAgICAgPQ0KPiA+ID4gWllOUU1QX0RJU1BfQVZfQlVGX0ZNVF9OTF9HRlhfQUJH
Ujg4ODgsDQo+ID4gPg0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiBNaWtlIExvb2lqbWFucw0KPiA+
ID4gU3lzdGVtIEV4cGVydA0KPiA+ID4NCj4gPiA+IFRPUElDIEVtYmVkZGVkIFByb2R1Y3RzIEIu
Vi4NCj4gPiA+IE1hdGVyaWFhbHdlZyA0LCA1NjgxIFJKIEJlc3QNCj4gPiA+IFRoZSBOZXRoZXJs
YW5kcw0KPiA+ID4NCj4gPiA+IFQ6ICszMSAoMCkgNDk5IDMzIDY5IDY5DQo+ID4gPiBFOiBtaWtl
Lmxvb2lqbWFuc0B0b3BpYy5ubA0KPiA+ID4gVzogd3d3LnRvcGljLm5sDQo+ID4gPg0KPiA+ID4N
Cj4gPiAtLQ0KPiA+IFRoYW5rIHlvdSwNCj4gPiBBbmF0b2xpeQ0KPiA+DQo+DQo+IFRoYW5rIHlv
dSwNCj4gQW5hdG9saXkNCg0KQWxtb3N0IGZvcmdvdCwNCg0KVGVzdGVkLWJ5OiBBbmF0b2xpeSBL
bHltZW5rbyA8YW5hdG9saXkua2x5bWVua29AYW1kLmNvbT4NCg0KLSBBbmF0b2xpeQ0KDQo=
