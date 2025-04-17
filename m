Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF8A916D1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 10:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2351A10EA61;
	Thu, 17 Apr 2025 08:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z5r5tY3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87D410EA5D;
 Thu, 17 Apr 2025 08:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZvlgkuZd46lSFGntna/j0QVpiBufRZXEN+xTq78ORbmERIS3TpYhrTP8UPhsRa8OATOOBJ4tpby8VIhbG/BYqRhGplHYXfqghxO1B32bijgO3iVw0VO8shU4hAwQTH69WAD7WacjiiSDwqfbh0bci3O8jbkSeP4SGnF/kkLYP1GPcpdbq+5Q4+oF1aGlS5uQAxknUDknGCjEjXkJbr8AJzmTnwlvWUoj82e7dg8Mcrv3N4YFUZGwMIfmqeavUktqz49f9rLJQXSUy7pgZS2gGdr+7FC5HeZoKCP1lKyilyl5+wDdpoJ/pcQedX376fetTfUo4QSJkoZZuhXWCacDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5l6G6H+HL33Lmr+ASj/fcbkiCSFl9jsZs/OEyb8VB4=;
 b=QIHhgCbahCpfccmWf9yvhIPCLHZi78YdfKM+thOI5H95nofzs4FbC6OFI691sIkDL41x/mzn1YrOW1PUuGnnQZiK0e31A5ftQkRmoMgcg7OWTEy3evYzWyP1pCkXq6BkvdtfIpBCWQXpReJXfwlfJp57DM9gb/ht+uBSCizZnEV/KkfcRf2n+6cl/zUmXTZNDcCUSq1VWtpDedYjDwodSnRP/lpe/9tMAAjaRS5Z4Dg5N0px58oGMADjSyQuHkzUogoM9rdcKlZmkcwGt4/+bbJ13FRkuRPIWUsrfJOoDrcV1Dc/52MxdQca9QA5cdOY+6f3/7qV3s98FLHfF5b2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5l6G6H+HL33Lmr+ASj/fcbkiCSFl9jsZs/OEyb8VB4=;
 b=Z5r5tY3sBJMmrQOIxVTTV2lJdSGgqXM5dXNdTKhW5httPpKX5KI2uiCFtQrupzLO0np/9hl6f5TdCahLYxQDlRmlWBSUotXnFgVr20f0X/9xFKFPQPV216PXh9Hrp3TxiZ3Cqfgo0BTW/GNS6IRZrIVfFMUn/uroV5CkQI7hmd0=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.22; Thu, 17 Apr 2025 08:45:46 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::db2e:f082:bb80:d1a4]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::db2e:f082:bb80:d1a4%6]) with mapi id 15.20.8655.025; Thu, 17 Apr 2025
 08:45:45 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Wentao Liang <vulab@iscas.ac.cn>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Add error
 check in fiji_populate_smc_boot_level()
Thread-Topic: [PATCH v2] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Add error
 check in fiji_populate_smc_boot_level()
Thread-Index: AQHbre5dYF29rhbNu0CTAhoCkian4rOm66oAgACgsrA=
Date: Thu, 17 Apr 2025 08:45:45 +0000
Message-ID: <DM4PR12MB5165E65CD092473E3592ED488EBC2@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20250415100813.3071-1-vulab@iscas.ac.cn>
 <CADnq5_NiW9EmhEDCC1R=g7Q+DjjRxQGmQv6rLPk_9RZo3O=pfw@mail.gmail.com>
In-Reply-To: <CADnq5_NiW9EmhEDCC1R=g7Q+DjjRxQGmQv6rLPk_9RZo3O=pfw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=1726984d-572f-4542-a75c-b400abdd397d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-17T08:38:37Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5165:EE_|DM6PR12MB4466:EE_
x-ms-office365-filtering-correlation-id: 38d96862-6a3e-4dea-c03e-08dd7d8c3eb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M0YyN25UTmpVZTEvckVIQlkrTldoNFliUm5rdGgvWFJEajRSMCtwN29kQnZm?=
 =?utf-8?B?bGZIWi82Wi8ralZTNHJBcGR2Y2JudWtaR0FrVXNFNlZ3M3R6WnFESkkxajFy?=
 =?utf-8?B?b0d5VVBTWXdRN2pKUFQ5R2JxcFltY3ZpdFBxbDhvRUt3eEg3K3pXZHp4SVB2?=
 =?utf-8?B?aWlINTZtdm1sNVBIZEJzYy9vZjZjOUp2ZlBMdUt3UnoybmFWUU1FZWtwN09V?=
 =?utf-8?B?aUtCazMvTGFVVjdncW1sZnJ1bWJSdWdpNC9XSTRpQjd3WVRBSmZqd3dFMkRC?=
 =?utf-8?B?Vm9ncVcwQktabWYxYmF1VzNEcUR0L280Njg2bjNEVGRueHpOZjhPNVBreVRB?=
 =?utf-8?B?TFIwdkNWb1VzMXNSNzZBRGtYVlBhRHZiQ1oxUVpHWFZGcktHbTZwelZqeGYr?=
 =?utf-8?B?US9lUjdjbHJieE5KWXA5V3ZlMFhDT1lXTENPMW96ZTZ6QzJ1eHlaZEJ6eFhE?=
 =?utf-8?B?ZG9ZWVl1dWduMjdXZzV4QzA1bTBmU1RSMVFndFJtSnM0eXQ2OVNwN0N1WS9j?=
 =?utf-8?B?NUVvSkNiQkEyblp0a2lNM2NDUDdyRk1KZkNsemxQa3EzRDRtWUxOc2N3Sk5y?=
 =?utf-8?B?bm05SDBBREpTaHNyNFE1dG1Da3hDWGc2dEUvZitXSzhIZnY4WHFQZVdoQ2dM?=
 =?utf-8?B?ZGpaUkQ0VG1YM0x5S3VhL3dCU0w2RStTTWZLY29TRmRQaTNPM1l3VWI0NU42?=
 =?utf-8?B?QzVOY3hMTzg4TkVzVXVLVDNUOURNY0lOSHhEZEN4VUhleHA5MVE1ZkZwZHYv?=
 =?utf-8?B?dVFNbWYyalRlamQ3Yit6eDRpRFd0ZUV1Q0hlRTZSMm9pNjR4UzJiNHFNZ3FN?=
 =?utf-8?B?MmxMVGcxUDc1KzhFWjR0djl2VDZCN3lZYXYrczdSS2N5Zkg5QlhRWFUxWGN2?=
 =?utf-8?B?ZzFndXVFS0pQb0JOZ2dhNkxPRWpKVEExNWVYTTh6eHFwa1IxdFJ3NVUxODhY?=
 =?utf-8?B?cEJpVGtvSDltZVc1dVV6blNXdzlIMkw2MTBON2dBT2JESXlaUHNZQVdWdk5w?=
 =?utf-8?B?ek5FQkZ2amlzYjNqVEZZZ3FEdXNUeGhMdit3MnZtUWQraC93bzBWWlltdGhO?=
 =?utf-8?B?Sk5mT2V0Si8yZzUyMUROczdmTzR2Z2hZMzdWcURpYWdjcDBGbXJOWCsvTE84?=
 =?utf-8?B?cXZYbE5KMjRQa3FjTXBGdEtrSnF4Umc0bHZiZEVrQlpHWFVQR2cyRXg1UWdY?=
 =?utf-8?B?VzVXVXlOYVlHZzBLeWRid3JrL3pNS3M2bVViMWR1UFdsdlVpQXpxSWRRNGZV?=
 =?utf-8?B?WjZkb0JobFB3L0J0OU0wR3N0UlFGUFBuS2x6THlZeTdQeEVhdzM5bEM1cXVV?=
 =?utf-8?B?REhJdnJDd3dVeXorZi9oQzMyWEdXMktRbUxkTFhXRm5xME5VZk9zZDZ3OUc1?=
 =?utf-8?B?TUFRSzJnNEZXN0QydExrSmRKM0hQaGc0d3pOclN1a2tQV1B2ejIxeGp3V3Fs?=
 =?utf-8?B?OVhNNWp2WlV0VVF3cUJ2WEkzVlQ5MlQxTExyQUJ5cjlIVFBCMC81VXFhSFFF?=
 =?utf-8?B?TUY1NTU4K1M0N1RQWkl6Q3dlM2Qya2U3YzIzaHlTTTFEb3dnaXIzVVdHaTFI?=
 =?utf-8?B?S0xnSjhYcEU4UzJQMEZxZlNIeDkxalF0cW1XVzF0dnFERlFoSW00b1A5anp5?=
 =?utf-8?B?RTU0MkpOazlPOG8vbEczcElkZ0p2MjJkNGZmb2wrY2FJSjRsQ0lqVWYyeGFX?=
 =?utf-8?B?SG40MWlKVWNJL0xIbUV2dUNJaFBTbG1Qc1FTWkZ6YzdZUzZWeWo3R0hNa1Ry?=
 =?utf-8?B?L05jUHFyVDVsRU82V1BMaFY4MUNubHg0YUNDZGU5ZElIWjhYT3p1aHpuMlpT?=
 =?utf-8?B?Y1VZVEpJSzd5RnBrL0NJcFFRcWREbzFXMEZDejdPd1FnRzh0YmFWQ0lCZEU0?=
 =?utf-8?B?SVk3YUpQUzdibVl2REpuaFhueTJoaGJ0RjhIZjJxVkVMaVc5VlJZdldtMjVj?=
 =?utf-8?B?RmxFdysrZDJJSHVEMi9hMUNUWFFwYlVWSC96MDRRZG8xWXR1UE9obDg1YUg0?=
 =?utf-8?B?azZvd2NUZElRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTUrZjdqL1dTRk1ZTkc1dXZGRHd3emZWYmNKOTJaVEdkNDl3VTd3MC81RUZv?=
 =?utf-8?B?bDZZWnMrYlBrQ0RMeDlUSUljVDhLZ0JNcFRPT3BRS0x6eU9QSU5SRlB1djFQ?=
 =?utf-8?B?ZFE4OGFxelVQM0NveGtnTDZuZVA0WjhmalNiQmdFVTYrVEp6aE11dFBIMnh1?=
 =?utf-8?B?b1JCeDl0VWhDankzUWZDQmxSRGUvWGU5TmVqOVlhWmJUY3dYMzVzTlUweU8w?=
 =?utf-8?B?REQ3SnRHSDlNRTMyVVQ4YmhPclphdk1CY0sxdG1wT1VYcndkYlYrYVlJTHFZ?=
 =?utf-8?B?ak9zZ0c0WG5rUGlQVTJsWlpSUENHS0ovQ3lFV1pONTN2SGhJWE11Mkg5WWxR?=
 =?utf-8?B?Z1Q5ekpXWDgrcW83TFhBSElKeUxScDl0Mk1iaWJ4ZHg1Z25IelhuUHp4TXF4?=
 =?utf-8?B?MkJROWR0bWJNSEg1d2thSGxycGY3WkZweHNjakZJNHduQnlhdkV2RlRMc3JR?=
 =?utf-8?B?MWVPY2lJS0ZwK1ZvODVnL0hHRVA5OVR5T1dLdFM5ZUxZdnkrQi83MkdYSk04?=
 =?utf-8?B?VEhWd3hwa0x2UHBua3VHTzM2Y0RlMzh2SERKMXpHcXIrZlEzZnpoWm0xMmpU?=
 =?utf-8?B?bG1WU202TEhmREIvc25rVjhFTnZFZGVFZEhOVU5QamNLejJObXFEa1lIUUJz?=
 =?utf-8?B?bG1PVEFEbnhQSHFuQnFYMWVrbHhLUTZHd01ZVjZvWE5UUTM5RjRPN1Arency?=
 =?utf-8?B?WDM2YmQ4WThhVi9UM2E3TVpMNFdHeXd1NHZZUUM0citXdWtKanY4YzcrZzUz?=
 =?utf-8?B?VFlyNUpTWFVxamxvNmg0c1Fjb25RblhDY1QzWk9Xc05CVTBnU3NZLzkrR1Va?=
 =?utf-8?B?ZWVGNU5scXlOM2diODNjMERxT1A3dTBxcEZ1VGVDNHZEZXNNVUtZRkdpaGMz?=
 =?utf-8?B?ODBRb2ppVXozNTBGN25BWmhrY0VQem80QUlNWXFlOEhOZWxKaFF1NGU5WEp1?=
 =?utf-8?B?NHpnWjR5bzgwUHI0K2NKU2lKWnd6V1hjM09mVDA4MTBGRm9iVTRhbW52TVha?=
 =?utf-8?B?WlJxQTZEZTl5TkxkR2tFQlVENjllR2c2OFZHMElNL01PWWYwWUc1Rkh6eTg4?=
 =?utf-8?B?ejdGTEU1TUhyNVBoR01TZFdSYlI4UWkwLzFzeUZ2MWdaSWJrL0RvS3UrdUpa?=
 =?utf-8?B?ZEIwcUlOM1dSQTIyUDlocHNhR0VpVWlDVmdXeFJkYWRxdlUraTFybzFJOXVD?=
 =?utf-8?B?c0ordER2TkxiYjFTOUVXRlVMeXNvN2xaY2dwanczTXF3UC9SVWJjSGpxejA5?=
 =?utf-8?B?NlBJc0MwSUdwU1VUR3VSbXgzcFdhUXUra3czbUFwbkhvQ0FFdFdtelY5cmRE?=
 =?utf-8?B?YnFFTVhVd0lGUWhDWlU2dE1JQWdxakJaaWZtVWk0NFZXZnB1NUNORWUxSXMz?=
 =?utf-8?B?dVc3Ym9JQ1l4RktwRmo5Sms0M2dDM0p2SXBVblp3Y3FDcVV2eFBvWlR6TzR4?=
 =?utf-8?B?MlhOVFhkWjFzdlNCUkt6Umx2UVpSNlhCdzBJcFZjb0tBRkNYTWduY1phTE0x?=
 =?utf-8?B?b2dYZU5OeUNIYlRQL3Eyb0thRGVwNGx1ZFVaRFc4YU5oZlM2Zklva0Vob20r?=
 =?utf-8?B?b2cxOVVVUkNVMmxyeE9MUEU0UEZyb3VGVEVCdVJmQ3JKSmhhTWsya3FhZE9s?=
 =?utf-8?B?T3kxK20zVjBzTlhrbnpXWUdoVGJEM3RlVkNVWjU2c2NDaCswSWFsRmgzWHZZ?=
 =?utf-8?B?UzdkOEY0cVUrYUVCSmUzSTVBb21iR0o1RjFkVzljRkkxSmJWenlJdDVlNTRj?=
 =?utf-8?B?aXdTWitJY240VEV1ZUdzUW8xcHZ6eDJ1QlRmRE1jN05yc0k2cUs5bXRabkhM?=
 =?utf-8?B?cHRuSDJWaEVNb2ZBdWZ5OWVLeTJNSXFVbFVsU0pzTllTVUowRElKMW5QcEo0?=
 =?utf-8?B?by85UmRhaXczWm8vRGR2T1VlZVBzUU9MV0ErN2lCdjZtYVY0K3FiTDRyaWsr?=
 =?utf-8?B?TTh1OFdGVjVkMVhiZjZEN0xGVFJ5YTBaQmVtamNZaExjc1ZSU0VvSUp3c0FO?=
 =?utf-8?B?NEJmaFBOUXI3NEVjRStlRTJnTkZhNmpqTk1UaW5UdGFBN2ZqSXFnbXNUaHZM?=
 =?utf-8?B?WEFOSm1XVEFHTFgxNXJjdmpjdU9sWlc2d3ByRmhSbW5OOGt5WkFjcUgrUU04?=
 =?utf-8?Q?lxUg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d96862-6a3e-4dea-c03e-08dd7d8c3eb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 08:45:45.7314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgUQLcnrEKWUcPCv0uKPvWlO6TTREAduFRLlIXEcHXlUxveXybBPmEcl32dDGbMO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466
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
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXggRGV1Y2hlciA8YWxleGRl
dWNoZXJAZ21haWwuY29tPg0KU2VudDogVGh1cnNkYXksIEFwcmlsIDE3LCAyMDI1IDc6MDMgQU0N
ClRvOiBXZW50YW8gTGlhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPg0KQ2M6IEZlbmcsIEtlbm5ldGgg
PEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNv
bT47IFhpbmh1aS5QYW5AYW1kLmNvbTsgYWlybGllZEBnbWFpbC5jb207IHNpbW9uYUBmZndsbC5j
aDsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1n
ci9maWppX3NtdW1ncjogQWRkIGVycm9yIGNoZWNrIGluIGZpamlfcG9wdWxhdGVfc21jX2Jvb3Rf
bGV2ZWwoKQ0KDQpDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVy
bmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywg
Y2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQoNCg0KT24gVHVlLCBBcHIgMTUsIDIwMjUg
YXQgNjoyM+KAr0FNIFdlbnRhbyBMaWFuZyA8dnVsYWJAaXNjYXMuYWMuY24+IHdyb3RlOg0KPg0K
PiBUaGUgcmV0dXJuIHZhbHVlIG9mIGZpamlfcG9wdWxhdGVfc21jX2Jvb3RfbGV2ZWwoKSBpcyBu
ZWVkcyB0byBiZSBjaGVja2VkLg0KPiBBbiBlcnJvciBoYW5kbGluZyBpcyBhbHNvIG5lZWRlZCB0
byBwaG1fZmluZF9ib290X2xldmVsKCkgdG8gcmVzZXQgdGhlDQo+IGJvb3QgbGV2ZWwgd2hlbiB0
aGUgZnVuY3Rpb24gZmFpbHMuIEEgcHJvcGVyIGltcGxlbWVudGF0aW9uIGNhbiBiZQ0KPiBmb3Vu
ZCBpbiB0b25nYV9wb3B1bGF0ZV9zbWNfYm9vdF9sZXZlbCgpLg0KPg0KPiBGaXhlczogZGNhZjM0
ODNhZTQ2ICgiZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyOiBSZW1vdmUN
Cj4gdW51c2VkIHZhcmlhYmxlICdyZXN1bHQnIikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcgIyB2NS4xMSsNCg0KSSBkb24ndCBrbm93IHRoYXQgdGhpcyBpcyBhIGZpeCBwZXIgc2Ugc28g
SSBkb24ndCB0aGluayBzdGFibGUgaXMgYXBwcm9wcmlhdGUuDQoNClRoaXMgaXMgcHJvYmFibHkg
b2ssIGJ1dCBUQkgsIEkgZG9uJ3QgcmVhbGx5IHJlbWVtYmVyIGhvdyB0aGUgcHB0YWJsZXMgd2Vy
ZSBzZXQgdXAgb24gdGhlc2Ugb2xkIGNoaXBzIGFuZCB3aGV0aGVyIGNoYW5naW5nIHRoZSBjdXJy
ZW50IGJlaGF2aW9yIHdvdWxkIGFjdHVhbGx5IGZpeCBvciBicmVhayBhbnl0aGluZy4gIEknZCBi
ZSBtb3JlIGluY2xpbmVkIHRvIGp1c3QgbGVhdmUgdGhlIGxvZ2ljIGFzIGlzIGxlc3Qgc29tZXRo
aW5nIGJyZWFrLg0KDQpJbiBwcm9kdWN0aW9uLCBWQklPUyBtYWtlcyBzdXJlIHRoYXQgdGhlIGJv
b3R1cCBjbG9jayB2YWx1ZXMgbWF0Y2ggdGhlIG9uZXMgaW4gcHB0YWJsZS4gU28gdGhlIGVycm9y
IGNhbid0IGhhcHBlbiBpbiByZWFsaXR5LiBBbmQgdGhlIHJlc3VsdCBpcyBvdmVycmlkZGVuIHRv
IDAgYW55d2F5LCBvbiB0b25nYSBhcyB3ZWxsLg0KVGhhbmtzLg0KDQpLZW5uZXRoIEZlbmcNCg0K
DQo+IFNpZ25lZC1vZmYtYnk6IFdlbnRhbyBMaWFuZyA8dnVsYWJAaXNjYXMuYWMuY24+DQo+IC0t
LQ0KPiB2MjogRml4IGVycm9yIGNvZGUuDQo+DQo+ICAuLi4vZHJtL2FtZC9wbS9wb3dlcnBsYXkv
c211bWdyL2Zpamlfc211bWdyLmMgfCAyMw0KPiArKysrKysrKysrKysrKy0tLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1n
ci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211
bWdyLmMNCj4gaW5kZXggNWU0M2FkMmIyOTU2Li43OGJhMjJmMjQ5YjIgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1n
ci5jDQo+IEBAIC0xNjAwLDE5ICsxNjAwLDMwIEBAIHN0YXRpYyBpbnQgZmlqaV9wb3B1bGF0ZV9z
bWNfdXZkX2xldmVsKHN0cnVjdA0KPiBwcF9od21nciAqaHdtZ3IsICBzdGF0aWMgaW50IGZpamlf
cG9wdWxhdGVfc21jX2Jvb3RfbGV2ZWwoc3RydWN0IHBwX2h3bWdyICpod21nciwNCj4gICAgICAg
ICAgICAgICAgIHN0cnVjdCBTTVU3M19EaXNjcmV0ZV9EcG1UYWJsZSAqdGFibGUpICB7DQo+ICsg
ICAgICAgaW50IHJlc3VsdCA9IDA7DQo+ICAgICAgICAgc3RydWN0IHNtdTdfaHdtZ3IgKmRhdGEg
PSAoc3RydWN0IHNtdTdfaHdtZ3INCj4gKikoaHdtZ3ItPmJhY2tlbmQpOw0KPg0KPiAgICAgICAg
IHRhYmxlLT5HcmFwaGljc0Jvb3RMZXZlbCA9IDA7DQo+ICAgICAgICAgdGFibGUtPk1lbW9yeUJv
b3RMZXZlbCA9IDA7DQo+DQo+ICAgICAgICAgLyogZmluZCBib290IGxldmVsIGZyb20gZHBtIHRh
YmxlICovDQo+IC0gICAgICAgcGhtX2ZpbmRfYm9vdF9sZXZlbCgmKGRhdGEtPmRwbV90YWJsZS5z
Y2xrX3RhYmxlKSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEtPnZiaW9zX2Jv
b3Rfc3RhdGUuc2Nsa19ib290dXBfdmFsdWUsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAodWludDMyX3QgKikmKHRhYmxlLT5HcmFwaGljc0Jvb3RMZXZlbCkpOw0KPiArICAgICAgIHJl
c3VsdCA9IHBobV9maW5kX2Jvb3RfbGV2ZWwoJihkYXRhLT5kcG1fdGFibGUuc2Nsa190YWJsZSks
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhLT52Ymlvc19ib290
X3N0YXRlLnNjbGtfYm9vdHVwX3ZhbHVlLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKHVpbnQzMl90ICopJih0YWJsZS0+R3JhcGhpY3NCb290TGV2ZWwpKTsNCj4gKyAg
ICAgICBpZiAocmVzdWx0ICE9IDApIHsNCj4gKyAgICAgICAgICAgICAgIHRhYmxlLT5HcmFwaGlj
c0Jvb3RMZXZlbCA9IDA7DQo+ICsgICAgICAgICAgICAgICBwcl9lcnIoIlZCSU9TIGRpZCBub3Qg
ZmluZCBib290IGVuZ2luZSBjbG9jayB2YWx1ZSBpbiBkZXBlbmRlbmN5IHRhYmxlLiBVc2luZyBH
cmFwaGljcyBEUE0gbGV2ZWwgMCFcbiIpOw0KPiArICAgICAgICAgICAgICAgcmVzdWx0ID0gMDsN
Cj4gKyAgICAgICB9DQo+DQo+IC0gICAgICAgcGhtX2ZpbmRfYm9vdF9sZXZlbCgmKGRhdGEtPmRw
bV90YWJsZS5tY2xrX3RhYmxlKSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEt
PnZiaW9zX2Jvb3Rfc3RhdGUubWNsa19ib290dXBfdmFsdWUsDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAodWludDMyX3QgKikmKHRhYmxlLT5NZW1vcnlCb290TGV2ZWwpKTsNCj4gKyAg
ICAgICByZXN1bHQgPSBwaG1fZmluZF9ib290X2xldmVsKCYoZGF0YS0+ZHBtX3RhYmxlLm1jbGtf
dGFibGUpLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0YS0+dmJp
b3NfYm9vdF9zdGF0ZS5tY2xrX2Jvb3R1cF92YWx1ZSwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICh1aW50MzJfdCAqKSYodGFibGUtPk1lbW9yeUJvb3RMZXZlbCkpOw0K
PiArICAgICAgIGlmIChyZXN1bHQgIT0gMCkgew0KPiArICAgICAgICAgICAgICAgdGFibGUtPk1l
bW9yeUJvb3RMZXZlbCA9IDA7DQo+ICsgICAgICAgICAgICAgICBwcl9lcnIoIlZCSU9TIGRpZCBu
b3QgZmluZCBib290IGVuZ2luZSBjbG9jayB2YWx1ZSBpbiBkZXBlbmRlbmN5IHRhYmxlLiBVc2lu
ZyBNZW1vcnkgRFBNIGxldmVsIDAhXG4iKTsNCj4gKyAgICAgICAgICAgICAgIHJlc3VsdCA9IDA7
DQo+ICsgICAgICAgfQ0KPg0KPiAgICAgICAgIHRhYmxlLT5Cb290VmRkYyAgPSBkYXRhLT52Ymlv
c19ib290X3N0YXRlLnZkZGNfYm9vdHVwX3ZhbHVlICoNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgVk9MVEFHRV9TQ0FMRTsNCj4gLS0NCj4gMi40Mi4wLndpbmRvd3MuMg0KPg0K
