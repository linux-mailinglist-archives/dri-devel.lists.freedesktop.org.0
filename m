Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05384C69FD9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A3310E4D1;
	Tue, 18 Nov 2025 14:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ik6Mejt+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012062.outbound.protection.outlook.com [52.101.53.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006F810E4CD;
 Tue, 18 Nov 2025 14:32:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTrdv1Xu8UtyhzB3BtzzAE+NT3C0Fj4jp8k4PhzIQ31LIvcReXAJiRDN91PTKpPuwKAgMezfK51vchmZhfcnSmWxMDQLrysktKFlY9XR3AgYlWERGPDtY6EfGLxO60H9d862m2VEUMA9i3dh4lMWvFHPNq4ez2gbB/OQXRCdOR6/z6SUjs9Gg9kEUTEbTMnNgxzx6E40PSLiXiQxyAff+0pv5bS++6LJ3DAU0byGoK2L2x9JUfWYUU6CYZl8LCAbsR4t6RBTeOZTNg2OokfwYGN0RF4bp1QE075R3psvSExl4Iv57TsV3q8rFEptvDUZP0F8pXxrgm0l8izF8DPtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG4MiY5d6S+bnFLJbom3PStGoTPfZGvXbitKiZZ6nxI=;
 b=XFbFtoqe+XBJxWMAQdItpmKSgVr9GJRQ0ynFzl9hpTKFsyjJ03uElkhIptM4wQgoX+tx6qWn3UPpq/A/8NafqjwYBAxmzA9aYUCezuHGe4iKqT196RI4fJpTguOZ+rhq+ACFAtOdx9VozJIZ2KouPh8z7SzkeK5fHjKfpNIU5Di4mqcroDgi86dDhX9AfpqzvkWDAj/NBEtgcxmNnVfY08uNzJERNuB+qi8xShZP+kdheH5aLw2snzwC7PgVJiZMdo2ZmQHAGdEArffp9udwo0rKTOVbKLFZ5gMgvr9/l/zfYGTrSAP3ZIk7AuBi2M+5UnS2FeA28wr4HsRKbzrOLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG4MiY5d6S+bnFLJbom3PStGoTPfZGvXbitKiZZ6nxI=;
 b=ik6Mejt+jKdo4wP5UqTSKSNbD+kArzVcE1Lur9ZLsmQb9XBBgb4Y+j81TtVheX/qkdA3pY0AU1mowTN4ArHZAHrE9TjaVt0yMFQKwrntHmM/g5v8BURztJv6pSqBi4ETssC+NARBYgnEALpq91uebgGc6zc9HAZqBp7kuG22pcw=
Received: from DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19)
 by DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 14:32:22 +0000
Received: from DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::968c:50f1:e924:f6cb]) by DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::968c:50f1:e924:f6cb%5]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 14:32:22 +0000
From: "Lin, Leo" <Leo.Lin@amd.com>
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Tsao, Anson"
 <anson.tsao@amd.com>
Subject: RE: [PATCH v2 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
Thread-Topic: [PATCH v2 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
Thread-Index: AQHcVULDy69ntgnd/E+bl+UG8UHGMbTyn0kAgAXkNEA=
Date: Tue, 18 Nov 2025 14:32:22 +0000
Message-ID: <DS0PR12MB847953F3C4ADF38EF0F06BEEFED6A@DS0PR12MB8479.namprd12.prod.outlook.com>
References: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
 <20251114-vram-carveout-tuning-for-upstream-v2-4-4f6bdd48030d@amd.com>
 <61d28175-6662-4f3e-87bb-6148f3332642@kernel.org>
In-Reply-To: <61d28175-6662-4f3e-87bb-6148f3332642@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-11-18T14:24:10.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB8479:EE_|DM4PR12MB8474:EE_
x-ms-office365-filtering-correlation-id: 855cbac4-4644-4036-d9ff-08de26af494f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?b0haWDdLTVpWKzc3aUtJaENna0hpM3c2OUlBdXJoclFEZWpOS2tsT3pVTTAx?=
 =?utf-8?B?QmVTUUZCdk1tMGljRXZXem5lYmFwWjB3RkF0Z3B2VzI5TzJFOWhhVE43WGpP?=
 =?utf-8?B?WStMaWVNRnFDL3ppSTdYcXBHSWtsWFlhZ0RnZ0hvd0R2MmxWbDZmamxYczNr?=
 =?utf-8?B?M29pNlhEWW5uMnhVMmJxNVI1b2tlenRydkFWd3F2MzAxbmlhTHcyNEFPQXVx?=
 =?utf-8?B?c2dEZzlBaVRWN2NoWTBkQ0IvTTEvODBCTGZiYlJ2bytuRCtqaG01ck05SUhK?=
 =?utf-8?B?Q0N0TklOdjhUd2F5UjVoMFBZc2dJUldKMkxHcFN4MG5CQ0daRFhnUE9qZzBj?=
 =?utf-8?B?Z2RXM2FXN3djMzFkTFlMSVFHcEtOM3cyZXB2TzhiSXlYeGgvQ2EzRDA2UFpO?=
 =?utf-8?B?Z1VIZ0YySVJ1SmM5dnJ1Uk0vTVRoY255anNmWXdIcy8vOG92MFk4RUo2MXl3?=
 =?utf-8?B?R0RjMDY4aDRjeHpWT3NIUzhZNjVxMmVJc3FkK3NFQXVoWFdBZ0o0UTQrQ1ND?=
 =?utf-8?B?c09YdlFZdkpVQ0l5UURRenFCeS9hVUhZeUFwRnhCSkVDY1dkYjN3eVlvVVIy?=
 =?utf-8?B?MDNrV0k1eWQ5RnZjcTRpV20xdjlydnRrRzRhY0NTVTJJbjFJZ3U5d0dtd2pS?=
 =?utf-8?B?clphRmtjL3cxcU5nYlRDWTFhbHlWdnJnTkZHZ21SbUpkdVI3ZTdmUTR3OUFE?=
 =?utf-8?B?K3JKL284T0wyZXpVZEFRWmwycFhWVWJYdlV0NDV4ZFZrTkkzNGpYa3hBdXlI?=
 =?utf-8?B?NVJlUTE2ZmxFU1ZkVURQV1R2aDlTWWxIdTdmaXN3U3VqU1gxdkEreDA2dkl6?=
 =?utf-8?B?VzZkZXBLeW96VkUvb25xUEs1RVRwalFrd256L2hNUUl3bkp6ZjRtTU1idVFU?=
 =?utf-8?B?eE51SUJnVTNRQ25jYzlSWFkwVE1SbjlkV1dhUGVjWnhZQzVlREhGWTZ6N09U?=
 =?utf-8?B?UFExb3R2SGJtSEpROFhoSmdiRTc4NG84akpBM0YyblBsSS9aNHpSZjFXcTc2?=
 =?utf-8?B?TlZ1Z3BOaVVqM0VBTUFPd1ZnQ3dyV1RYQkdlT3ZoNWdwSWxmWkphNER1ZEh0?=
 =?utf-8?B?WHVnWkI5UXJhNDg1b2VXVEdldnY0T09mYkZDbW1zK1JlM0E5VjRsWXRSTmgr?=
 =?utf-8?B?TkIraWJ0L3dDdE9XeDdzejFSNCt5RXNhcTJOM3lNczcvaGdTNzE4YUlOMlVy?=
 =?utf-8?B?UDlaK3RwWjNwakhBUHIxS05XQWViME9mUjV4dWdZc216NlM0dG5VdkVobzAx?=
 =?utf-8?B?SDFESE1tb2dPaHNqZFJXQmR4UlNTSHZlQm9NcTdxQnR4ZDZzbUhUTFZrenRo?=
 =?utf-8?B?TmJ5Z28vNnhVY2habmtCWlMrVnRsQ2ZqY01aNlk4V0ovb3lPdTNvZUJ5c3Jv?=
 =?utf-8?B?aTc1emdFY1J2K1RjWFFJUEZ4dkVEQUFRRlQ3c1NkQ2l6UURMdEhCMU5KbndC?=
 =?utf-8?B?c1A5UFNLdE1ZVDd4d2NXd1VMV2pNNE1TdTdHdjE4UUFyejdPcElEZHRqUVk1?=
 =?utf-8?B?eXlKOEI3aE51TGhVSnVIajJHY3JwRnNHemh6U1ZxTlI2SGgrVXAyelZqNjlm?=
 =?utf-8?B?c0Q4ZTJsN3dFQm1FcUNjeVhnVTNNZFVab2ZweUovYXJ2OTBNZFd1UFFldDFi?=
 =?utf-8?B?R1NPQVM3RmIzVFhYeWpvYXZhcjNvUTF2MXRlMThFcXJ0MElWZFhhVC9tSktr?=
 =?utf-8?B?eUxZK0FnQVpIRlpTeUQraFQ5c1k1bTdEWXB6OFZDTXRaUlJWU1NyZFdiK3lw?=
 =?utf-8?B?M0hjY1VnbjAxYzltQW5oWHV3Z3BvZ2hTcTVId09jZkFnUHpUOUtYSHNCeW1j?=
 =?utf-8?B?U3lXVEk5djlhb2NJSk9oRjczZTNzaUlHWDVmclhvczJ3Zk1QSnRhRWpKTkR0?=
 =?utf-8?B?QTFJSEFiZkc2WWg0cW1ZRU1xbVNDeUVWdWF5RHdndzlhTjhub1pKY2RWOWd6?=
 =?utf-8?B?QWI4ZjVUYyt3emQwY2tYaUNWd1kzMFAzNWRLK2lRblJndmYxTlkzT0dUTmw0?=
 =?utf-8?B?NEcxUFVYQ3Qrb2tpRFJyTU1DbjdoWnBVZGF4RStyeHdkZGVvQktybjBjbi9W?=
 =?utf-8?B?cTg2WkxWS1dZRWI4UXgvZHM2V3pKcVRlYk1QQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0JtN000YVdDdUQ3VTdhbkQ4SG8wRnVjeHhCWXJqaXMxUUIwMC9kdzlQbDY0?=
 =?utf-8?B?S1ozMGQyZ1JoSnZFS0oyQVdPZU1QQWhKdmNBNzR5RmxHN004VW1zZzAyNjhr?=
 =?utf-8?B?UHBhOWVhb0ZtQjBhWnBCc2hlVzNXMFphK29TM3VzbkVGRDlTSTVpcHgxNmJE?=
 =?utf-8?B?Y2NvWHpyVkIybWJBRWhUUmFBQ3RJZVNORUNJOS9CaEp5YndmSm44U3dxR1R1?=
 =?utf-8?B?VU5nR25TYlo3Z0RGM2JLVlFhdFJVYkJyKzFyU3dwZDRHbW5FcC9oNDQwcUNJ?=
 =?utf-8?B?ZTlUUjhSYXhFUFZILzBsckxIRmlpcUcxL1d4OCs0emdPanlKWE9tb2JPUnc3?=
 =?utf-8?B?SWJmREVYbS8zQmc5eWtqUGdqN1Jnckw4SkhkNHROWFhNOWlLbCtlUUw5ZURW?=
 =?utf-8?B?UEh6M3IzbkNqR2FmaFI4M3FjRDhNOUZxMzV6TzdYMjNuZlJubmRYcnJjVHZM?=
 =?utf-8?B?WFhLWGo1TlBtVTFyV2NvNGxnWUs2YlR0MHlGSGtTdnBFdXBRazU0MWdQOGt2?=
 =?utf-8?B?RlExWXd0UURCME91bWh2b2JsYUZrTUtWblJ5UHpDTCt6dVkvbXBqVm9XZEx2?=
 =?utf-8?B?eWFCbGhFRkRWM01PcERNUnJqSVlEeVpFWlRpTmFpdTJmTlhmaHpPbGFGb1lH?=
 =?utf-8?B?UDAwOElBNHAxd0xkTHk1YjVLK2xicGxYRnRhZ2FxcFFKZzFnYTE2Qi9weUpv?=
 =?utf-8?B?U1V6ZUhRM0Jtdy9jVjYzZ2dSZnFwdFdZU3BZSjVrNit1MThYV1d1Qlpuc1dQ?=
 =?utf-8?B?bG1Wd3BZbEtjSXZFY2I3emk2NEcrdWUwd1RUQVB3bjNOYVNwZDdRRGxRanVi?=
 =?utf-8?B?dUQ0MjNHbWhnZ2F0RFlSV1huRkwwM0hoWmNGS29jSjczV0ZySUF1QjZvQldU?=
 =?utf-8?B?ckMyeWE0MTk1elZoTC9laUdCSSt5N09TQWpBdW5GMUFNMTZwYW5YSWxLdGE0?=
 =?utf-8?B?UTNGRFRHTnhxbUYxczVLWWltRjIxS3o0VzZEVko5MHNFaEdxQm5FNG14OElB?=
 =?utf-8?B?ZkRKVjZwNGZ6b1c5ZGF1bjg4Zm1ybzFwdXZtZkUzVS9qYW16OXNITDg0N1JR?=
 =?utf-8?B?Qy9SMGFaS1JteEtKNFZpTVVVUUNrck91NkdKOHk0a2Z3WXJ0TEowVG4zUFdt?=
 =?utf-8?B?UUZYSmY3TDR3SDgyNnJRNklBUGJQb1oxRWc0U2ZJaEp6eG45YXNreTFFMjFy?=
 =?utf-8?B?bWJrOUIxUm9UWmZKYkVZUitGQU5UVE82SnFGZzF5QzZVZHRpZytBMzZtRHdM?=
 =?utf-8?B?VUhBNm1EYnUrWHFNNkxycEVWbUVLa3FjckFnK3I4eXNHZGxQNG4vSG13ZmFk?=
 =?utf-8?B?bzNQOEo2RkIzVHpyNXloZDFnNFo0WGV2VWczQ2xxeW9XcllsaHNyQzBUbnFG?=
 =?utf-8?B?NHYrY1RRV3ErSStwdXFEbTJFSTlsRy9aS3VWNjU1NzlCc2d2MGd4RVpGOFBJ?=
 =?utf-8?B?eWw1YzY0Q1llRXpma3lDaVFnd1NyUm5vRDZta0tDcjFCa1NjWFQzNmpiMFVh?=
 =?utf-8?B?eEZZQVBxV2cxbmpzMUN6aE8waW5OUjhPM3lUZzJ3WUVxVXJxeHVqQnU3SU1D?=
 =?utf-8?B?eWd5NTIzYVkzZnB4NUhmSmtLV1NmUnZBOGJ5VWFHaThRT3FMdXVvRFR5R0V1?=
 =?utf-8?B?RWhwVDluSzVZU05EMlRmSDNRUlhMV25vbkhFT0hJVEd2YjdaU3hMa1NEUXAv?=
 =?utf-8?B?RkU5REpRTDZXc2VvQnNocVlxZzdGeFc1N1hvelpNaElGV3BPNklXVnA5eDlX?=
 =?utf-8?B?K1N2OVlHa2RReFNuSWtHaC8zajlBS0IyRGNvanJjNEZhRitEWnZGL3BNYjRt?=
 =?utf-8?B?TEFhbmlQb2NzUTRXT2xZN2N6SVFzODM4Nm1JRmRDSWdMTDVUZFlGUFJmU05Y?=
 =?utf-8?B?NmpWaFc5NkphOHFQR1pySDdFWUlvRDBrTDl3UXVMdGhNTk1jYi9XSWU5UU1E?=
 =?utf-8?B?T1FoRUIzalh2NmE4Q1VsUjZ5NEZQeTBTRlpqSVRrSFBzS1hmUENkTVBUTVk4?=
 =?utf-8?B?eFJkRjg0T1gwemUveTNXd0JWTDdTc1NkMGkraElmRzg0ckRreWVocDJzY1U4?=
 =?utf-8?B?S3lvMnZLSVF1REcyOXhJMVk1OHZ6YnpCV25qSVRIZ2EwSzU1eWRkRGROZldu?=
 =?utf-8?Q?mMNA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855cbac4-4644-4036-d9ff-08de26af494f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 14:32:22.3712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7b7VOCFfVpZOPgC/9A1thMv9qtwPh8HclW+mptvws6xA9vAUyBvMWzDiJ10Wd+Dw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474
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
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJpbyBMaW1vbmNpZWxs
byAoQU1EKSAoa2VybmVsLm9yZykgPHN1cGVybTFAa2VybmVsLm9yZz4NCj4gU2VudDogU2F0dXJk
YXksIE5vdmVtYmVyIDE1LCAyMDI1IDQ6MjYgQU0NCj4gVG86IExpbiwgTGVvIDxMZW8uTGluQGFt
ZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+
OyBLb2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgRGF2aWQg
QWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYQ0KPiBWZXR0ZXIgPHNpbW9uYUBmZnds
bC5jaD47IE1hYXJ0ZW4gTGFua2hvcnN0DQo+IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+OyBNYXhpbWUgUmlwYXJkDQo+IDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47DQo+IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0
QGx3bi5uZXQ+DQo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc7IFRzYW8sIEFuc29uDQo+IDxhbnNvbi50c2FvQGFt
ZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC81XSBkcm0vYW1kZ3B1OiBhZGQgVU1B
IGFsbG9jYXRpb24gaW50ZXJmYWNlcyB0bw0KPiBzeXNmcw0KPg0KPg0KPg0KPiBPbiAxMS8xNC8y
MDI1IDI6NDIgQU0sIFlvLUp1bmcgTGVvIExpbiAoQU1EKSB3cm90ZToNCj4gPiBBZGQgdHdvIHN5
c2ZzIGZpbGVzIGFzIGludGVyZmFjZXMgdG8gaW5zcGVjdCBvciBjaGFuZ2UgVU1BIGNhcnZlb3V0
DQo+ID4gc2l6ZS4gVGhlc2UgZmlsZXMgYXJlOg0KPiA+DQo+ID4gLSB1bWFfY2FydmVvdXRfb3B0
aW9uczogYSByZWFkLW9ubHkgZmlsZSBsaXN0aW5nIGFsbCB0aGUgYXZhaWxhYmxlDQo+ID4gICAg
VU1BIGFsbG9jYXRpb24gb3B0aW9ucyBhbmQgdGhlaXIgaW5kZXguDQo+ID4NCj4gPiAtIHVtYV9j
YXJ2ZW91dDogYSBmaWxlIHRoYXQgaXMgYm90aCByZWFkYWJsZSBhbmQgd3JpdGFibGUuIE9uIHJl
YWQsDQo+ID4gICAgaXQgc2hvd3MgdGhlIGluZGV4IG9mIHRoZSBjdXJyZW50IHNldHRpbmcuIFdy
aXRpbmcgYSB2YWxpZCBpbmRleA0KPiA+ICAgIGludG8gdGhpcyBmaWxlIGFsbG93cyB1c2VycyB0
byBjaGFuZ2UgdGhlIFVNQSBjYXJ2ZW91dCBzaXplIHRvIHRoYXQNCj4gPiAgICBvcHRpb24gb24g
dGhlIG5leHQgYm9vdC4NCj4gPg0KPiA+IENvLWRldmVsb3BlZC1ieTogTWFyaW8gTGltb25jaWVs
bG8gKEFNRCkgPHN1cGVybTFAa2VybmVsLm9yZz4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJpbyBM
aW1vbmNpZWxsbyAoQU1EKSA8c3VwZXJtMUBrZXJuZWwub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFlvLUp1bmcgTGVvIExpbiAoQU1EKSA8TGVvLkxpbkBhbWQuY29tPg0KPiA+IC0tLQ0KPiA+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcGkuYyB8IDEyNw0KPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTI3IGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYWNwaS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YWNwaS5jDQo+ID4gaW5kZXggNDQ0YWI0MTAyMTY4Li5iOTM3OGYzNGViNzkgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcGkuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3BpLmMNCj4gPiBAQCAtMzAsNiAr
MzAsNyBAQA0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3Bvd2VyX3N1cHBseS5oPg0KPiA+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9zdXNwZW5k
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gPiAgICNpbmNsdWRlIDxhY3Bp
L3ZpZGVvLmg+DQo+ID4gICAjaW5jbHVkZSA8YWNwaS9hY3RibC5oPg0KPiA+DQo+ID4gQEAgLTEy
NDcsNiArMTI0OCwxMjUgQEAgaW50IGFtZGdwdV9hY3BpX2dldF9tZW1faW5mbyhzdHJ1Y3QNCj4g
YW1kZ3B1X2RldmljZSAqYWRldiwgaW50IHhjY19pZCwNCj4gPiAgICAgcmV0dXJuIC1FTk9FTlQ7
DQo+ID4gICB9DQo+ID4NCj4gPiArc3RhdGljIHNzaXplX3QgdW1hX2NhcnZlb3V0X29wdGlvbnNf
c2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyICpidWYpDQo+ID4gK3sNCj4gPiArICAgc3Ry
dWN0IGFtZGdwdV91bWFfY2FydmVvdXRfaW5mbyAqdW1hX2luZm8gPQ0KPiAmYW1kZ3B1X2FjcGlf
cHJpdi5hdGNzLnVtYV9pbmZvOw0KPiA+ICsgICBzc2l6ZV90IHNpemUgPSAwOw0KPiA+ICsNCj4g
PiArICAgaWYgKCF1bWFfaW5mbyB8fCAhdW1hX2luZm8tPm51bV9lbnRyaWVzKQ0KPiA+ICsgICAg
ICAgICAgIHJldHVybiAtRU5PREVWOw0KPiA+ICsNCj4gPiArICAgZm9yIChpbnQgaSA9IDA7IGkg
PCB1bWFfaW5mby0+bnVtX2VudHJpZXM7IGkrKykgew0KPiA+ICsgICAgICAgICAgIHNpemUgKz0g
c3lzZnNfZW1pdF9hdChidWYsIHNpemUsICIlZDogJXMgKCV1IEdCKVxuIiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW1hX2luZm8tPmVudHJpZXNbaV0ubmFtZSwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW1hX2luZm8tPmVudHJpZXNbaV0ubWVtb3J5X2NhcnZlZCk7
DQo+DQo+IEFGQUlDVCB3aGVuIG1lbW9yeV9jYXJ2ZWQgaXMgMCBkb2VzIHRoaXMgc2hvd3MgYXM6
DQo+DQo+IDA6IE1pbmltdW0gKDAgR0IpDQo+DQo+IFRoaXMgaXMgYWN0dWFsbHkgNTEyIE1CIHJp
Z2h0Pw0KPg0KPiBDb3VsZCB5b3UgY3Jvc3MgcmVmZXJlbmNlIHdoYXQgV2luZG93cyBzaG93cyBp
biB0aGF0IGNhc2U/ICBEbyB0aGV5IHNwZWNpYWwNCj4gY2FzZSBpdCB0byA1MTIgTUI/DQoNClll
cywgdGhpcyBvcHRpb24gaXMgYWN0dWFsbHkgNTEyTUIuIEJJT1MgbWVudSBhbHNvIHNob3dzIGl0
IHRoYXQgd2F5LiBXaWxsIG1ha2UgaXQgc2hvdyA1MTJNQiBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0K
DQpCUiwNCkxlbw0KDQo+DQo+IEknbSB3b25kZXJpbmcgaWYgbWF5YmUgdGhhdCBzaG91bGQgYmUg
c3BlY2lhbCBjYXNlZCBoZXJlLg0KPiA+ICsgICB9DQo+ID4gKw0KPiA+ICsgICByZXR1cm4gc2l6
ZTsNCj4gPiArfQ0KPiA+ICtzdGF0aWMgREVWSUNFX0FUVFJfUk8odW1hX2NhcnZlb3V0X29wdGlv
bnMpOw0KPiA+ICsNCj4gPiArc3RhdGljIHNzaXplX3QgdW1hX2NhcnZlb3V0X3Nob3coc3RydWN0
IGRldmljZSAqZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRl
dmljZV9hdHRyaWJ1dGUgKmF0dHIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
aGFyICpidWYpDQo+ID4gK3sNCj4gPiArICAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXVcbiIs
DQo+ID4gK2FtZGdwdV9hY3BpX3ByaXYuYXRjcy51bWFfaW5mby51bWFfb3B0aW9uX2luZGV4KTsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHNzaXplX3QgdW1hX2NhcnZlb3V0X3N0b3JlKHN0
cnVjdCBkZXZpY2UgKmRldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBjaGFyICpidWYsIHNpemVfdCBjb3VudCkNCj4gPiArew0KPiA+ICsgICBzdHJ1
Y3QgYW1kZ3B1X3VtYV9jYXJ2ZW91dF9pbmZvICp1bWFfaW5mbyA9DQo+ICZhbWRncHVfYWNwaV9w
cml2LmF0Y3MudW1hX2luZm87DQo+ID4gKyAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gZGV2
X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKyAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
ZHJtX3RvX2FkZXYoZGRldik7DQo+ID4gKyAgIHN0cnVjdCBhbWRncHVfdW1hX2NhcnZlb3V0X29w
dGlvbiAqb3B0Ow0KPiA+ICsgICB1bnNpZ25lZCBsb25nIHZhbDsNCj4gPiArICAgdWludDhfdCBm
bGFnczsNCj4gPiArICAgaW50IHI7DQo+ID4gKw0KPiA+ICsgICByID0ga3N0cnRvdWwoYnVmLCAx
MCwgJnZhbCk7DQo+ID4gKyAgIGlmIChyKQ0KPiA+ICsgICAgICAgICAgIHJldHVybiByOw0KPiA+
ICsNCj4gPiArICAgaWYgKHZhbCA+PSB1bWFfaW5mby0+bnVtX2VudHJpZXMpDQo+ID4gKyAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsgICBvcHQgPSAmdW1hX2luZm8tPmVu
dHJpZXNbdmFsXTsNCj4gPiArDQo+ID4gKyAgIGlmICghKG9wdC0+ZmxhZ3MgJiBBTURHUFVfVU1B
X0ZMQUdfQVVUTykgJiYNCj4gPiArICAgICAgICEob3B0LT5mbGFncyAmIEFNREdQVV9VTUFfRkxB
R19DVVNUT00pKSB7DQo+ID4gKyAgICAgICAgICAgZHJtX2Vycl9vbmNlKGRkZXYsICJPcHRpb24g
JXVsIG5vdCBzdXBwb3J0ZWQgZHVlIHRvIGxhY2sNCj4gb2YgQ3VzdG9tL0F1dG8gZmxhZyIsIHIp
Ow0KPiA+ICsgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICB9DQo+ID4gKw0KPiA+
ICsgICBmbGFncyA9IG9wdC0+ZmxhZ3M7DQo+ID4gKyAgIGZsYWdzICY9IH4oKGZsYWdzICYgQU1E
R1BVX1VNQV9GTEFHX0FVVE8pID4+IDEpOw0KPiA+ICsNCj4gPiArICAgZ3VhcmQobXV0ZXgpKCZ1
bWFfaW5mby0+dXBkYXRlX2xvY2spOw0KPiA+ICsNCj4gPiArICAgciA9IGFtZGdwdV9hY3BpX3Nl
dF91bWFfYWxsb2NhdGlvbl9zaXplKGFkZXYsIHZhbCwgZmxhZ3MpOw0KPiA+ICsgICBpZiAocikN
Cj4gPiArICAgICAgICAgICByZXR1cm4gcjsNCj4gPiArDQo+ID4gKyAgIHVtYV9pbmZvLT51bWFf
b3B0aW9uX2luZGV4ID0gdmFsOw0KPiA+ICsNCj4gPiArICAgcmV0dXJuIGNvdW50Ow0KPiA+ICt9
DQo+ID4gK3N0YXRpYyBERVZJQ0VfQVRUUl9SVyh1bWFfY2FydmVvdXQpOw0KPiA+ICsNCj4gPiAr
c3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmFtZGdwdV91bWFfYXR0cnNbXSA9IHsNCj4gPiArICAg
JmRldl9hdHRyX3VtYV9jYXJ2ZW91dC5hdHRyLA0KPiA+ICsgICAmZGV2X2F0dHJfdW1hX2NhcnZl
b3V0X29wdGlvbnMuYXR0ciwNCj4gPiArICAgTlVMTA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArY29u
c3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCBhbWRncHVfdW1hX2F0dHJfZ3JvdXAgPSB7DQo+ID4g
KyAgIC5hdHRycyA9IGFtZGdwdV91bWFfYXR0cnMNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRp
YyBpbnQgYW1kZ3B1X2FjcGlfdW1hX29wdGlvbl9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KSB7DQo+ID4gKyAgIHN0cnVjdCBhbWRncHVfYXRjcyAqYXRjcyA9ICZhbWRncHVfYWNwaV9w
cml2LmF0Y3M7DQo+ID4gKyAgIGludCByYzsNCj4gPiArDQo+ID4gKyAgIGlmICghYXRjcy0+ZnVu
Y3Rpb25zLnNldF91bWFfYWxsb2NhdGlvbl9zaXplKQ0KPiA+ICsgICAgICAgICAgIHJldHVybiAt
RU5PREVWOw0KPiA+ICsNCj4gPiArICAgcmMgPSBhbWRncHVfYXRvbWZpcm13YXJlX2dldF91bWFf
Y2FydmVvdXRfaW5mbyhhZGV2LCAmYXRjcy0NCj4gPnVtYV9pbmZvKTsNCj4gPiArICAgaWYgKHJj
KSB7DQo+ID4gKyAgICAgICAgICAgZHJtX2RiZyhhZGV2X3RvX2RybShhZGV2KSwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gcGFyc2UgVU1BIGNhcnZlb3V0IGluZm8gZnJvbSBW
QklPUzoNCj4gJWRcbiIsIHJjKTsNCj4gPiArICAgICAgICAgICBnb3RvIG91dF9pbmZvOw0KPiA+
ICsgICB9DQo+ID4gKw0KPiA+ICsgICBtdXRleF9pbml0KCZhdGNzLT51bWFfaW5mby51cGRhdGVf
bG9jayk7DQo+ID4gKw0KPiA+ICsgICByYyA9IGRldm1fZGV2aWNlX2FkZF9ncm91cChhZGV2LT5k
ZXYsDQo+ICZhbWRncHVfdW1hX2F0dHJfZ3JvdXApOw0KPiA+ICsgICBpZiAocmMpIHsNCj4gPiAr
ICAgICAgICAgICBkcm1fZGJnKGFkZXZfdG9fZHJtKGFkZXYpLCAiRmFpbGVkIHRvIGFkZCBVTUEg
Y2FydmVvdXQNCj4gc3lzZnMgaW50ZXJmYWNlcyAlZFxuIiwgcmMpOw0KPiA+ICsgICAgICAgICAg
IGdvdG8gb3V0X2F0dHI7DQo+ID4gKyAgIH0NCj4gPiArDQo+ID4gKyAgIHJldHVybiAwOw0KPiA+
ICsNCj4gPiArb3V0X2F0dHI6DQo+ID4gKyAgIG11dGV4X2Rlc3Ryb3koJmF0Y3MtPnVtYV9pbmZv
LnVwZGF0ZV9sb2NrKTsNCj4gPiArb3V0X2luZm86DQo+ID4gKyAgIHJldHVybiByYzsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgYW1kZ3B1X2FjcGlfdW1hX29wdGlvbl9maW5pKHZv
aWQpIHsNCj4gPiArICAgc3RydWN0IGFtZGdwdV91bWFfY2FydmVvdXRfaW5mbyAqdW1hX2luZm8g
PQ0KPiA+ICsmYW1kZ3B1X2FjcGlfcHJpdi5hdGNzLnVtYV9pbmZvOw0KPiA+ICsNCj4gPiArICAg
bXV0ZXhfZGVzdHJveSgmdW1hX2luZm8tPnVwZGF0ZV9sb2NrKTsNCj4gPiArICAgdW1hX2luZm8t
Pm51bV9lbnRyaWVzID0gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIC8qKg0KPiA+ICAgICogYW1k
Z3B1X2FjcGlfZXZlbnQgLSBoYW5kbGUgbm90aWZ5IGV2ZW50cw0KPiA+ICAgICoNCj4gPiBAQCAt
MTI5MSw2ICsxNDExLDEyIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2FjcGlfZXZlbnQoc3RydWN0DQo+
IG5vdGlmaWVyX2Jsb2NrICpuYiwNCj4gPiAgIGludCBhbWRncHVfYWNwaV9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQ0KPiA+ICAgew0KPiA+ICAgICBzdHJ1Y3QgYW1kZ3B1X2F0aWYg
KmF0aWYgPSAmYW1kZ3B1X2FjcGlfcHJpdi5hdGlmOw0KPiA+ICsgICBpbnQgcmM7DQo+ID4gKw0K
PiA+ICsgICByYyA9IGFtZGdwdV9hY3BpX3VtYV9vcHRpb25faW5pdChhZGV2KTsNCj4gPiArDQo+
ID4gKyAgIGlmIChyYykNCj4gPiArICAgICAgICAgICBkcm1fZGJnKGFkZXZfdG9fZHJtKGFkZXYp
LCAiTm90IGNyZWF0aW5nIHVtYSBjYXJ2ZW91dA0KPiBpbnRlcmZhY2VzOg0KPiA+ICslZCIsIHJj
KTsNCj4gPg0KPiA+ICAgICBpZiAoYXRpZi0+bm90aWZpY2F0aW9ucy5icmlnaHRuZXNzX2NoYW5n
ZSkgew0KPiA+ICAgICAgICAgICAgIGlmIChhZGV2LT5kY19lbmFibGVkKSB7DQo+ID4gQEAgLTEz
NDMsNiArMTQ2OSw3IEBAIHZvaWQgYW1kZ3B1X2FjcGlfZ2V0X2JhY2tsaWdodF9jYXBzKHN0cnVj
dA0KPiBhbWRncHVfZG1fYmFja2xpZ2h0X2NhcHMgKmNhcHMpDQo+ID4gICB2b2lkIGFtZGdwdV9h
Y3BpX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ID4gICB7DQo+ID4gICAgIHVu
cmVnaXN0ZXJfYWNwaV9ub3RpZmllcigmYWRldi0+YWNwaV9uYik7DQo+ID4gKyAgIGFtZGdwdV9h
Y3BpX3VtYV9vcHRpb25fZmluaSgpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gICAvKioNCj4gPg0KDQo=
