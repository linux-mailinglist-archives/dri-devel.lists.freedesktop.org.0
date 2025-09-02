Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B62B3FE0E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F8C10E31F;
	Tue,  2 Sep 2025 11:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pvZLHngf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011046.outbound.protection.outlook.com
 [40.107.130.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B442E10E67E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iD+nH0W4cLVeGYE76L+caubPuwkiG1ZDWWkwYj9i2qzA+jv4FC7A/B9Jq7nPW+6F7PB+b5c66n+5f2dg1yN7d6PM/huGXNmhI0/RwS88FiWMn1Xem9MJmf70LGx91T0IkE6BLyKfvaIKYIAHQ+mwkn1lvhMM77dOrqp09Qci1vNAmRsEY9VgpM0vYuwwTOK58ZkVsAtI7AK6270shOHFWoraXx2IzJJuDdrfbZw4toaJePGRXIxmUunMmyFGwe17j04YOuUovTD/ethVoT0lrBx/yJCiPw7x1S0bQ8gYTuYC4DYosGdovwGxeV4YnBY78BZ50m54hLR877a9REZb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZ+7wlAanwIJv238h6c/oNkorR5v8RxUasRCgVS9dX0=;
 b=ue/JX4kg8YAZnLG7fPMMxKRov5MAPqT27X8b/oTjQbT2gptTifhAu1zGW1Zs4luIAvqeJTby+PpYBvXfO5DgxdKZffCIDE3c5UCX/D+7FXbYyI14L8bJOB78TChVKjzxu4r+so0Dnus7dSZ/MprmocHRagNX4ZWN6HqJ8XqfrtRTKJgyUU6hbQuTtrEshjlr/hS1Wnq7f687VXnIVpFpIn3lRskUrGiWJ+pw3HMGPWpY16xh3DmE36HXC8v4NiMFizjZ7vbV8Thqf7NaKR7yEwYKsF7dVI3HLwis/6WIpZo2J/Mo9iRpfY4N7ulb3tlwp8/3Emkqnm911nlnnOyXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZ+7wlAanwIJv238h6c/oNkorR5v8RxUasRCgVS9dX0=;
 b=pvZLHngfW/RaXuTVo3RtIMdB1vaL80S7KJdfkmuve8fR/hovyHsaa9f+BGXCAvvdMsIvjctnkSOeT43zOpYmOZhyfgy7Nc9Ucaavc2Bj6zmGabeAsFnQ5QD1VV9eMkGnKJ8CnMNLbnqNt2J803sp4R39hBW1EB4O8KqMlOiR+jeeIx8UTuaw1kcZtpkboqHWnmRZlSajveVXlFM8XAwAoRiX/w6Hv9e3vE3DnvHMCS0A/W50LRkvuS3NXstNq7Gi36upT4FwB8/YlcVyUP+1ztBNQwrB1RRuGXYHrXOq8hhOqMKGqOG/vfe0wP11YH+Dvj1PngK/Zl9DQ8yU9zEp9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by VI1PR04MB9787.eurprd04.prod.outlook.com (2603:10a6:800:1d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 11:45:19 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 11:45:18 +0000
Date: Tue, 2 Sep 2025 14:45:13 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 17/37] drm/imx-dcss: Switch to
 drm_atomic_get_new_crtc_state()
Message-ID: <5cujxtg4t5vq3d2n4fbaf2jxrshuj52szeinjfjzxbkmbrws3h@sox2vmzazoj4>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-17-de98fc5f6d66@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-drm-no-more-existing-state-v2-17-de98fc5f6d66@kernel.org>
X-ClientProxiedBy: AS4P189CA0068.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::23) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|VI1PR04MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cef2217-d98d-45cc-c4ee-08ddea16304c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|19092799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IPhG6Pf7rJJRinhZ1nDm76MjJb3UEZFNV2dagnF/ykE7AMA46qT3g+REGA1Y?=
 =?us-ascii?Q?VDu+0olfQhx00SWJGm2yFn17esZooKbUc1ooN3VdjmVSA2ySk4NV53Jiz0LR?=
 =?us-ascii?Q?QZ9lTJZc/hNa556B4HIYM0VaurXxrWtP4q4U1gylJxnM97YGl+snUfnHG5JX?=
 =?us-ascii?Q?JTb9oG1dPc/N2JKENe8kUlp2NAGbDPMpcLkJvAWEKBpI6ZkrCcGn/PDG6t0f?=
 =?us-ascii?Q?NKbidrZ3RkQ+yFtrv4nrRPcnWC/Qck3oc6SrBkpT/ARqDZXkAqpBp9P3D0Q0?=
 =?us-ascii?Q?MLWMHd5a8UkR+w4hSWigvfrCOjWwvg85P0nsNyQpm6bqMp3exgTANgntrub3?=
 =?us-ascii?Q?Y46tJcRsuuBXn20jMPtbpu3TfMZT1f8LE9E3/7IHDvNT0FiDKWHfAyaCH3xv?=
 =?us-ascii?Q?cD6If19rEyQnvCirYgz9hLOstcSvJT4QvsA2jgclnaOdgLeeajvbBOiUy5ZX?=
 =?us-ascii?Q?4X6Rc6p7mnV5sXu5ZunPlckaSeSaPUOidOmiZnuc+coqg+/fOBYMrjxM+l5/?=
 =?us-ascii?Q?TIKpwjUt/IpjuTEE7QNkec967uGZxuZc1LVMlv2iNIMgqzALcErXhw1LE0yv?=
 =?us-ascii?Q?VWYggPG6b9oiSi+HZzKpe1j+8tun6682vB/Zc+2+EDNHvlOtfB5afii6jml+?=
 =?us-ascii?Q?sEZxOYps81JWzOgA8TDc9kkkXOw3JJuueaiDDtRnSj6O1q0iZGdvnLN1M2Mj?=
 =?us-ascii?Q?gnPpFPluwIpxZWSYVPy0cxYbIM1T9yXKcGxO0S45LxRa23ZieIZNlG6uo/zT?=
 =?us-ascii?Q?u0FzpCQoF3M/mlIDSUF7RrvNk9SpwybEK6kgKHOtmMMTV1/MNiNfaUS7kBh9?=
 =?us-ascii?Q?v3Fr5gwhMyM37+8z7mjO4XgApj3WXQfFXzfBYQFSdKmaFYfnAw55VBCvrqtT?=
 =?us-ascii?Q?PJQ+AWlwkAkB3qY9Pzg+wo2qexSmwNGgk5crSVp1NRwAFcUN4knlsymvjgZx?=
 =?us-ascii?Q?ESK503c7M5hZDKROrvEiClyx7+Z+FzTdc4eKWbAW7pDX02yem+PgpEd+TD+G?=
 =?us-ascii?Q?FIz4BkgyGjO1DnVW5OlECYeNeLIkyWK7zXLwN7wG/u4lWWqiyAUoOdshg04j?=
 =?us-ascii?Q?/HfEUGSE1nEUbsTgvCiNmih51z/Nh3BBKldhWf8vXs7xO0kSOc9jCIcqQuls?=
 =?us-ascii?Q?7IvCDzwBMSjLN3qTz950HfBB9CEu4Fm80V3HXPRRkf41ZG6egKejhsIJRpf+?=
 =?us-ascii?Q?3Q/hKLM0r9hos8F5WSuLVQqcdw/yZMgBCOKSYWjrBpSCxykNy4efI+UCcsDC?=
 =?us-ascii?Q?1pG0dny3xwAcShgha1BtOzUIulWzyidg5rQsn+RSYhQ3aCARvGwTQM4ch1jb?=
 =?us-ascii?Q?sJ82Fhj8sixhlhHHHKUnerkELV3xnSojUTV3b3yRnke/tGxDMaMcKzs1w+Ix?=
 =?us-ascii?Q?KP59pdmm/oQVqRBqpMJlMtyhv5+3EGfQOtqBpF5MbXM9VEBnihfd2O6GavTI?=
 =?us-ascii?Q?9k86yN03giI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q+NFJfmySmqhX7MWl9xFpDUAMM555tEQJmNr2ZBGH7R2wtI0tm+6d7FdObEe?=
 =?us-ascii?Q?nvPjlgpRRgzKg+l27bia10hjSFL8hABNQ/xleDZhx1I2sXp+pgnA7A/zaMoJ?=
 =?us-ascii?Q?/6JjlwXla+o2gdibv0Wl5bpfIZpmYS9YQQm9t4war/RWB4E9RSNplqx82yyA?=
 =?us-ascii?Q?3yPVfBL9zvqax3w8IzIegZCL3h9VwettLcj9pVCjVzC4BmydLCS6hl7Gjptm?=
 =?us-ascii?Q?+kuz5KmYi8Zeu/8ae2td1pOB9Rd1OVefE7QZzPS9acRSiIHtd4tezzfXSPGW?=
 =?us-ascii?Q?k1e5B0veEjRdjb3VUSb1SYRNLggSPMtcacQXBHii+Jps0nHUKq5Ts35P/f6L?=
 =?us-ascii?Q?2BKd/ViJ0BF6oKJ5G9AcQd/H/q3iNblGya15NZqT5Xym2lFtWcGUfjDcT6z0?=
 =?us-ascii?Q?9qPfhTYufeh0pgafLAvnanbCtYhTeKLxdyKrVZL3gbGYJKFjkG4VNOS2+BDV?=
 =?us-ascii?Q?HaeJqiRLhBtlHKEgTlRXRfy8q8aWmBh3iSCthqhI+8xv3yEWn4S4spSrmRfW?=
 =?us-ascii?Q?tUBFNpIyiqynhzVG85xvPDcQjrK6I6ovuy6/68b50J5LRoJ0XNJP8t2xfPhc?=
 =?us-ascii?Q?QQECnJJOC4b7aK1LjKoDYh3XcL4KLozvqtpZ1LU9vThKGbn6Ktoc0ooXtoDb?=
 =?us-ascii?Q?mE88/kntpk//v4N+DSqE8Nt14YSiSRxn+VC5nkwhJPDHAFW1fk+9Suo40Nqi?=
 =?us-ascii?Q?0z5gkCyUgQi1bhhcOgiTOmDU4dO7LGDcuBLkL5OLhIGKFyBNxkH7O2OgGnGj?=
 =?us-ascii?Q?Egr/rvEnrdJY3lKk22J9CPwNpcvy1FCtKySu7GWHB5Pe8vG8TmrLVDA4m5Di?=
 =?us-ascii?Q?IqDRPPlxgE7nzjEl1J8+xMclOMV5c2y6sJTpQSvGGGPe/nztWIZnsQ6cekWL?=
 =?us-ascii?Q?7u4X1nbs9hjiBkpcTOHsVhepevqJnWxgiPNVjqDUcMYKFP647FiYH/jvPA1c?=
 =?us-ascii?Q?i1YwTPshArgVFRTL0XEwMg3Cbklmu3Yx9rczVKGqYxmA6xSzA1skb3ilNw1W?=
 =?us-ascii?Q?0/DQEQExe0HdhMXgcsTwlNm5/GeJax527tHJPPvXPwYgXw9YvcY/Ah7VLEXM?=
 =?us-ascii?Q?zlR6ShrGupTPRauyGrg07VfQy9AZq/3emM8hVorknxy6j7tAFQjmhvL+/iZy?=
 =?us-ascii?Q?MWNxOfZYN0i5W3frDNVjW7CbYcCzgcdxs1kvU9SCKWkpfTfvrz3qkmeUhlzm?=
 =?us-ascii?Q?VxMG0MmnwEYd96miaKZTgVg6j10OsuiU6Y3b7pbteL8PLFPa4Mpq/FQtWWXv?=
 =?us-ascii?Q?6md+ruMyCZo09ROJbv+SEvfE4ro2PBE3YQ6MPhoYVNu+bakpMRqaeigvAkzc?=
 =?us-ascii?Q?501gY2Wr4NMj8KVWAsIjFMHWaVwMIhWYdEpIidf2DGUJIeS7S0n3BThCCdxF?=
 =?us-ascii?Q?sndzNwYOI3JXuhzobv8yEGga62Trw7T1jpZetscpIqN4wMoOlUM1ff17Bc37?=
 =?us-ascii?Q?VZ/B3IhB5Tz5hnYtUCC40CBwsBnSdBl1go72BDla0kZCso0gdz3g5UChhpWe?=
 =?us-ascii?Q?vk9G0YADdb+qEWEJbXgTht3SVRS6D0U3yvUyOhlWPu6HMeAG0dyaREMEold6?=
 =?us-ascii?Q?FwhSYBW8qeviYBblZmMGwsH5oQ/H6Bac/wcimaGehI5uEchBU6hEqZoxiTve?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cef2217-d98d-45cc-c4ee-08ddea16304c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 11:45:18.2953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdAsq8h9i9C14XMvr9sldDDbezQMhFoM5HIZoJ49oTwQxyrsNrLwuqUMeb5Eim0Zobp8pQmtvCNmbHtoWw8Eaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9787
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

Hi Maxime,

On Tue, Sep 02, 2025 at 11:35:16AM +0200, Maxime Ripard wrote:
> The imx-dcss atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
Laurentiu
> 
> ---
> To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/imx/dcss/dcss-plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> index ab6d32bad756d080e1c56d7574403febceff94f4..3a063a53c8dfa6bc5bbbf9afc7ff6519199c2f19 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> @@ -157,12 +157,12 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
>  		return 0;
>  
>  	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
>  	WARN_ON(!dma_obj);
>  
> -	crtc_state = drm_atomic_get_existing_crtc_state(state,
> -							new_plane_state->crtc);
> +	crtc_state = drm_atomic_get_new_crtc_state(state,
> +						   new_plane_state->crtc);
>  
>  	hdisplay = crtc_state->adjusted_mode.hdisplay;
>  	vdisplay = crtc_state->adjusted_mode.vdisplay;
>  
>  	if (!dcss_plane_is_source_size_allowed(new_plane_state->src_w >> 16,
> 
> -- 
> 2.50.1
> 
