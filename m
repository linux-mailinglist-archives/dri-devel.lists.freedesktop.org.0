Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AchOUwnlmkvbgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970BF1599C9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B766910E622;
	Wed, 18 Feb 2026 20:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AnF6dDIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011037.outbound.protection.outlook.com
 [40.93.194.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E1210E61D;
 Wed, 18 Feb 2026 20:55:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okAmeX3/W3jTD+/Dd72Tt+KDi7HiUSCfDqj+qttd9zv+ZWw//a2807Tmi7XyWqLgzPxhWlNwgTdbcOE/vnhYyYlsbqfZgg6cAhC3xCn4RD+p17425D/TmKb/FkkYEAIkiv+UAyKsJN30nMEtmjy+Mayt0UVrZwUX1+eJlHwCX72KuyRvirQD7nYVc6qbZs+tn4uS0cBgHvbRyyaf75E8z6m+AlI9DRMC3ROEYYS/1HXjVtN9QgtL7wvUvveEGMwbVeUHpQJ+yyucC6JTORrb4Y6IotSv81wDZfUXsUwL4CsD+BRVFLQU5wdawdeDwxLJ/zMw2xTsfbS5EWr04IXVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTKgckHqENZNSWGfsHIpHTsn7t6tLd8/f+Yki4Kw6eE=;
 b=PR3Afeo+ZBGvwKuA5SIYKyDasUFYxJk4D581xDn3oGrA3wScsaa4FRvGMXO6fGE9YRPzzKTf30n5DPKwlbSJw8xgCsdeFqMsEWGdfiJtf0uedJWCLLKVtEM9QLsBk7DIK1P/jpIszDkVIzFUb+6AQqLmPhfNX1KRu9hVU0Q/D0UW0uNxaEiQQvAVAUEhuk5tvcsAQKDgU5ISnS1pEWLc6vdHqFr8mjITWJGHunUpXmjHOg2kh0B0fHChSZyns6HG0rZ0kntG99gVx3bvm20EVjUQBl4wiIrNgXl2J4Tn6a4bQ4HreDFy1QuMj4wmTqHR5QhvV0TvGoooScULdC013Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTKgckHqENZNSWGfsHIpHTsn7t6tLd8/f+Yki4Kw6eE=;
 b=AnF6dDIhPWYil093vf8UClBJAiTiZ/dxRIRbNMHT0nnL2MtANGjD701rwV92Eo8mBNIAEaZBVdhjbFShoibLUrhCo21U6Eg9DfIIzAbGLlMLCSrL9H5vV+lzDP5NRupw5CxG336QN7yMzBVcXzP+78dpaRhKqzFUSf2ONslP53HRj3lIVz/L2EW3kVPF23ezGx8ksjNvdId2lQRay4U7WXdSEFKQJai1v13IROCDnh2vFaSrCNqqPMgJ8PEHvYl5LlpxC9ChchQpwtC2jjLwC5nBHORIOiZaw2wt5L26yUIgvXs4M5YnARC0D+BpQOQLYf+9/XpFDbOAXfviGH71HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Wed, 18 Feb 2026 20:55:32 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 20:55:32 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v10 1/8] gpu: Move DRM buddy allocator one level up (part one)
Date: Wed, 18 Feb 2026 15:54:59 -0500
Message-Id: <20260218205507.689429-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::17) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a3b064-2bfd-414b-c80e-08de6f300e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T8z1dzwxNGK0wJvtlSBcde8PbsHJIn73hntWJC4ej8bJy/6hiYHG6figoeSv?=
 =?us-ascii?Q?dz5R3R+Ep/8TcuV2vuXAwX2aj4ciPW5G+pZjYgrS9+y5lhscDR2yn7wfSVDm?=
 =?us-ascii?Q?mstOy451K+fsg2VKIihSpghvVikMcZO4PilKrPDB+Rxy4fKJG4V9POgSRGrt?=
 =?us-ascii?Q?BqluSb45wtA88nnyusDf/HsmIDMaX4JF/I8MP4z9+N7xvjwFY9CbW/61uyWs?=
 =?us-ascii?Q?gbfEyPoNiYsg16E8MIGEEFC/ofjVgWP7cYeDXu8ew90rA1kfdbdOapiHGWu3?=
 =?us-ascii?Q?UWDRrExctUW6FQn7653s06Hdfd2wonnfJ7l99E/RFD5V5TPaMSyo/CgJfFGM?=
 =?us-ascii?Q?BwUklNfIO3KoFM0M2onMqMPsURB32quo6Fcr4Hk0qw58bysmSJ8dnsvBLldb?=
 =?us-ascii?Q?pRLhkLG6AAi45CVXtGw8w0642avu8mclFcyJc3P3+T39EP/aqWEXl9uhLe7v?=
 =?us-ascii?Q?uE/81HhcnHF7eP1FADrKBMoPAqbTucs5Ls8S33wxR8uGchXNtC3SRLxGE9QM?=
 =?us-ascii?Q?ie0pamtVJNMr21ccX/ErtfcBQfXioOsuFDEzVmalcieTGOwE2tYVE5jilCS1?=
 =?us-ascii?Q?40zKLvbv7mjqCscJgnJE/M//YF0vjnQHhM+qVMMLCbzr+yEnMQ9U5gUqbhpJ?=
 =?us-ascii?Q?ef4Cnr4XHIGeWTxEdVZ5AOUAooELaPYyChoPOgpQ87oVBKp4vW+rSKiXvM0c?=
 =?us-ascii?Q?gUwMr+8YjoUXR4wgF9wu5IhS+Y87rq0LuUEFv1V89sPNYtb0yA3gLwW87Ko9?=
 =?us-ascii?Q?pU/qIHLr7N9rpwS5f18Nj4Bd3eOGhAcjZQJbWexpTjLodmQI1lTjVnP5iIU4?=
 =?us-ascii?Q?d1iuPlP/2RS6fcCw/PksGlPPRT3cSmAJYvqJR4tlBymzn7sVyjtT7m9cfMly?=
 =?us-ascii?Q?sXnDsMtZvlTRkDLUSpzFpK0Vz7gvJO3SduJWp/NT+Sobr7RinmkHpEskULEQ?=
 =?us-ascii?Q?3/ywxx8Te9sMtm5g4mOtluzpyTT+/RgAqLQxrFDghyxp/2oGgnsKu3+VLRKa?=
 =?us-ascii?Q?Na/boUgoimHTM/3gtatkm76d6xzXROhsoniNMxg8XmQ3ciSsyB/bei/ItPr8?=
 =?us-ascii?Q?qrt656HXsfBVeqxXTDofKGEQjpvFGOv+rBQ0tOp5yuT3s5dhJwhtxRWoFd+U?=
 =?us-ascii?Q?a+9u0F6Bms93r730Ut41zE4r4x/WFx6PLd6WK6hj13iZLUkBxGiR4FlKhGnU?=
 =?us-ascii?Q?+JZtJma4zkI3etNjlqX0+yFaihss6uIgnzpdWPOadsQNFQLaHyB4+5zUvVrv?=
 =?us-ascii?Q?qywFo6UG5R3sVN5/OeJqzaW03SqEg6+rn/MMtrmIrhP0jFtEEu9KiXG2v1r9?=
 =?us-ascii?Q?5MWpmcYe+J47b7zzJ+Tbque/aI3zbFtHMyZKAcPAqw61elFkzozuRsEMn/Kv?=
 =?us-ascii?Q?73o995ZpFmN80G7WgyZPCfZz0LXGuIjRuASLOGmJ5Smc4FnceGjo2bRINw6d?=
 =?us-ascii?Q?i9VipZjqRbthEY/EbnJAJSHztVsiwNU529+IkId+MDlzEcAS9Cy2LezHH1fI?=
 =?us-ascii?Q?ZRPMWGJhjOqxWjh6ARrtjgE6dEs408e4ubJOHIYBPgsigjLeyhmfJ/jJQ3f1?=
 =?us-ascii?Q?xD2q328ygNywawNJ8LCyhbVmbyTd6EmSbxlebkTEJWv710pRHi0a6FjeyGXT?=
 =?us-ascii?Q?lQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zJF0Oo8hxxvJaRQYIDBCJ+YQYxfpJali3mhcmId6AWY5Tp3pxMQKN8LQYkK5?=
 =?us-ascii?Q?YogGQ6d547OWgiPgkZyCxxfeLqi8MEItjSN82ukTthBvL4qxSu9uqigYEocu?=
 =?us-ascii?Q?mTMlhmVF97ChI8zpD0NkQweOVkspHzH8STMLm1V0rxB9tscacuLMtXTks3vn?=
 =?us-ascii?Q?xQvswG03qWv1Fxb5kJWXeTIqnYpfyUt2nEqFYE6GC285rMchQzqTKq1RhzpC?=
 =?us-ascii?Q?K/wPWZ4nbkrgMMj+5281WH0Geqsska4AJwCIeJWQvJZ7/9X1LLVxDg0inXeA?=
 =?us-ascii?Q?UAh+yDmwEDxcWa/4yVQ+YNuKQDEmhjGiRpK/PhoSvDmxxrMeBSusnDuMalCL?=
 =?us-ascii?Q?Ob8pz8tl4WLKEKrvrcJVmOzg8QBuFVmWzfvrGBxonn7BJXy8QtV3OVJgeT6B?=
 =?us-ascii?Q?m+dhOrr9gSGXDPVyRC8wDq1BXADTrV1x46c2cSe/LItRXLq8WAMH0W1coq2b?=
 =?us-ascii?Q?oFGsUioDXlcyD+RlV+07v7ZiYcgBlkRZeBV/Pb6ASSgNnzxBiIRd+RM2r/Nk?=
 =?us-ascii?Q?px0Y7zmy1UvFfy/gssD/lizAQGywhXsfgJnYJbvMJpaSn40PGlSgYmc1wsDv?=
 =?us-ascii?Q?b2CJfIc18Dte6xImz9XMQPePBeyc/s5m4yq4qNkvE/Gm8cWcNjhuqPPkzdyE?=
 =?us-ascii?Q?XNbuVmU3sKWfU5YK4MlM4kekW8ysrTh2M6xBf1letbnfD0uNXu4yDrEuyRwT?=
 =?us-ascii?Q?SfKgrpTbZfjwVU69YJdg5kfrAMY2JEX8rixuFYq4jNL/jNGqoET+KU1/TDjg?=
 =?us-ascii?Q?JWzbIGLAN1WEosDpJ1x+nfz4rvZ3lGUJfRm59VhoDtYoPJhC6O5lSjDDSvBz?=
 =?us-ascii?Q?JdfYoQOrzGLr30vJHhaWqLu0VDvh8O3P1vCNGuJ1uZrUWY+MyGGc+TNejrVX?=
 =?us-ascii?Q?JZ3KfIEWWpKtDlMldkAexyrDc0DdOJU5oJplGim7MoWQx2DvLVU8Z2obEt1W?=
 =?us-ascii?Q?LXmK/mRWGWFD+vmdpg6aRDY3T0iv68YNU+l4tJHP7P6r3Fav0mhOvvsrZ1Vq?=
 =?us-ascii?Q?uBNbWah37zASaACHsQmGTVDzsLtip+8a9DTxwhhFbNHw+Y0SPvBIHDzvouli?=
 =?us-ascii?Q?JV5m9JETwqpdHveHys/GUjZ2leiiYIVHltAlFiC024U4tbR1Ttzjldroo+I1?=
 =?us-ascii?Q?TWv73cTfB69u+mLvLDED6+1mrPSZDqOhNv3+KujLGGTcyX06JSWtQlalsyu8?=
 =?us-ascii?Q?FlcigvhgWHkAT/UBAsuRrCEW4L0Htfv9OPGaxQ1gO46pyV3vqE5YmGtoA5M2?=
 =?us-ascii?Q?NpAe+lHpw+nDQx6fuRlsn54n0TAO1fm1OSyHTl9azHCVfGa5Nc2HqA6S3Bjh?=
 =?us-ascii?Q?/KzwpOOZkJLUj0ie7FIdLcW1oNrlxpBNfRV+QTxM7/jfejRMWIEMKqcSDWsH?=
 =?us-ascii?Q?wLQ9Pe6LOJIcN2ehhbG3PR9uL5lijnI9WTokGypX/DbU4AeiKBis9nk63Jl2?=
 =?us-ascii?Q?zWQyR1Dl2dndoxKgUDZ5x1hRB5zd77/rMkzXkcOIaXME3VMogQIfA5e2bkX4?=
 =?us-ascii?Q?ybR9yCvzxnFy+5GZwWur83VVDzPlVvAnzbinVM6E716NW6FKHVbolG9hbJxx?=
 =?us-ascii?Q?oC/+I7KuZmHhTQ85ZnPGak8cZR66AxM3K3Ojd8nSSnrv/kh6rkUCwhWwvTkr?=
 =?us-ascii?Q?xbhn788SZajU9YM/tcEk3RFKsRjn8pCV47OD06NN8mJobOsnQ0jzLs4+MJYj?=
 =?us-ascii?Q?QZAVpNOhArh2HARuQKDgU8toNHrj+Vhi30K59CMaBl5Qym20NEhn3n/0fI78?=
 =?us-ascii?Q?m8FGXBiIKA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a3b064-2bfd-414b-c80e-08de6f300e02
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:55:32.0209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSHoj/0jvOYMMKoUWSs4fmjqoFJhzoej7hcFjg0QDekOSJ0bacfkYGmReetXWrC8PdORNcy/9ZEd+lH7tS8oNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,intel.com,amd.com,ursulin.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 970BF1599C9
X-Rspamd-Action: no action

Move the DRM buddy allocator one level up so that it can be used by GPU
drivers (example, nova-core) that have usecases other than DRM (such as
VFIO vGPU support). Modify the API, structures and Kconfigs to use
"gpu_buddy" terminology. Adapt the drivers and tests to use the new API.

The commit cannot be split due to bisectability, however no functional
change is intended. Verified by running K-UNIT tests and build tested
various configurations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
[airlied: I've split this into two so git can find copies easier.
I've also just nuked drm_random library, that stuff needs to be done
elsewhere and only the buddy tests seem to be using it].
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 Documentation/gpu/drm-mm.rst                                | 6 +++---
 drivers/gpu/Makefile                                        | 2 +-
 drivers/gpu/{drm/drm_buddy.c => buddy.c}                    | 2 +-
 drivers/gpu/drm/Kconfig                                     | 4 ----
 drivers/gpu/drm/Kconfig.debug                               | 1 -
 drivers/gpu/drm/Makefile                                    | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h                | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c                     | 2 +-
 drivers/gpu/drm/i915/i915_scatterlist.c                     | 2 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c               | 2 +-
 drivers/gpu/drm/tests/Makefile                              | 1 -
 drivers/gpu/drm/tests/drm_exec_test.c                       | 2 --
 drivers/gpu/drm/tests/drm_mm_test.c                         | 2 --
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h                | 2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h                  | 2 +-
 drivers/gpu/tests/Makefile                                  | 4 ++++
 .../{drm/tests/drm_buddy_test.c => tests/gpu_buddy_test.c}  | 4 ++--
 drivers/gpu/{drm/lib/drm_random.c => tests/gpu_random.c}    | 2 +-
 drivers/gpu/{drm/lib/drm_random.h => tests/gpu_random.h}    | 0
 include/{drm/drm_buddy.h => linux/gpu_buddy.h}              | 0
 20 files changed, 19 insertions(+), 26 deletions(-)
 rename drivers/gpu/{drm/drm_buddy.c => buddy.c} (99%)
 create mode 100644 drivers/gpu/tests/Makefile
 rename drivers/gpu/{drm/tests/drm_buddy_test.c => tests/gpu_buddy_test.c} (99%)
 rename drivers/gpu/{drm/lib/drm_random.c => tests/gpu_random.c} (97%)
 rename drivers/gpu/{drm/lib/drm_random.h => tests/gpu_random.h} (100%)
 rename include/{drm/drm_buddy.h => linux/gpu_buddy.h} (100%)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index f22433470c76..ceee0e663237 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -526,10 +526,10 @@ DRM GPUVM Function References
 DRM Buddy Allocator
 ===================
 
-DRM Buddy Function References
------------------------------
+Buddy Allocator Function References (GPU buddy)
+-----------------------------------------------
 
-.. kernel-doc:: drivers/gpu/drm/drm_buddy.c
+.. kernel-doc:: drivers/gpu/buddy.c
    :export:
 
 DRM Cache Handling and Fast WC memcpy()
diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 36a54d456630..c5292ee2c852 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -2,7 +2,7 @@
 # drm/tegra depends on host1x, so if both drivers are built-in care must be
 # taken to initialize them in the correct order. Link order is the only way
 # to ensure this currently.
-obj-y			+= host1x/ drm/ vga/
+obj-y			+= host1x/ drm/ vga/ tests/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
 obj-$(CONFIG_NOVA_CORE)		+= nova-core/
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/buddy.c
similarity index 99%
rename from drivers/gpu/drm/drm_buddy.c
rename to drivers/gpu/buddy.c
index fd34d3755f7c..4cc63d961d26 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/buddy.c
@@ -10,7 +10,7 @@
 #include <linux/module.h>
 #include <linux/sizes.h>
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_print.h>
 
 enum drm_buddy_free_tree {
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d3d52310c9cc..ca2a2801e77f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -269,10 +269,6 @@ config DRM_SCHED
 config DRM_PANEL_BACKLIGHT_QUIRKS
 	tristate
 
-config DRM_LIB_RANDOM
-	bool
-	default n
-
 config DRM_PRIVACY_SCREEN
 	bool
 	default n
diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 05dc43c0b8c5..3b7886865335 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -69,7 +69,6 @@ config DRM_KUNIT_TEST
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KUNIT_TEST_HELPERS
-	select DRM_LIB_RANDOM
 	select DRM_SYSFB_HELPER
 	select PRIME_NUMBERS
 	default KUNIT_ALL_TESTS
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ec2c5ff82382..5c86bc908955 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -78,7 +78,6 @@ drm-$(CONFIG_DRM_CLIENT) += \
 	drm_client_event.o \
 	drm_client_modeset.o \
 	drm_client_sysrq.o
-drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
@@ -114,7 +113,7 @@ drm_gpusvm_helper-$(CONFIG_ZONE_DEVICE) += \
 
 obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
 
-obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
+obj-$(CONFIG_DRM_BUDDY) += ../buddy.o
 
 drm_dma_helper-y := drm_gem_dma_helper.o
 drm_dma_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_dma.o
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index 5f5fd9a911c2..874779618056 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -24,7 +24,7 @@
 #ifndef __AMDGPU_VRAM_MGR_H__
 #define __AMDGPU_VRAM_MGR_H__
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 
 struct amdgpu_vram_mgr {
 	struct ttm_resource_manager manager;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index f65fe86c02b5..eeda5daa544f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -5,7 +5,7 @@
 
 #include <linux/shmem_fs.h>
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 4d830740946d..30246f02bcfe 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -7,7 +7,7 @@
 #include "i915_scatterlist.h"
 #include "i915_ttm_buddy_manager.h"
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_mm.h>
 
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index d5c6e6605086..6b256d95badd 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -5,7 +5,7 @@
 
 #include <linux/slab.h>
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_bo.h>
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 87d5d5f9332a..d2e2e3d8349a 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_atomic_test.o \
 	drm_atomic_state_test.o \
 	drm_bridge_test.o \
-	drm_buddy_test.o \
 	drm_cmdline_parser_test.o \
 	drm_connector_test.o \
 	drm_damage_helper_test.o \
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 3a20c788c51f..2fc47f3b463b 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -16,8 +16,6 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_kunit_helpers.h>
 
-#include "../lib/drm_random.h"
-
 struct drm_exec_priv {
 	struct device *dev;
 	struct drm_device *drm;
diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index aec9eccdeae9..e24a619059d8 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -16,8 +16,6 @@
 #include <drm/drm_mm.h>
 #include <drm/drm_print.h>
 
-#include "../lib/drm_random.h"
-
 enum {
 	BEST,
 	BOTTOMUP,
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
index e4c95f86a467..96ea8c9aae34 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
@@ -5,7 +5,7 @@
 #ifndef TTM_MOCK_MANAGER_H
 #define TTM_MOCK_MANAGER_H
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 
 struct ttm_mock_manager {
 	struct ttm_resource_manager man;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index a71e14818ec2..babeec5511d9 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -6,7 +6,7 @@
 #ifndef _XE_TTM_VRAM_MGR_TYPES_H_
 #define _XE_TTM_VRAM_MGR_TYPES_H_
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 #include <drm/ttm/ttm_device.h>
 
 /**
diff --git a/drivers/gpu/tests/Makefile b/drivers/gpu/tests/Makefile
new file mode 100644
index 000000000000..8e7654e87d82
--- /dev/null
+++ b/drivers/gpu/tests/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+gpu_buddy_tests-y = gpu_buddy_test.o gpu_random.o
+obj-$(CONFIG_DRM_KUNIT_TEST) += gpu_buddy_tests.o
diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/tests/gpu_buddy_test.c
similarity index 99%
rename from drivers/gpu/drm/tests/drm_buddy_test.c
rename to drivers/gpu/tests/gpu_buddy_test.c
index e6f8459c6c54..b905932da990 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/tests/gpu_buddy_test.c
@@ -10,9 +10,9 @@
 #include <linux/sched/signal.h>
 #include <linux/sizes.h>
 
-#include <drm/drm_buddy.h>
+#include <linux/gpu_buddy.h>
 
-#include "../lib/drm_random.h"
+#include "gpu_random.h"
 
 static unsigned int random_seed;
 
diff --git a/drivers/gpu/drm/lib/drm_random.c b/drivers/gpu/tests/gpu_random.c
similarity index 97%
rename from drivers/gpu/drm/lib/drm_random.c
rename to drivers/gpu/tests/gpu_random.c
index 0e9dba1ef4af..ddd1f594b5d5 100644
--- a/drivers/gpu/drm/lib/drm_random.c
+++ b/drivers/gpu/tests/gpu_random.c
@@ -6,7 +6,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#include "drm_random.h"
+#include "gpu_random.h"
 
 u32 drm_prandom_u32_max_state(u32 ep_ro, struct rnd_state *state)
 {
diff --git a/drivers/gpu/drm/lib/drm_random.h b/drivers/gpu/tests/gpu_random.h
similarity index 100%
rename from drivers/gpu/drm/lib/drm_random.h
rename to drivers/gpu/tests/gpu_random.h
diff --git a/include/drm/drm_buddy.h b/include/linux/gpu_buddy.h
similarity index 100%
rename from include/drm/drm_buddy.h
rename to include/linux/gpu_buddy.h
-- 
2.34.1

