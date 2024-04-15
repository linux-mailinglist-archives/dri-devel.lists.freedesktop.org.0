Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE0B8A471F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 04:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5056C10F645;
	Mon, 15 Apr 2024 02:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rLaIgVX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A46810F645
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 02:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfg+L6UULEyfiPvHpC019PXyqMzE3+I9xqkcXfEDbWbeZABtHMRV8OC5qLIIIZl5S6g00bU+3zrkijxLgBRHaUekgGVwLT+AqL18OkIxDPrdPRMTnlEjDO9Ictq2oKggZMkeCl4FkHGaWwG4NHt3AmlZmO4bAzrXwfwa0eWVOpNNj0hmozs5ZUa54rJiqYdxnNNLgpVAA6wrboIyLVqp7HURgMBA8okX6/3bo+ja4yDae2cGjs2qS2KSwW2CaCziiKTiNul48LWB0OR2gCLJUReIBnRSCgBirxckAq9o3Xh1BBJZ//ThKcGaKjawZvu68rBsTzvKrq7hb/vmrMDWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7Ga2StHzT7WBG8qZLiEy3hqjb2+q+1StvHJOtGBKrw=;
 b=FhGrxgRC55M/3sFGU3PpzK95znGYV1xO/S/Tce3RIB3nQqhT90IfpBoGupYpDRGXbcDoC3so+g0KcprAv2E6r1cHCnjDOD3dk6WowPt3EKNp+mitA4tq9aSTtu3EZclOprkbmoL3SjjfW7hvjR+wv16Pz/4S12+dh8t0DrcAgxKjYtcso7jrNPIaHWRv3ADr5n1V6fZuHZuYIsL1G/yPjasZiGDDGC+h6RdKFb04fwrgoYMJvHxh9lJ7D65dNpL2meGitLlSPFald2f0XKTHgVk0+QWCnBaRlW3haMtDUqILBisUPunQrkHNT0AIZZxKMZHAUh77m7YoezmPAScNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7Ga2StHzT7WBG8qZLiEy3hqjb2+q+1StvHJOtGBKrw=;
 b=rLaIgVX50eshLwDmYWmKH9y5zA/i/JEiQiC7gzLvaitRPTgX/JXeT4D4DS5FWKa7MDDLKaNotImjlSjmxwgZGQnBW/6j5R0BbG92F8FyBxy3YG0DX3XJgZMxyb+bd0FHRq+jZsA6ZpGZ/yYHF6Dwj6u6MlkiYU5UJggiCYe4CT4=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.43; Mon, 15 Apr
 2024 02:53:24 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 02:53:24 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Jeff Mahoney <jeffm@suse.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference in
 drm_dp_add_payload_part2 (again)
Thread-Topic: [PATCH] drm/mst: Fix NULL pointer dereference in
 drm_dp_add_payload_part2 (again)
Thread-Index: AQHajToj/A4qJVKMkk+X0nDH4FXk6rFlYJwAgANEBBY=
Date: Mon, 15 Apr 2024 02:53:24 +0000
Message-ID: <CO6PR12MB5489C2D62025CDFDC71C3C21FC092@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240413002252.30780-1-jeffm@suse.com>
 <c55d8329-6d59-4821-89f2-6b50fa9dc6a7@suse.com>
In-Reply-To: <c55d8329-6d59-4821-89f2-6b50fa9dc6a7@suse.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-04-15T02:53:23.170Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|CH3PR12MB7692:EE_
x-ms-office365-filtering-correlation-id: 8aff853e-9ca5-4e5e-4898-08dc5cf737b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sSyjJmvAt1BIChb/rjl8pzT8XazPCc3A2VNJZZFoEljOMShU5R+oBt9QuNOoIltrmSHjy0Rrj+9K9xQVGH8mK0HEyI+9Smwn6DPY3dSmsW/R8MvYO0UMAT+HZ+kARy5EPgg0/JKHayVORioSnNM95xYzvYRpS7jxClhTPS1LSQKMiX+QJIDCcHZd4bIrMyHTXlcRqotEi+S8+3E006BHgj5reWNH+ZEwGQ/9n3FppFj2Q6kUhq1VcdjsDeN/uVdR/rFfbeH/EA5WVV/ZYPLXVbskEIzcoqoIL5YarUij7krn8dXweKUKa00CDDcEqDoIieBCYQ2Ec3ysYurY/9aKH316+FZD+AZMKyZF0rak5DwTTkLt3anpdP9EpaDcUA6TfwrV2I+pC4KzFuuRMiLirYeO5VOVwl7+g5NnqadoYWq5S/KS3bAZS6Cofriyow0uaKPVy0Uv33YB7TbPeOlkxYvTxA/aoKfUbBdhuA5iJuJ49L78Q7mMMuXcc8iQuujprG0ZkuoxetY/kDJVq9H9/ZuBFuZ9OarP0ZnkyF0kiItgpefYKOgQqZfNnwFuFWiBb//KIdVjB6J5QtlAMLyzWR5Tn9vVjvrGNMHHbc+dM3kAcTGJmwINMkaCR8SR9lg1d/H4PEeJSIa+/qU8leer5jFswaC1j4A+Lnn9lEcByAI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rWa7IyP6VoDmw1KwyP4UpZgPM5+tpOEtKA6B1hic1SyfbQ8hG5sKVPJh5y+o?=
 =?us-ascii?Q?LleKW3Ci9dfOUPKhMY3ACyrcQ5TGG1zMAajPsfDb1OrMpu1nUVQ7vQrq8H6Y?=
 =?us-ascii?Q?Tmem+op9fZ3os3NbBlYpthdX5Q7EnkOpERhBE3kWoy1Od5FTKEkDZjiEg4Xy?=
 =?us-ascii?Q?E9crc+6KlbG8zRCNtETuU9ffDUAL1L2GVRXmQ8eKB3XXTXW/3wLORPKNqNoN?=
 =?us-ascii?Q?0N0+yMWUHTpmz2mvZ/q/+/2uTQ8xchYnVGpACeZvmM7qimsIXV00K0noRIWi?=
 =?us-ascii?Q?IY2sDfVjGh/KgcLayWyfBm587aSIMT2AG9Rg5uS5O8uTQAR83zpGJPqnpqhK?=
 =?us-ascii?Q?62m6ni6O9LJoz7Ng0DxtzRFDI8Op4oiRBdO8OAVrdqhv6xHLmKDP89ANvxDu?=
 =?us-ascii?Q?SV0kGGLIjgzZ+2osOQe58ueGSxgAMAZLFrrNOrNnLMTpmt4GHUGoWPc94Ggf?=
 =?us-ascii?Q?9IcprPW9YSVK/TRTVw831HGMRqyKxu2mwFyd+5B6pqjjtDsQqdZ+ianYw5LI?=
 =?us-ascii?Q?rHIpj8wKPWIMVa0Ajn0/jyYwPxRc2TwZaXaWLXBtLdN3xQqyxEsv1vnKwjE0?=
 =?us-ascii?Q?WyrUIoNbSFPFcavwlRltkGIy4rTJfiPNuDvmbPmPRLkQnyC5/V6Um9Xz3xp6?=
 =?us-ascii?Q?eKJG3n6BZBZABQAReEcCUtF8k4dAoomWjQZPJAX8OlHa9CB07KbW9aVD7oai?=
 =?us-ascii?Q?GMEc9FU2lYIq1HSmV108Xb4bRX+uaWIiLueNEXUW64iuGSjKRC2UAnP/YGhB?=
 =?us-ascii?Q?4n1ktibZJfyjR0pUtsOZk5C/U99vxT9XT9YURy3+gBazS+c6yhhI/srJElIF?=
 =?us-ascii?Q?AA0VhgPCjAr8VfgGQFmjzsPasHESvuR6BY8r0wbVBRLvf+UAoJTJS3ZoDIjz?=
 =?us-ascii?Q?5rkUOPlsYGKWA4UUiBTJgSQvgohZJv7LiM8/G/Xcy9R79cMntI0YBIUJ9HH+?=
 =?us-ascii?Q?2StsjRvfOldctA83SC4U/xvRx1LMqnQA+OybZ5Bz2ycC806ShKAkQ/ijg9z1?=
 =?us-ascii?Q?IA3nU8yhEmaaMfo95/F8Ha4/tr1HutWy52sVqjiTuJtwcS5UtNGSxlDseQ01?=
 =?us-ascii?Q?6/2xi/qdZH1X9NLfBw5KXAYl2uf+IWaZM9qXj5Iz+xzlAfwMWk88BNw2R97E?=
 =?us-ascii?Q?02dumA2VFzVmVe4TuWqT52YGF++evKWNI/Gv66QPYjNXR5jlg2G5d7sTSiyn?=
 =?us-ascii?Q?thOmNIG9sGUMvp5Lny2l3v4whQ+hBHswFqu3nqf7oXuQxKivVL5+hkLn9qI/?=
 =?us-ascii?Q?0prHKJrtZtMDNPOzjlbmMehLE8PraEnBA4gpNz8IcsUWXfLa9CqYA6MQNdgg?=
 =?us-ascii?Q?ayygxsJhCbpmZTSxPheY3ukicDoJKhkXShC5DOCITXZgSEkvOOEwC24OCnYh?=
 =?us-ascii?Q?lwjXzzI+JiwbFf+c8vSCQAF1PuyamLdVIgKrUWiz+pBTmy+DT5inTGZ/x4ea?=
 =?us-ascii?Q?GLmUMDomC8Z96bXQXmNC8QbZIUG+GpPbNhsWkvTQodMKjkinFqG88Ai2sKci?=
 =?us-ascii?Q?YPdjBbi037wT2mjKyk4oMVATeRvXtJ7cWKY0SjjJ1Jsq8InLSmGgmyhEKXIy?=
 =?us-ascii?Q?7pQ2ar65Ndhv2W8efaM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aff853e-9ca5-4e5e-4898-08dc5cf737b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 02:53:24.1232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N+ma3X1Ll/anI2PAHGfu0Sb0/SIPRr5B03KJ6rY3EuKvUivk0NLnAO0HFS8OBBUyafgRM6z+67HSZvSAOFJkzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692
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

[Public]

Hi Jeff,

I have a patch sent for this before but not yet get reviewed. Will ping aga=
in.
https://patchwork.freedesktop.org/series/130852/

Thanks!

Regards,
Wayne

________________________________________
From: Jeff Mahoney <jeffm@suse.com>
Sent: Saturday, April 13, 2024 08:57
To: Lin, Wayne; dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org; David Airlie; Daniel Vetter; stable@vger.=
kernel.org
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference in drm_dp_add_pa=
yload_part2 (again)

As a follow up, I read through the original thread before sending this
and my understanding is that this message probably shouldn't be getting
printed in the first place.  I've turned on KMS, ATOMIC, STATE, and DP
debugging to see what shakes out.  I have a KVM on my desk that I use to
switch between systems fairly frequently.  I'm speculating that the
connecting and disconnecting is related, so I'm hopeful I can trigger it
quickly.

-Jeff

On 4/12/24 20:22, Jeff Mahoney wrote:
> Commit 54d217406afe (drm: use mgr->dev in drm_dbg_kms in
> drm_dp_add_payload_part2) appears to have been accidentially reverted as
> part of commit 5aa1dfcdf0a42 (drm/mst: Refactor the flow for payload
> allocation/removement).
>
> I've been seeing NULL pointer dereferences in drm_dp_add_payload_part2
> due to state->dev being NULL in the debug message printed if the payload
> allocation has failed.
>
> This commit restores mgr->dev to avoid the Oops.
>
> Fixes: 5aa1dfcdf0a42 ("drm/mst: Refactor the flow for payload allocation/=
removement")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> ---
>   drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 03d528209426..3dc966f25c0c 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3437,7 +3437,7 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topo=
logy_mgr *mgr,
>
>       /* Skip failed payloads */
>       if (payload->payload_allocation_status !=3D DRM_DP_MST_PAYLOAD_ALLO=
CATION_DFP) {
> -             drm_dbg_kms(state->dev, "Part 1 of payload creation for %s =
failed, skipping part 2\n",
> +             drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s fa=
iled, skipping part 2\n",
>                           payload->port->connector->name);
>               return -EIO;
>       }

--
Jeff Mahoney
VP Engineering, Linux Systems
