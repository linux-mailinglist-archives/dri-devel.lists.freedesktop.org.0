Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C3A459A9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 10:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B0010E895;
	Wed, 26 Feb 2025 09:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fgs1w33m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C63110E88B;
 Wed, 26 Feb 2025 09:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJvRaTgOliZSPimtc9Lhrnev+nf7l2SpmRZXCsjxkQhGYNzcbgV6YTqObhsMGqehl/YAt+eYt8OGmBBrjQ55gimEFMSnXfzETLk11cRiouiNmSROjDAF3Fzw5A0XB4z04/kMtEUH9G8zQuk8Uk69vy4VSrHvhswhJBaCca/eeATzYkok+SFEcrp7MvG+/Hoa/mqrmUpoOtJvvpqp7N8MtozOMI+3WdyxCgGnXexi5wSmLaf/2tdn5M+s3R1RkoEeMi9ezPItYNULuQzb/OaNpuvis6nIHHogGvCZeEl3Y4M6DQrqUkDjmPVs5SreLpYFKHeDD032DjlRL9zhTfGJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWMUMiJZDGHSPOeSrPadcedROlj8Aa8gmiUOMO8kKdc=;
 b=XDlcnTM8E4wGlYZHolxdiRlBpF4oSO6AD/zC7++94EmycR2697WJtdmPTq8lMqwDc1CapyJI8n/ZAZBRyXYC6Q45aPIzF19pX9XtriOcvGuV7v9xRXYYZ6wb2RaKDzsvqFuK4KJw9Q0usbH2f2dgwZZqpLT+mia6NF/x6KP9vc1tghsZwkVzI3n3yUIstmWdzgO0iq1HxcHM8bbSlS4RSVeKWbrLPXKKorNpJ+kR4MalSXbNyVrORMhkuRKSn5/tHjYv1xrJwbPrjdwnJe6c9oMcRa2f5Pp9xrzxKs2yjzHv059aJ1cwW3e9jf/XT2FaVTm5NWDHWtFwwZM+d7WOJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWMUMiJZDGHSPOeSrPadcedROlj8Aa8gmiUOMO8kKdc=;
 b=fgs1w33mGbZnHSbWToqADQjzIWgW4M3YSP++gxAioaeZnH1VLDEeyesvZKkL5N14TWDLTRrMItQAc80lRWRaAT1flH3ThJI0MCgkuo3PQawz756nWKbuAoBc+skSJnDJIiHIH0eIEorlqVpDaVbiNfnpgl18AXe/j6qgWMGFbDY=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by IA1PR12MB8333.namprd12.prod.outlook.com (2603:10b6:208:3fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 09:12:34 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 09:12:34 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: Colin Ian King <colin.i.king@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH][next] drm/amdgpu: Fix spelling mistake "initiailize" ->
 "initialize" and grammar
Thread-Topic: [PATCH][next] drm/amdgpu: Fix spelling mistake "initiailize" ->
 "initialize" and grammar
Thread-Index: AQHbiCyQ/BEG+Nl3W0asNGAixAM17bNZTMAw
Date: Wed, 26 Feb 2025 09:12:34 +0000
Message-ID: <PH7PR12MB87968F09CAC17487AD48AC0DB0C22@PH7PR12MB8796.namprd12.prod.outlook.com>
References: <20250226085733.230185-1-colin.i.king@gmail.com>
In-Reply-To: <20250226085733.230185-1-colin.i.king@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=8185bcc0-359d-4304-a64a-b2aeaa565c80;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-26T09:12:25Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|IA1PR12MB8333:EE_
x-ms-office365-filtering-correlation-id: aee71f55-2d3f-4b1f-f274-08dd5645b4f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VUo4Tk1ablNoOHF1SnZuWUZBbytpanZ0aWcrazkvMUF3WlR2QlpFRUphY1Ja?=
 =?utf-8?B?Q2tMWENCNTA3UGFWTkt4cjdsMGdkTjl4L2ozdmxmTDVyUXVzQWM1UGFWcENj?=
 =?utf-8?B?Q1lYZk9vUCt4S1h2bkwwblduVjdWeFNYSVRRTDk1dmpRYVZoOHl0YitKd3N0?=
 =?utf-8?B?RUkrL0NrT1BYdXNqQlFEa1hIM2h1SUpPT3Z4L3lDalNHOWxocGV5REFWelJ2?=
 =?utf-8?B?L3B0bjVnakYzZHpBMW5FV21SclBUUmRrY25oeCtUWW9yUVZkMmNNNG9hRnlW?=
 =?utf-8?B?VkdVZnpERVRHTHNnRHRLcXU5NkZ4TkdhL3lMK09KaGpOblBnb2Jkd05XMUsy?=
 =?utf-8?B?U1MvV1R3dHBQTU14cjl1Nml0WTk0OGVvamQ3Sk5HYjIxV1FZSmNBM1BrMzgv?=
 =?utf-8?B?bVphbGdYSkdTT0x3WkFGSXRXVEtrMG9aQlhHdmhnWW41eS9DTnB5eVZycWF1?=
 =?utf-8?B?c2FSVHdrRllvMTk4cjRucXVNWVlxRjhkd0F1QmxKU1ZxV2JtYUV2bjhScjJy?=
 =?utf-8?B?UEFHTEhzTXBValRSSjRoVUZRRDluNDVkbTlQMHR0L1pJSU5uWFNVQzc1RVJV?=
 =?utf-8?B?N0ltcUViREwyUFVFRTkzaU5odVRFVTM5Y29WTFdDZ1lwcmRzbEs1UGxGRUpL?=
 =?utf-8?B?eVlHUTYzM1pZWTZ4TU5YcTlhdW5RQjY0dVpqUThLNmlITEUxaTduMGtSR0dX?=
 =?utf-8?B?SG93c3VUK2ovODRjVmFpcEQ1TndKVlQ3MkpRNWlmelhtUnJxWms5ZlptZlE4?=
 =?utf-8?B?TFREalR0dnIyUi9SUzlkR3RKYTdGUHBOS2NFbzRvcHhXR3JBOTFaM2N3cVAy?=
 =?utf-8?B?QVh3R1p1YXUwNHl6SGNBNlM0YSt6UU4yWk01eWdYd3dJRSsxNDFNd2lMLzlq?=
 =?utf-8?B?eEhVekl0TEs1UEVZYkVQaFNlMTNlOFhoYjdLSFpHcXJLYjliREFNNWFEaFdv?=
 =?utf-8?B?N09YMlVSa29yMHQxWTZXRjB6bVNiZmRsN3lnb2xUcXVZSjhDTEhwQU1VckRS?=
 =?utf-8?B?SDJza2NIbytqMkNvaVZBRW1RcTdTZC9JaFdOYUJxZ00wQWVSMzNKb29CRStC?=
 =?utf-8?B?R1B4a0ZjTUlOMGd6eFBZZFdZSVkrc0Zzd0dQUWFqVU5VRCtDSTYxNmF5Z096?=
 =?utf-8?B?b0dKdmFhNHJndmM3bjd1YTYydWN3MjBjUk94L0tISnJMZk42bno1amFKWExY?=
 =?utf-8?B?VVptdzJWL2xoVFhDeUFyZk1tdGJLOHpsT2RxSTNPdjlhYU1PRnc3cUVyOHZi?=
 =?utf-8?B?dlUzRE4yVjJSQzhkWk8velEwalloKzhaSGkzaE54cFNHWEUzMzFzVHAxb0wz?=
 =?utf-8?B?blQ4NTFQR1F4bkQ3aHVmTGlEd01BTk96Q2lHTlFPR3NFaDErclUzSTc5RkZY?=
 =?utf-8?B?Q1F2Rnl1UHFzN1NjckN3SHFsVElKRGt4UG9wZEYvbndNMVc1Y2pibDBjQjR4?=
 =?utf-8?B?azJ0MDY2OG9QS0RvQmdtWDNJTWpZSFFtdUNtZDcrb2Z1aWlwcVc4b2tRa05U?=
 =?utf-8?B?bklaclk4a0YrZUREdHZtclQxQW9jK3k1WjdHeGlCTDR6YXVDdUxDK3liRllI?=
 =?utf-8?B?N21jaGhsZHhoM08yNkFIWkU1SGR0R2wvTi9HZk1Wa0g5ZTUxNy9pWUdZMXlL?=
 =?utf-8?B?eWxXL3ZyQmZNekZuUHdNZFBPTDh5c3BWMmtnUHh5eTRFRzcreWpTS2NkZU93?=
 =?utf-8?B?RmtObkFONUp0bk9OLytrSUhaNDV1a1JFTWpRZlAyM053RHBPY2ZQNXpJNGNk?=
 =?utf-8?B?bDhTbjhFeEh6Rkt0UU02WkM2V3J5aXpBRDZmZTY3aVRkWWFzcnpWdjloN09x?=
 =?utf-8?B?dHFFMnRmejNpR051S2V2MHJPNWxRWVhPMVBLenhnMHVLZEhpL2FGNE1QMm8w?=
 =?utf-8?B?TytYUVhHTURMRFJZakVXNnA0QmRBSUZ2RlFTQ05rZVluRGJQQkxYSjUrSHg4?=
 =?utf-8?Q?voZYqpjV3Ef5zcYxp5eYlRBoUwm6UsCR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8796.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHNoVDBMOWRMQWdqZ1hlV3J0U0hBSW9lVE9tQ3dTUENkWjJnSm1nMTJzU1JC?=
 =?utf-8?B?WldQMFljcFpCMlFCcDBNMVFSNW5vK2tjdWhzRDhKMW02YzIzTURoS0JrY203?=
 =?utf-8?B?Qk8wcE8zRUpmdHMxSFU5KzBpeWJkMEQ1cWFFSWRzZTZUWjRMdkNkVnZDUTVo?=
 =?utf-8?B?YmQvN3VvMEdPSmovTnZkMnpvUHNhVUl0TE50aCtQRk40VEg0cDB3NnRsU0Nu?=
 =?utf-8?B?aktLZVN0RmtzSnJvdzRwMmNEaHFwMEJOSGw1bzVwRW00bE5CbFEvN1ZyeXQy?=
 =?utf-8?B?MGx3UkRnMmZpaGZkb3Z4VFdmWXFRMmZkeGFkQW9yOWlCWHI5anNhZnQ3cTV4?=
 =?utf-8?B?RHZmNXc2ckoya0JUTGJVKzZpMlFicWtYeDlFZVhCVDZIZEQxbnc1djJIODN4?=
 =?utf-8?B?c1ptdmVTZm1RVlVPTzB5K053ZHFqdkYxS1Z3NXVOVm8rK2lUK0lOZEVmNmwz?=
 =?utf-8?B?RzBMOE5BRFBGbSthbEhKRUtnTTVLWFlldkY5aENCU2hnOVg5M3RiazhWbnh4?=
 =?utf-8?B?RGp1dGd4VXJJZ0JEYjh4b2N5WnJtQ2tkWEJybGd0djkrTk9qQ0pKa0dOTzZr?=
 =?utf-8?B?cDBCSnYraVg3VW5HZGtmcFpCaFlSTGQxMVpHS2luZ2JJVjZXN21wcHo0M2I0?=
 =?utf-8?B?L0MvR0VRS3RTaGNWekFJV2Y2REt5YXVDNlYyZUtQdGlDS0REcUVVdmVVc083?=
 =?utf-8?B?VnFYVzFiU20zeE1qRUdCNWtYanVXUWFTOUxwZGlHRzVUL3Q3THBwVXFtMi9T?=
 =?utf-8?B?ZVVWb2tBcVI2RGJDSCs5Y1R4bE1Id0JCVHViVEduWWJnWktCR1JxQkNubVJz?=
 =?utf-8?B?L2Q2NHN1dEhLVkdNZVpzeDNnQUJ6cjNqdVZ4WVRPU2cwOVAvVXk4WjF6UzFm?=
 =?utf-8?B?VDd1d0VKOUN0TG5PU2VuVjVmT0JKOUNnOEZzZHVNMUFsYkZkSVl5OUtPTnlI?=
 =?utf-8?B?empjR0FlbEtTQ0pBZ3luOFJnSU81YkJLN2lTNW5JVVRCSHhaQy9GdURrWjh5?=
 =?utf-8?B?TDF5Tkh2S2drcC8rSCtKZUZndFpHR1pYMmhEL3JlUEFCK1FBVjd6cktzS1Jy?=
 =?utf-8?B?d0o3VXpyTU5GN0FUM2NnNExxTlBONzB2czFpdkdTV0hETTZXbWVaNUZRcHFW?=
 =?utf-8?B?bHJDTnJndXRYdFRESG55L2JnSk9tZ3JkSk8zM0RoY0VJbXA4Qy83NTFKU01Q?=
 =?utf-8?B?L3drT3BNNEgvZUc1cVZzeTBOZGR5bkxTWXZRakxPTnNFRXVCaGVMTFBhRDVH?=
 =?utf-8?B?VjdzbE9pZThMc3JtSDFvcXdEZmt6c3owV0syRW5LSXFxazRsejJvUEIrRGh1?=
 =?utf-8?B?QjlKeGJWSVd3UGVFem1xb2pYWGdhc2Z1TkNxOE1JbzFETDJwRS9VYnZaSlpT?=
 =?utf-8?B?eWJlK1hSaWsrblBEWjF3TzlVOG9wa3BTTXg1RUlmbmphSlI3SXJaQ2F1UlIr?=
 =?utf-8?B?MlkyclFOOGxaMGtZQ29PRVIvK2dyS3BFcmlzek1SM05JcThCM0h2QlpCbXlW?=
 =?utf-8?B?NFZVbkd2UEU5NEFmMCs2ZlQ1TXBUcmphNGwxb1luRlJUS205aktoODFPdzM5?=
 =?utf-8?B?c29LbTZ5VTR6L3NKMmlzYVdvbzh2SVZlbU8vbThzVFNBNDlja3RvSHA4a2NH?=
 =?utf-8?B?M0YxVlR3NjBjOUJ6NlhoM2ozRDRNM2pZbm1sWTJxOVM3eitsSWRWQjdUS0V0?=
 =?utf-8?B?T0NtQjJ5WGNNWGdFOUhGYTlyTUNBQ0o5dFJMNjBQNlNTU0R5ZU94SGZ0ZXlt?=
 =?utf-8?B?eUpBRmtCRmpHOVRSZ2psK01xS29PSlFvdEdGK1pBa0ZiaWVTZ1RZL3h1Zy9O?=
 =?utf-8?B?eHpRKzhrTXllUlp5MURubkdKaGFSVDROY0R6NXdPSmVYZ09kVmZONDdyWGoz?=
 =?utf-8?B?andIYXg3R3IxWkUxWmpjd0dTNHNBQ2RyK1RvOUpkbGw0UVhlSXY1dDVYejF4?=
 =?utf-8?B?WFNrQXpvODY5OE9uY3hUekpacGZ6WHkzNUo1MVNvZjRRa2dUQVdoemRGQWFL?=
 =?utf-8?B?aVdCd0NoZ3ZUYUUxL2RrcVE5eHdodm04aWZGQnBnVlkySnoxMGxOemk4RXlt?=
 =?utf-8?B?bHIrcGhZQzhTNk0xUTBLdUpGbHZiVDljWU9ORjBqLzFPWDJPUGtOb09WY2Z4?=
 =?utf-8?Q?1HXM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee71f55-2d3f-4b1f-f274-08dd5645b4f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 09:12:34.4267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAG3bxE6W/pXQf4wSpvcnOfSpH0ugQzRWbwvWwfUdQsC9kVCTY/drxME7iSCmjGa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8333
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
Cg0KUmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4uaS5raW5n
QGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyNiwgMjAyNSA0OjU4IFBN
DQo+IFRvOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBL
b2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgRGF2aWQgQWly
bGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYSBWZXR0ZXINCj4gPHNpbW9uYUBmZndsbC5j
aD47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBrZXJu
ZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
DQo+IFN1YmplY3Q6IFtQQVRDSF1bbmV4dF0gZHJtL2FtZGdwdTogRml4IHNwZWxsaW5nIG1pc3Rh
a2UgImluaXRpYWlsaXplIiAtPiAiaW5pdGlhbGl6ZSINCj4gYW5kIGdyYW1tYXINCj4NCj4gVGhl
cmUgaXMgYSBzcGVsbGluZyBtaXN0YWtlIGFuZCBhIGdyYW1tYXRpY2FsIGVycm9yIGluIGEgZGV2
X2VyciBtZXNzYWdlLiBGaXggaXQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5n
IDxjb2xpbi5pLmtpbmdAZ21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9jcGVyLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jcGVyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3Blci5jDQo+IGluZGV4IDViNmJkYWJiODAxMi4uN2I5Yzk4YmU1YjFhIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3Blci5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcGVyLmMNCj4gQEAgLTU0NSw3ICs1
NDUsNyBAQCBpbnQgYW1kZ3B1X2NwZXJfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikN
Cj4NCj4gICAgICAgciA9IGFtZGdwdV9jcGVyX3JpbmdfaW5pdChhZGV2KTsNCj4gICAgICAgaWYg
KHIpIHsNCj4gLSAgICAgICAgICAgICBkZXZfZXJyKGFkZXYtPmRldiwgImZhaWwgdG8gaW5pdGlh
aWxpemUgY3BlciByaW5nLCByID0gJWRcbiIsIHIpOw0KPiArICAgICAgICAgICAgIGRldl9lcnIo
YWRldi0+ZGV2LCAiZmFpbGVkIHRvIGluaXRpYWxpemUgY3BlciByaW5nLCByID0gJWRcbiIsIHIp
Ow0KPiAgICAgICAgICAgICAgIHJldHVybiByOw0KPiAgICAgICB9DQo+DQo+IC0tDQo+IDIuNDcu
Mg0KDQo=
