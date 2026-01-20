Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK4sFkLpb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A3F4BAE0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDA210E6FB;
	Tue, 20 Jan 2026 20:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mYJLNEo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3F310E699;
 Tue, 20 Jan 2026 20:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIdt4AMouvdBqWFtPo+qf7goefXpu40PqPC+bTkQeG95rpRa+KL5boCNbMdBD6lWhRMXNUILnrTUgYrOSxmYcUJ6PMwkQNrtf+O7Fw5jRcBeSmG2I7HDMEXqtrhOemB+vlkoKsSomD+qNfXB4u2J47dlPxQP9s2xt9C9VLkQ0CyFMppFVoRpW/tvJ3gNARDLezey3Otr6yGHJklbhJP89O3pnQ6mQtrQ4X2Qyb01SYU6LAtG9yhECrQv3UT62j3HYmTLGflBeBKDkhKRAh7aUOPoUA5DzmZipyLKPDy2VxiYc3CwrQhj6wz6k1eKqy6XbHZnMCuWfCWTu2Z/zSmcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jsv1e8brNR4vRcNmqW8W+18B6YXhLsOcJX3aAlSFAAo=;
 b=tewqwABnVlI+YH+l1lii7MLvIFr+2lscwfm0vDM/q/E4DNHMbolTsLE201zRCuohNRBzbeDm64ugqLHwWqzB5I6IVI7lJs45Wwc6Dt29yxWDs54NfUs31RdUr2jB6DLtL51/y4isDvYQInyz3z9igMITEa2uBe1RlZjPaJelSEw+2rwwWGFPIAKya3Q6WNmHbhr7CgKyPPpFKeTHx6Xaf60WZ5Tc8wPt+VPZ1tWLwR4RUA7OfgzCEfJkKswoj1FUiEfyK+5UwFRjO6mIGN5C8WSFE736zumAXO1RogDZ3BLTbssGA1b8zS7ERVDTlFWXg8+bbGVq3iBMEj7w/eVEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jsv1e8brNR4vRcNmqW8W+18B6YXhLsOcJX3aAlSFAAo=;
 b=mYJLNEo0LWrSNHrNr869MhSvSH66M6aXuTSlVQY2vZDpjo/Ll58ZLgtmPuDLqvD98LG4jaC7Wnran4+JZVMlra5tejd0m9Ci9UUtJJ6ZN6p0RO/NOkD4jVD3PoJfuwfrLom0rB0UggwtLrMKLFTvlcXQ4bZIvqI89XIKFt/ZbwcP3Y4m8dc6SEzVpOXOtYaOVQtZxKw5+tbajGyOoXui/Vzwl+nNNnRjXcjt29igWNPZuYn9Opcjob9ZTTroGLnCqlK5rI0ikDrBhatredDkrpQo6dx0nlaXqxnpdEAM3XLyNwxZprPSpoLQKdTkV/QzJt5a6YHpBMciRw4zH0uMGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.13; Tue, 20 Jan 2026 20:44:35 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:35 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v6 26/26] nova-core: mm: Add BarUser to struct Gpu and
 create at boot
Date: Tue, 20 Jan 2026 15:43:03 -0500
Message-Id: <20260120204303.3229303-27-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR12CA0026.namprd12.prod.outlook.com
 (2603:10b6:208:a8::39) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: f35792fe-f5ac-42ed-70ab-08de5864b8c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wJ9qVTEp+tLm0w6mG0nh6k70zse8tNsYAonZi9n7QTBVw9h91XU6tc+sJ6tS?=
 =?us-ascii?Q?PKTiKNlkj3I5hPyklQgyYKF3w6bZf1KYC6Z/HEa4n4VYtFW9n7rB6QmjtdoW?=
 =?us-ascii?Q?Pm3fPLwSmBFCAj22U4QnZlWElED11CGYPqQMhAhSMoPwNW/qRIuxLJ+UMI+I?=
 =?us-ascii?Q?kyEaN2yPmW+RFIMCCoBf/MXMytFiLz9TbC5GwERIk3LNYePsZWrsoGU625Ny?=
 =?us-ascii?Q?n1yP1/xMxeNg5gyByZSnqY+pBrYRphO8I9oncF3oIkErAvk3EqO2ZtXe6DTq?=
 =?us-ascii?Q?9zpyuwq8WO7HeQonX7TAeuSbBeRKXYc/lzwPvxJbRMbItdXfLnLIUfwNeDwx?=
 =?us-ascii?Q?TukYK/VUt0c9BI6SfmnUiQpkmDzz5UCKppWus/LIpRfPQOVrcnGg4YIYYJkd?=
 =?us-ascii?Q?XtZzHwWPUF8g3FkqYMrxRhoFtsn+UEND4Oax4thpvN55WY6dQfrxLEiKorR7?=
 =?us-ascii?Q?dZ2HxTXjGUzLEh7wv4NjaBV7ClAfH6KR4zOYEhpzNuXkc8wslO3vCRBC9rLT?=
 =?us-ascii?Q?FtxZmM/tYenZBwe5Fkp0m6jjHDpNaQootkF9fbgzKjXSyT7ZDysr5Wx5rvY/?=
 =?us-ascii?Q?A2H8NjAglm1241fUnyAMNn/UlfZqTeihqvwpStqhr0Qer31oEYKyMmSGtdgC?=
 =?us-ascii?Q?g+GFSUh5JT5m7lMRNMR5ykW9tRihFnp7GgwhTXYH8cHX//XGW8XpTRuYCQMc?=
 =?us-ascii?Q?vwTRSTG+SHcKf8LD0vcZQqMyVXAiBssdI9h4oDgdeY6A2K/npGYTetawe53G?=
 =?us-ascii?Q?NI6AQTkQGvCCu0S1Ogfi7iArOP3T4Hbd989nSdxlD0a4Wi7IzqaZ978YlgD4?=
 =?us-ascii?Q?nPV0f1HDo9Ne81Cy5IEInvF+XmkiwuML8SM8fXVVMw0NSNUOYmbH5eAoA7bH?=
 =?us-ascii?Q?16vpNlVcsc3qXIqNd026bNucCEJXC/fKoiN6O+P0gLCOXivk800U8i5U4DND?=
 =?us-ascii?Q?PP8uO1AjkVvHlJAWo9OjGFqQ72iE97OPKPb+kx8wmu7ersmBZjTZ0kZPC32s?=
 =?us-ascii?Q?3CAE7f3/QnOJAbvwv/bOASUKrxHBQ6+ObFDDUsZRddq9OEET/8SPOSCbKRYe?=
 =?us-ascii?Q?b1wbU4x/etImYNyiJVmIpFs04IxYJY7BZ0BJVVGlyqTbeo8q9OlvGtSkLqeI?=
 =?us-ascii?Q?eZGuG6BxKEz+04lcf68Xqs268KcmLHH53NgjgHspZfgtnJIAr9fKZq6ZtkeH?=
 =?us-ascii?Q?YTT2lnIM+/t4HJLkPhQ6enWhm6Spn7/QIACaAnpio8nA3fwgriJCM2m4TMUa?=
 =?us-ascii?Q?olHrFGOFnDdYXSEIsEGMtkIB7RUThfiSF17KQMphnn4+qxuHzW6ScAX/hQkc?=
 =?us-ascii?Q?z3l7wnQBm0ExqNAiUWoF/fREfXLZsC0wOYnQ2bd6w4pBrffPH/WK6inpgh2D?=
 =?us-ascii?Q?k6ZuIuJqEZIumwpbTVM5EMXoLP3cDbPPVYuLIT9zs8Z/3PM+RXL3N/vL4OFX?=
 =?us-ascii?Q?aMfLSS5FmzkwBeG7GhJ/LHawvpC/M0z+qQie5Jon+9VWXMua/eyV03bYL5rU?=
 =?us-ascii?Q?0lLyXWB9PSNZsjgA10AvoQCV+D34AqGdh2AxDyVN7bqAt4kJnrZrL2nIZWyb?=
 =?us-ascii?Q?VuigMb63ufioQ6sr2fU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+midhUHRyjfDD0STAL7z94X16xh88xbqNDauodS/8wFXmNOPJZfCwAbMmFGZ?=
 =?us-ascii?Q?eonZhmGmN0xjnbHYcDH3X3jqU00QApV7L7uXqOEHOktZUMFYRORIcMVSxc3q?=
 =?us-ascii?Q?yGj/9mxL3yJnDKdjijrEA5pEcUDZs6dgAQq5rmfHFiDb7OTRQzzl/YNDolUc?=
 =?us-ascii?Q?+CiIPqR8A1BK3z0XknnqifNSxe3I2eHMrL/qnRUDVKE+syBsSV6umZXWVM/t?=
 =?us-ascii?Q?tqfZiAfo3isZxvNLwKwBAR+s4VQG0YfOXpzkA5Z8iv5gVuetOVUEjnDMGnP0?=
 =?us-ascii?Q?6H5BQCOXsyqOenPoACd+GIhFm/0KpIKhzA/Km7TKLczPwhaNEO07wYKFAe1h?=
 =?us-ascii?Q?8chp2FwY+K+OHWmWMFho6hry82xh0/Z5PhRvMBkmxurn5SzRm60km7t+AIuh?=
 =?us-ascii?Q?Le91PLHIOJ6h9Du/be2acRC1mC9kr5mli1i1rphuuS9XpTWORih7jEZpXvHS?=
 =?us-ascii?Q?wVis/DjqbnxB9j7lhNopXaScROCQ8wdrxoES5gmFEwwBVYJmPEt5MCOUGkOM?=
 =?us-ascii?Q?gNOL7ctfowIYFDQCwxQLH1STq2aC4WP7dCZTaCiaBfwh1wmg8U7yrHe9r0mS?=
 =?us-ascii?Q?eMCnADTcvPdizcJOW9iY396jyJnBo0aTi2uoZkQQOI1MDTto7d+Ars4+8Ctf?=
 =?us-ascii?Q?fhNwYv8Fg1UlW4rUWnvEZ0HUc6sg2yXg0sAMTcIU8OZPRBuuH7R4ZcEEFpl7?=
 =?us-ascii?Q?3CpWrIl2XcRpfhyoDxGxlP42JoUAKO8l9wWAL1oimm+Yayax7JnSHazl+Ifx?=
 =?us-ascii?Q?tCIL8V1GtrVxDv6rwklDk0fZ/o+7hwA8r7ywZa9d2nM2xrOzagKokHwHQ27v?=
 =?us-ascii?Q?3k8uEGEz8JANZ2u/oxRo0LBzWw/+R/wSO+yISL7DCHK1HAOE1GiB8mONelfd?=
 =?us-ascii?Q?MXPrXDwQj/CF68G4zBgjEGPtcj/cKJ6cjqwSXaIdwx4mZnnRqAgGiJrNBQ1j?=
 =?us-ascii?Q?mp3ouu6y20iHM7+q+16R3OMWxpU06uDcnw4ZX+ZxcU8aq20DD1ScxhCVTvi2?=
 =?us-ascii?Q?8PMHlKmcmZMizQKYAecLbFHGxKZWGS7TJAtXjKHEtSvu1SDXo4QHkCRE4u4n?=
 =?us-ascii?Q?3ip51+8jT9VniRB0DMdOkL8z7TzsBMpT54zweB6ifekSy17dOy+N56q4ReW8?=
 =?us-ascii?Q?2gqwHVSBYGgbTRUVdyDprIYZCVPaYWMoNWNjm1kkJLIPYb/eqsz6UJNIvvZ6?=
 =?us-ascii?Q?KOXtg4JsqGlCXT5hEX/WfvlUDNYcxnJ0eoE0Q1gVVrMBkWLbFuukgKY/PN4V?=
 =?us-ascii?Q?7AV2SQYgBs4jZJkIKOmL+/E7+RsC1EIrWa7Xt1xIRkYS61mXFNxZH53hcjiq?=
 =?us-ascii?Q?2krrbgnmCqE6TaZgs+i6g4gi5AFhEklnWo4jAqBjb5MAvVT4grNRALgdnyrf?=
 =?us-ascii?Q?ddCgzc+pZWGNdc2oHU3HQixWFzf9lpSrblw3y5miBPsxOau/UFw9QB0RwaZd?=
 =?us-ascii?Q?cKSFXiapIbrto7XeTu3/i5v8KlSMtJbM4e69ipsfM9Kmc+pkJiSXGEISMtSg?=
 =?us-ascii?Q?5B6yxNfyY5s6cS67LxR6m+Da5dZhAPMKu2tf/t0PwtOwPD3AWd6VyYQAWbY9?=
 =?us-ascii?Q?xVMduQ1K9MeTECCrUzEsYrojMiw4OWVQ4zvaltsWv52cVTukh3IvGj4+Ty7T?=
 =?us-ascii?Q?BIjROHm/SvJWyTk4KcAEy3GVhQK24UaKIGVclzJQa5h7J3s6Laz354nZFmiV?=
 =?us-ascii?Q?lTIob90AEXcJs4Xp4fkaIC6KPlRofpbgTjxz5zhNCZRBypoLCuCEQA8xgb/f?=
 =?us-ascii?Q?dY9JNKnS/Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35792fe-f5ac-42ed-70ab-08de5864b8c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:35.5096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ig643zkLuC7LXCBSY/i9lX77fhcBupmWFSEMQPNE5LQG/1otdQPuXyQ4NEVK5XaB1ss3KJst2+9wxVrOwFFDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: E5A3F4BAE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a BarUser field to struct Gpu and eagerly create it during GPU
initialization. The BarUser provides the BAR1 user interface for CPU
access to GPU virtual memory through the GPU's MMU.

The BarUser is initialized using BAR1 PDE base address from GSP static
info, MMU version and BAR1 size obtained from platform device.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index dd05ad23f763..15d8d42ecfa8 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -26,7 +26,12 @@
         commands::GetGspStaticInfoReply,
         Gsp, //
     },
-    mm::GpuMm,
+    mm::{
+        bar_user::BarUser,
+        pagetable::MmuVersion,
+        GpuMm,
+        VramAddress, //
+    },
     regs,
 };
 
@@ -35,6 +40,7 @@
 struct BootParams {
     usable_vram_start: u64,
     usable_vram_size: u64,
+    bar1_pde_base: u64,
 }
 
 macro_rules! define_chipset {
@@ -271,6 +277,8 @@ pub(crate) struct Gpu {
     gsp: Gsp,
     /// Static GPU information from GSP.
     gsp_static_info: GetGspStaticInfoReply,
+    /// BAR1 user interface for CPU access to GPU virtual memory.
+    bar_user: BarUser,
 }
 
 impl Gpu {
@@ -284,6 +292,7 @@ pub(crate) fn new<'a>(
         let boot_params: Cell<BootParams> = Cell::new(BootParams {
             usable_vram_start: 0,
             usable_vram_size: 0,
+            bar1_pde_base: 0,
         });
 
         try_pin_init!(Self {
@@ -328,6 +337,7 @@ pub(crate) fn new<'a>(
                 boot_params.set(BootParams {
                     usable_vram_start: usable_vram.start,
                     usable_vram_size: usable_vram.end - usable_vram.start,
+                    bar1_pde_base: info.bar1_pde_base(),
                 });
 
                 info
@@ -344,6 +354,16 @@ pub(crate) fn new<'a>(
                 })?
             },
 
+            // Create BAR1 user interface for CPU access to GPU virtual memory.
+            // Uses the BAR1 PDE base from GSP and full BAR1 size for VA space.
+            bar_user: {
+                let params = boot_params.get();
+                let pdb_addr = VramAddress::new(params.bar1_pde_base);
+                let mmu_version = MmuVersion::from(spec.chipset.arch());
+                let bar1_size = pdev.resource_len(1)?;
+                BarUser::new(pdb_addr, mmu_version, bar1_size)?
+            },
+
             bar: devres_bar,
         })
     }
-- 
2.34.1

