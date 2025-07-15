Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E8B0598D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0640E10E59C;
	Tue, 15 Jul 2025 12:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZLFlDf4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA25C10E59B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSXyIEbePtuJF8bSNaiFkrd4NGDlfahyIqX7lJ/ZTvXfAgm29j9/k8E5nTVyNDetVBrn+7JYbdb/xbK0l+FL2UPygI7Gnl6SPb3iUTNsDQQUAgQxl/lW/K6lvSfwxWwe/qLLFA+xJvQpsM0sXXRAMM6aSPg42gQYvXnkx++qOJaqxY5yZU/7HQYfp7UN4RdtcRBsi86cQc5ksaqf6tP63Sq8LkHAdePAwDhSSdCGUUQT/Fqn7pVN1phd5/YiaRRz+BF6xdm2BCwy5IDz/P8OMtmiTwKXVZpVe7JvYV7/uefcAb/PfokwGTV/3KaYC8YgR12dPn6EzAXWfo4Q/VkwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6+b3g4XDiTCgtS0lmzjFq3QmWv5TuAcBb/frxx+Wl8=;
 b=ohFyjUD4tEL14b3+Z2T+L3e8iGV4fYepYbNCWA8TmuqX4TrAX9ha5g/zCJ3LilqeTVYeowd7Ne6eKfNU3WcUnUBdYXZ1J7E5yOW++zfM9TBFRIBLX71RCo9kDppGIl583nu6eFVxThVWDIWCuxTj7XcEJkgOEFdgv/efAK9XAVfu9nvfoEPNGoYhsO0AuxAWpY76mOiUhxdhTVXJlvrtxkWrRCkJxiA2YhBkRTcSdm6vXUSEGYhPBZPt2Sa7q2V8CvdNLBxtnE+V9oknQm7SCLU+OiJXLyJl4OcdWzvVmH6fc5ofhpuJJqOVz9CMhpfaNZ3gtN2ZyIFSn5cn4FfqFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6+b3g4XDiTCgtS0lmzjFq3QmWv5TuAcBb/frxx+Wl8=;
 b=ZLFlDf4bBboPSO3oA/Azc+YgbM+MuPPy/8GXDvP5oSqLyw3ynYv7+X7DDnlsWc4tjMUSlalBzuyoGwlgnJQyrC9k9axl5j2Mzsq4uqgsz5TntPhdh2CNd1KpT+53x0zYbBnVDrlmgcHwnE97B2AMMkd4hS7ysb43p+qRc9UHn9w6RfbA35p4hRUSvUT883g0ikl3SQVSuH8SMeGduWX8nw7c4PNscbyFFIoXymmmllfPtwIZX9YUlnRV3yORn2cfco6ozSYQ5eHK//+qxG20lxDsA17m46A+o078SrmnjRXRmJBgeG7CyekCixu/XjajxhiI7qnfn1HZvkuFbg9jKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA1PR04MB10527.eurprd04.prod.outlook.com (2603:10a6:102:442::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 12:04:41 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 12:04:40 +0000
Date: Tue, 15 Jul 2025 15:04:36 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: imx@lists.linux.dev, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 Sandor Yu <sandor.yu@nxp.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] drm/imx: Add support for i.MX94 DCIF
Message-ID: <kwjdb72cvpsewi4xd2pff7heqlbnrlpze2kcsuzc3tubbkyjmz@xdzw22rx3gmt>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-7-laurentiu.palcu@oss.nxp.com>
 <aHCaoDzvevch5KNU@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHCaoDzvevch5KNU@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA1PR04MB10527:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aee27fa-ef42-46b9-bd53-08ddc397c72e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|19092799006; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hm4Gqaf1axPMPWyl3aBH8M+9zogZ6S3/0bWS+B8ruHMcTlhsqx4q9k9w4+G/?=
 =?us-ascii?Q?WxrHjn4flFdG+oE4muvXuxJ1g1N7lvSvTwbn61Od3Ledx7ptGqRqViGB+IEG?=
 =?us-ascii?Q?qUwg8U7fhQ1HGqkXy867TOWVg5HS4LkxwpjIR8ua9QqYUJs4o/vkSpj2nr4D?=
 =?us-ascii?Q?4npDbefCCyeBW/DKZF74hjJdx89T79J1/Gd+Pjrxp/aj/TZU/3R5ADXD5mgT?=
 =?us-ascii?Q?r/YgDLVdfJ1KumgVXPHciYVP9fmAby6gn2DORRjy7h1Flp1km1WCkxCDcHYa?=
 =?us-ascii?Q?QeKnt7JWao6N8Fjq9/UEjgZz8HRTe9nbuDjD6NsCIS3tP0F79g5cT+HWkiME?=
 =?us-ascii?Q?C8sNXNCpk7lg+70sV3iWSuu3IAqkz36l20GHwx5YGxo1Q2YvzoNjAKTv6iQb?=
 =?us-ascii?Q?JP6EKCMPXmFpulFffvETmUOX7y85Z3rdsiikIW8W6U4raWaAzval8mgiv/LJ?=
 =?us-ascii?Q?z69/ur1EhFURp18TEw96vJCAzxsYSXTpSMr6DlDd49dI1NWOvY4mncZ3EcFo?=
 =?us-ascii?Q?TwtiDwQCQWDQdeiHx1kf0tzYac0H6U1eDJA1epHANdmnsPXsoUNrIKqRXx8u?=
 =?us-ascii?Q?/nrukkxNsUoQA8YdjkMNurJli5FWQuakxPdHA/NVNKMD1oMiFDrte9Wb+UFx?=
 =?us-ascii?Q?YMB8+9VGoOASQsiams8+ro7VCQ1OdryhAbmgw9YjkhuUp0VZdSAz1zVmvHSf?=
 =?us-ascii?Q?Y2uknHS2RdKtl6qnuheW8faKZmYfEcULJDwpvgbjkS+MlTFVIqzN2YWd0lMg?=
 =?us-ascii?Q?YGJeqDnfLnBmSNScREp3DHugNrajx0KfiTqBO0hNqicMANZ8EIq0jeK4P9Q9?=
 =?us-ascii?Q?3frPNAAliy5B6WmF5zSFvhnekqTjnvu1BNUK5fz+3O3iii3wCSdz6Fu6J/L7?=
 =?us-ascii?Q?6I35YjqTKV+v7U/LpF+ArDoIq54a1ksGWzqqr+VkRJeUdC6IlRSP/hHEFTC1?=
 =?us-ascii?Q?w8IbXLf2c6ENZp5xpQCvBW1fLVqnES7Qqln0Aj2COKSdDJ5EOv3qXFRwdvb8?=
 =?us-ascii?Q?n88DNENAUKRGnUlZbLdyWQqWY8i1qibusHTkazTEEwUQ33FQyIQD/rU8yWGU?=
 =?us-ascii?Q?GPMzZ+1OR5YrK+hfbzgPuYaU/eUGF+ByGXRi0qRhJ1HFYwKKLZLSYYwS+7DL?=
 =?us-ascii?Q?yHFzDnlTWKPmDD2BO2/MzDYuZ7szywIGfDthRTuDmACYycnfqYsM48ccaL94?=
 =?us-ascii?Q?5Plwo+eSNhJJpEuPeXQq5D9N95btyro0G9aoRtzDnflMia4P/kKBJ7hanH68?=
 =?us-ascii?Q?d6g1ELeiitWccovvU8k0v/OyBG9vg/BSNWFkSHbQzY1f+sJqNiQxG5MIjipv?=
 =?us-ascii?Q?UEG0MbGwm0IXgNTTD4inYgVETkBs3tDpxUeh3xX8PDrBg6bxoXfKE2yUoV1w?=
 =?us-ascii?Q?uUmA8I5ugXjwEVehd14ad/coiWvJXMzAtOVK1gA7gZv55jHoSqd00ruxNAYW?=
 =?us-ascii?Q?/v4b2isSF/s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bDOWElHVccob5PvypnxmX2mRufRAedo9cTp93lqk7xGrHqteehSlZpB5DnLn?=
 =?us-ascii?Q?GrGBqfwqIhWMgoKpI5d+xfsc9pSZ9YIVMyxKKu8y8Xav5Agh74CxuvXqD0AT?=
 =?us-ascii?Q?bOd9wqMl7TMXwVbws4BBidLhlTupcvhYWAb/w+0Bwyp18TLCaK3W98awqXoV?=
 =?us-ascii?Q?QIQpA4/x5jxu4EgKT0qrtHA7zUssYnMRlW1XnfmC9rlB7q5/u3LJhWoQk9Ya?=
 =?us-ascii?Q?/HxEnoc6WX+RUI4gOJer8ugtoMk4MLYhafWDe7gqOcUDf3TOClfa/rHd5eQ8?=
 =?us-ascii?Q?zjFk5PzZEY3kNB89ytbgMqXnDef8m5ckAbDfFVfqcQl+fCehJqd2lq7CEt+U?=
 =?us-ascii?Q?iDiY7QRNPqXh7p4CWe5FaVO7NFQST+K5BM2O57bPFQqhTnXLAN3SuxpY4RNw?=
 =?us-ascii?Q?GcskhUlh8IzjUr6suIBVYbDxjvPVTM7K5/Twg7oopWsByv9/Gk/SsoNS00+N?=
 =?us-ascii?Q?RbxZI72a4/6I6lt5iBbFJNqUaWDN2vx/ky1UDPI5TmqJuy+C0USR5Uhdee4q?=
 =?us-ascii?Q?iwX7M5yt7kgZi2NJTxTOVR4ltKDuFuwgOKNah36f2OEiWLqivUGzAqHGHVJT?=
 =?us-ascii?Q?/oSqq+Xc3+cxCp1yL0p9QJu+J7KUmFH1Nzl++yOwMnySht58pvdMvK0DzwAK?=
 =?us-ascii?Q?GqYd4AifZx8KSt0a0Pkt+pGRqONAqdndaxwzy0Hjy3SBc7IoafJPc1AA0sn1?=
 =?us-ascii?Q?+rvYG1RnLLsLvk3eCtVqk9cCmO/q3h21LUMUA38IzvRqjgvNsPeRbtCs2FSi?=
 =?us-ascii?Q?/u1bdgu0bpoXdVw2KxcsLcSmNp5YCgW1W3I0VhFN/hxwWB5mDJ5grJLY5nJj?=
 =?us-ascii?Q?O+qLfaYd6HIxUOm8FRjWNXSoUFfCh/D2Qk3TUvlEFkNpAFOEfR3Ruv7AZzAx?=
 =?us-ascii?Q?eZaTyFLf/brtM/szVGw5KZiYdphMzYlCMrC7krLZnKPR1u8YsY73swSnR+/f?=
 =?us-ascii?Q?kGp+hHuHCzXL6QLgMwPpPD4eYqC0xqy77AvyG9f3vmfrV3ADhpg871KBcS4g?=
 =?us-ascii?Q?c3rpwXR1HwsCb0zCcXrpoGpZ5E34iQDm/Z18Xpxhwbtr2sTG19l/0zY1VuWC?=
 =?us-ascii?Q?V821ALiskuSDFTt8ei4gnuCpPFxDXAS695XQEVwJ/eb3kuQX+4P6UdGCx2J+?=
 =?us-ascii?Q?K9ZOUuvfPoIYSJQs2NbmV7vktjpPL7Ub1OmoxXe+nTJc3urm+B1b2atbYT/+?=
 =?us-ascii?Q?aN+mt1PqJhtzI36Tr5L71EgCguylyZ5Ew0wgoqMCMqPeq2EQ6iw7pFCvKKFc?=
 =?us-ascii?Q?ywQr9iO8f0481NOtp3sZAiYOKU/SSeACEeKoLIts/bPQB245UmADc5BO0wch?=
 =?us-ascii?Q?lWoPapeu6Op2yHLAQKmNWqL6XCISESt5NF55RpofZOIXHXv/+kovxs0weFyd?=
 =?us-ascii?Q?TTQdr3Kw020jyRuBUObGV7/5IsUvJmRza5l19QfroGlGYoCm6K6kLapLd2XE?=
 =?us-ascii?Q?R40MTyVeZJ0SM6e/F5JktxMOrH3hz2lGKIujs9qizuXsO1Ec/e9/eg1b+pRQ?=
 =?us-ascii?Q?PSjUdAbL0iSI94WlhfmvwG7aqgFUPNuISrYEDcCoRtNZjPwWSIUABxedvL8J?=
 =?us-ascii?Q?wQqy9VryQtLVt/1x1z+ewyC6pEj1aXfUywmXO74YYGdlh5wnCBe4paYe4iEf?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aee27fa-ef42-46b9-bd53-08ddc397c72e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 12:04:40.8839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yG7g2B94brLKAIHBhNiH0jH8wKnw4Net2vXWEn3JcfZECvPZGjHdlKAtfNr1U8SAoYZx9vZThw3KY2Lz6C13qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10527
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

Hi Frank,

On Fri, Jul 11, 2025 at 01:01:20AM -0400, Frank Li wrote:
> On Wed, Jul 09, 2025 at 03:23:25PM +0300, Laurentiu Palcu wrote:
> > From: Sandor Yu <sandor.yu@nxp.com>
> >
> > This patch adds support for the i.MX94 Display Control Interface.
> 
> Needn't word "this patch"
> 
> Can you list feature here?

I will add some more info about i.MX94 DCIF in commit message.

> 
> >
> > Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> ...
> > +static int
> > +dcif_crc_parse_source(const char *source_name, enum dcif_crc_source *s,
> > +		      struct drm_rect *roi)
> > +{
> > +	static const char roi_prefix[] = "roi:";
> > +
> > +	if (!source_name) {
> > +		*s = DCIF_CRC_SRC_NONE;
> > +	} else if (!strcmp(source_name, "auto")) {
> > +		*s = DCIF_CRC_SRC_FRAME;
> > +	} else if (strstarts(source_name, roi_prefix)) {
> > +		char *options, *opt;
> > +		int len = strlen(roi_prefix);
> > +		int params[4];
> > +		int i = 0, ret;
> > +
> > +		options = kstrdup(source_name + len, GFP_KERNEL);
> 
> where free options?

Good catch, I'll fix it.

> 
> > +
> > +		while ((opt = strsep(&options, ",")) != NULL) {
> > +			if (i > 3)
> > +				return -EINVAL;
> > +
> > +			ret = kstrtouint(opt, 10, &params[i]);
> > +			if (ret < 0)
> > +				return ret;
> > +
> > +			if (params[i] < 0)
> > +				return -EINVAL;
> > +
> > +			i++;
> > +		}
> ....
> > +	/* Perform an atomic commit to set the CRC source. */
> > +	drm_modeset_acquire_init(&ctx, 0);
> > +
> > +	state = drm_atomic_state_alloc(crtc->dev);
> > +	if (!state) {
> > +		ret = -ENOMEM;
> > +		goto unlock;
> > +	}
> > +
> > +	state->acquire_ctx = &ctx;
> > +
> > +retry:
> > +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> > +	if (!IS_ERR(crtc_state)) {
> > +		struct dcif_crtc_state *dcif_crtc_state;
> > +
> > +		dcif_crtc_state = to_dcif_crtc_state(crtc_state);
> > +
> > +		dcif_crtc_state->crc.source = source;
> > +		dcif_copy_roi(&roi, &dcif_crtc_state->crc.roi);
> > +
> > +		ret = drm_atomic_commit(state);
> > +	} else {
> > +		ret = PTR_ERR(crtc_state);
> > +	}
> > +
> > +	if (ret == -EDEADLK) {
> > +		drm_atomic_state_clear(state);
> > +		drm_modeset_backoff(&ctx);
> > +		goto retry;
> 
> Need max retry time, otherwise may dead loop here.

Calling both drm_atomic_state_clear() and drm_modeset_backoff() is meant
for deadlock avoidance.

> 
> > +	}
> > +
> > +	drm_atomic_state_put(state);
> > +
> > +unlock:
> > +	drm_modeset_drop_locks(&ctx);
> > +	drm_modeset_acquire_fini(&ctx);
> > +
> > +	return ret;
> > +}
> > +
> > diff --git a/drivers/gpu/drm/imx/dcif/dcif-crc.h b/drivers/gpu/drm/imx/dcif/dcif-crc.h
> > new file mode 100644
> > index 0000000000000..ea1b18362a344
> > --- /dev/null
> > +++ b/drivers/gpu/drm/imx/dcif/dcif-crc.h
> > @@ -0,0 +1,52 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> ....
> > +
> > +static void dcif_crtc_atomic_disable(struct drm_crtc *crtc,
> > +				     struct drm_atomic_state *state)
> > +{
> > +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> > +	struct dcif_crtc_state *dcif_crtc_state = to_dcif_crtc_state(crtc_state);
> > +	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
> > +	struct drm_device *drm = crtc->dev;
> > +
> > +	if (dcif->has_crc && dcif_crtc_state->crc.source != DCIF_CRC_SRC_NONE)
> > +		dcif_crtc_disable_crc_source(dcif, 0);
> > +
> > +	dcif_disable_controller(dcif);
> > +	dcif_disable_plane_panic(dcif);
> > +
> > +	drm_crtc_vblank_off(crtc);
> > +
> > +	pm_runtime_put_sync(drm->dev);
> > +
> > +	spin_lock_irq(&crtc->dev->event_lock);
> 
> suggest use scope_guard(spin_lock_irq)(&crtc->dev->event_lock)
> 
> check other place.

ok

> 
> > +	if (crtc->state->event && !crtc->state->active) {
> > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +		crtc->state->event = NULL;
> > +	}
> > +	spin_unlock_irq(&crtc->dev->event_lock);
> > +}
> > +
> ....
> > +
> > +static int dcif_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np = pdev->dev.of_node;
> > +	struct dcif_dev *dcif;
> > +	struct drm_device *drm;
> > +	int ret;
> > +	int i;
> > +
> > +	if (!pdev->dev.of_node)
> > +		return -ENODEV;
> > +
> > +	dcif = devm_drm_dev_alloc(&pdev->dev, &dcif_driver, struct dcif_dev, drm);
> > +	if (IS_ERR(dcif))
> > +		return PTR_ERR(dcif);
> > +
> > +	/* CPU 0 domain for interrupt control */
> > +	dcif->cpu_domain = DCIF_CPU_DOMAIN;
> > +
> > +	drm = &dcif->drm;
> > +	dev_set_drvdata(&pdev->dev, dcif);
> > +
> > +	dcif->reg_base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(dcif->reg_base))
> > +		return dev_err_probe(drm->dev, PTR_ERR(dcif->reg_base),
> > +				     "failed to get reg base\n");
> > +
> > +	dcif->irq[0] = platform_get_irq(pdev, 0);
> > +	if (dcif->irq[0] < 0)
> > +		return dev_err_probe(drm->dev, dcif->irq[0],
> > +				     "failed to get domain0 irq\n");
> > +
> > +	dcif->irq[1] = platform_get_irq(pdev, 1);
> > +	if (dcif->irq[1] < 0)
> > +		return dev_err_probe(drm->dev, dcif->irq[1],
> > +				     "failed to get domain1 irq\n");
> > +
> > +	dcif->irq[2] = platform_get_irq(pdev, 2);
> > +	if (dcif->irq[2] < 0)
> > +		return dev_err_probe(drm->dev, dcif->irq[2],
> > +				     "failed to get domain2 irq\n");
> 
> can you use loop for above 3 irqs.

sure, no problem. Good idea!

> 
> > +
> > +	dcif->blkctrl_regmap = syscon_regmap_lookup_by_phandle(np, "nxp,blk-ctrl");
> > +	if (IS_ERR(dcif->blkctrl_regmap))
> > +		return dev_err_probe(drm->dev, PTR_ERR(dcif->blkctrl_regmap),
> > +				     "failed to get blk-ctrl regmap\n");
> 
> You just set QOS value by blkctrl_regmap. Is it possible to set it blk-ctrl
> drivers? Or do it when power on the power domain to avoid use customer's
> syscon to other nodes.

The QoS is set in the resume() function already.

> 
> Frank
> 
> > +
> > +	dcif->regmap = devm_regmap_init_mmio(drm->dev, dcif->reg_base, &dcif_regmap_config);
> > +	if (IS_ERR(dcif->regmap))
> > +		return dev_err_probe(drm->dev, PTR_ERR(dcif->regmap),
> > +				     "failed to init DCIF regmap\n");
> > +
> > +	dcif->num_clks = ARRAY_SIZE(dcif_clks);
> > +	dcif->clks = devm_kcalloc(drm->dev, dcif->num_clks, sizeof(*dcif->clks), GFP_KERNEL);
> > +	if (!dcif->clks)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < dcif->num_clks; i++)
> > +		dcif->clks[i].id = dcif_clks[i];
> > +
> > +	ret = devm_clk_bulk_get(drm->dev, dcif->num_clks, dcif->clks);
> > +	if (ret)
> > +		return dev_err_probe(drm->dev, ret, "cannot get required clocks\n");
> > +
> > +	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
> > +	if (ret)
> > +		return dev_err_probe(drm->dev, ret, "failed to set dma mask and coherent\n");
> 
> When DMA_BIT_MASK(32) > 32, never return failure. Needn't check this
> return value.
> 
> > +
> > +	pm_runtime_enable(drm->dev);
> 
> devm_pm_runtime_enable()
> 
> > +
> > +	ret = devm_request_irq(drm->dev, dcif->irq[dcif->cpu_domain],
> > +			       dcif_irq_handler, 0, drm->driver->name, drm);
> > +	if (ret < 0) {
> > +		dev_err(drm->dev, "failed to install IRQ handler: %d\n", ret);
> > +		goto err_irq_install;
> > +	}
> > +
> > +	dcif_read_chip_info(dcif);
> > +
> > +	ret = dcif_kms_prepare(dcif);
> > +	if (ret)
> > +		goto err_irq_install;
> > +
> > +	ret = drm_dev_register(drm, 0);
> > +	if (ret) {
> > +		dev_err(drm->dev, "failed to register drm device: %d\n", ret);
> > +		goto err_register;
> > +	}
> > +
> > +	drm_client_setup(drm, NULL);
> > +
> > +	return 0;
> > +
> > +err_register:
> > +	drm_kms_helper_poll_fini(drm);
> 
> use devm_add_action_or_reset to avoid goto here.

I guess I'll just use drmm_kms_helper_poll_init() in the
dcif_kms_prepare() and that will take care of calling the fini()
callback when DRM device is destroyed.

> 
> > +err_irq_install:
> > +	pm_runtime_disable(drm->dev);
> > +	return ret;
> > +}
> > +
> > +static void dcif_remove(struct platform_device *pdev)
> > +{
> > +	struct dcif_dev *dcif = dev_get_drvdata(&pdev->dev);
> > +	struct drm_device *drm = &dcif->drm;
> > +
> > +	drm_dev_unregister(drm);
> > +
> > +	drm_kms_helper_poll_fini(drm);
> > +
> > +	drm_atomic_helper_shutdown(drm);
> > +
> > +	pm_runtime_disable(drm->dev);
> > +}
> > +
> > +static int dcif_runtime_suspend(struct device *dev)
> > +{
> > +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> > +
> > +	clk_bulk_disable_unprepare(dcif->num_clks, dcif->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static int dcif_runtime_resume(struct device *dev)
> > +{
> > +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = clk_bulk_prepare_enable(dcif->num_clks, dcif->clks);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = dcif_set_qos(dcif);
> > +	if (ret) {
> > +		clk_bulk_disable_unprepare(dcif->num_clks, dcif->clks);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int dcif_suspend(struct device *dev)
> > +{
> > +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = drm_mode_config_helper_suspend(&dcif->drm);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (pm_runtime_suspended(dev))
> > +		return 0;
> > +
> > +	return dcif_runtime_suspend(dev);
> > +}
> > +
> > +static int dcif_resume(struct device *dev)
> > +{
> > +	struct dcif_dev *dcif = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	if (!pm_runtime_suspended(dev)) {
> > +		ret = dcif_runtime_resume(dev);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	return drm_mode_config_helper_resume(&dcif->drm);
> > +}
> > +
> > +static const struct dev_pm_ops dcif_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(dcif_suspend, dcif_resume)
> > +	SET_RUNTIME_PM_OPS(dcif_runtime_suspend, dcif_runtime_resume, NULL)
> > +};
> > +
> > +static const struct of_device_id dcif_dt_ids[] = {
> > +	{ .compatible = "nxp,imx94-dcif", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dcif_dt_ids);
> > +
> > +static struct platform_driver dcif_platform_driver = {
> > +	.probe	= dcif_probe,
> > +	.remove	= dcif_remove,
> > +	.driver	= {
> > +		.name		= DRIVER_NAME,
> > +		.of_match_table	= dcif_dt_ids,
> > +		.pm		= pm_ptr(&dcif_pm_ops),
> > +	},
> > +};
> > +module_platform_driver(dcif_platform_driver);
> > +
> ...
> > + * Copyright 2025 NXP
> > + */
> > +#ifndef __DCIF_REG_H__
> > +#define __DCIF_REG_H__
> > +
> > +#include <linux/bits.h>
> > +
> > +/* Version ID Register */
> > +#define DCIF_VER				0x0
> > +
> > +/* Parameter Registers */
> > +#define DCIF_PAR_0				0x4
> > +#define DCIF_PAR_1				0x8
> > +
> > +/* Display Control and Parameter Registers */
> > +#define DCIF_DISP_CTRL				0x10
> > +#define DCIF_DISP_PAR				0x14
> > +#define DCIF_DISP_SIZE				0x18
> > +
> > +/* Display Status Registers */
> > +#define DCIF_DISP_SR0				0x1C
> > +#define DCIF_DISP_SR1				0x20
> > +
> > +/* Interrupt Enable and Status Registers, n=0-2*/
> > +#define DCIF_IE0(n)				(0x24 + (n) * 0x10000)
> > +#define DCIF_IS0(n)				(0x28 + (n) * 0x10000)
> > +#define DCIF_IE1(n)				(0x2C + (n) * 0x10000)
> > +#define DCIF_IS1(n)				(0x30 + (n) * 0x10000)
> > +
> > +/* DPI Control and Sync Parameter Registers */
> > +#define DCIF_DPI_CTRL				0x40
> > +#define DCIF_DPI_HSYN_PAR			0x44
> > +#define DCIF_DPI_VSYN_PAR			0x48
> > +#define DCIF_DPI_VSYN_HSYN_WIDTH		0x4C
> > +
> > +/* Control Descriptor Registers, n=0-1*/
> > +#define DCIF_CTRLDESC0(n)			(0x10000 + (n) * 0x10000)
> > +#define DCIF_CTRLDESC1(n)			(0x10004 + (n) * 0x10000)
> > +#define DCIF_CTRLDESC2(n)			(0x10008 + (n) * 0x10000)
> > +#define DCIF_CTRLDESC3(n)			(0x1000C + (n) * 0x10000)
> > +#define DCIF_CTRLDESC4(n)			(0x10010 + (n) * 0x10000)
> > +#define DCIF_CTRLDESC5(n)			(0x10014 + (n) * 0x10000)
> > +#define DCIF_CTRLDESC6(n)			(0x10018 + (n) * 0x10000)
> > +
> > +/* CLUT control Register */
> > +#define DCIF_CLUT_CTRL				0x1003C
> > +
> > +/* FIFO Panic Threshold Register, n=0-1 */
> > +#define DCIF_PANIC_THRES(n)			(0x10040 + (n) * 0x10000)
> > +
> > +/* Layer Status Register 0, n=0-1 */
> > +#define DCIF_LAYER_SR0(n)			(0x10044 + (n) * 0x10000)
> > +
> > +/* Color Space Conversion Control and Coefficient Registers for Layer 0 */
> > +#define DCIF_CSC_CTRL_L0			0x10050
> > +#define DCIF_CSC_COEF0_L0			0x10054
> > +#define DCIF_CSC_COEF1_L0			0x10058
> > +#define DCIF_CSC_COEF2_L0			0x1005C
> > +#define DCIF_CSC_COEF3_L0			0x10060
> > +#define DCIF_CSC_COEF4_L0			0x10064
> > +#define DCIF_CSC_COEF5_L0			0x10068
> > +
> > +/* CRC Control, Threshold, and Histogram Coefficient Registers */
> > +#define DCIF_CRC_CTRL				0x20100
> > +#define DCIF_CRC_THRES				0x20104
> > +#define DCIF_CRC_HIST_COEF			0x20108
> > +#define DCIF_CRC_ERR_CNT			0x2010C
> > +#define DCIF_CRC_SR				0x20110
> > +#define DCIF_CRC_HIST_CNT_B(n)			(0x20114 + (n) * 4)
> > +
> > +/* CRC Region Position, Size, Value, and Expected Value Registers, n=0-3 */
> > +#define DCIF_CRC_POS_R(n)			(0x20214 + (n) * 0x10)
> > +#define DCIF_CRC_SIZE_R(n)			(0x20218 + (n) * 0x10)
> > +#define DCIF_CRC_VAL_R(n)			(0x2021C + (n) * 0x10)
> > +#define DCIF_CRC_EXP_VAL_R(n)			(0x20220 + (n) * 0x10)
> > +
> > +/* VER - Version ID Register */
> > +#define DCIF_VER_GET_FEATURE(x)			FIELD_GET(GENMASK(15, 0), x)
> > +#define DCIF_VER_GET_MINOR(x)			FIELD_GET(GENMASK(23, 16), x)
> > +#define DCIF_VER_GET_MAJOR(x)			FIELD_GET(GENMASK(31, 24), x)
> 
> can you move it close register offset define.

ok, I'll move them.

Thanks,
Laurentiu

> 
> Frank
> 
> > +
> > +/* PAR_0 - Parameter Register 0 */
> > +#define DCIF_PAR_0_LAYER_NUM(x)			FIELD_PREP(GENMASK(3, 0), x)
> > +#define DCIF_PAR_0_DOMAIN_NUM(x)		FIELD_PREP(GENMASK(5, 4), x)
> > +#define DCIF_PAR_0_AXI_DATA_WIDTH(x)		FIELD_PREP(GENMASK(7, 6), x)
> > +#define DCIF_PAR_0_CLUT_RAM_NUM(x)		FIELD_PREP(GENMASK(11, 8), x)
> > +#define DCIF_PAR_0_CSC_NUM(x)			FIELD_PREP(GENMASK(13, 12), x)
> > +#define DCIF_PAR_0_CRC_REGION_NUM(x)		FIELD_PREP(GENMASK(18, 16), x)
> > +#define DCIF_PAR_0_BACKUP(x)			FIELD_PREP(GENMASK(31, 28), x)
> > +
> > +/* PAR_1 - Parameter Register 1 */
> > +#define DCIF_PAR_1_LAYER0_FIFO_SIZE(x)		FIELD_PREP(GENMASK(3, 0), x)
> > +#define DCIF_PAR_1_LAYER1_FIFO_SIZE(x)		FIELD_PREP(GENMASK(7, 4), x)
> > +
> > +/* DISP_CTRL - Display Control Register */
> > +#define DCIF_DISP_CTRL_DISP_ON			BIT(0)
> > +#define DCIF_DISP_CTRL_AXI_RD_HOLD		BIT(30)
> > +#define DCIF_DISP_CTRL_SW_RST			BIT(31)
> > +
> > +/* DISP_PAR - Display Parameter Register */
> > +#define DCIF_DISP_PAR_BGND_B(x)			FIELD_PREP(GENMASK(7, 0), x)
> > +#define DCIF_DISP_PAR_BGND_G(x)			FIELD_PREP(GENMASK(15, 8), x)
> > +#define DCIF_DISP_PAR_BGND_R(x)			FIELD_PREP(GENMASK(23, 16), x)
> > +
> > +/* DISP_SIZE - Display Size Register */
> > +#define DCIF_DISP_SIZE_DISP_WIDTH(x)		FIELD_PREP(GENMASK(11, 0), x)
> > +#define DCIF_DISP_SIZE_DISP_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
> > +
> > +/* DISP_SR0 - Display Status Register 0 */
> > +#define DCIF_DISP_SR0_AXI_RD_PEND(x)		FIELD_PREP(GENMASK(4, 0), x)
> > +#define DCIF_DISP_SR0_DPI_BUSY(x)		FIELD_PREP(GENMASK(14, 14), x)
> > +#define DCIF_DISP_SR0_AXI_RD_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
> > +#define DCIF_DISP_SR0_TXFIFO_CNT(x)		FIELD_PREP(GENMASK(23, 16), x)
> > +
> > +/* DISP_SR1 - Display Status Register 1 */
> > +#define DCIF_DISP_SR1_H_CNT(x)			FIELD_PREP(GENMASK(11, 0), x)
> > +#define DCIF_DISP_SR1_V_CNT(x)			FIELD_PREP(GENMASK(27, 16), x)
> > +
> > +/* INT0 - Interrupt Enable/Status  Register 0 for Domain 0/1/2 */
> > +#define DCIF_INT0_VSYNC				BIT(0)
> > +#define DCIF_INT0_UNDERRUN			BIT(1)
> > +#define DCIF_INT0_VS_BLANK			BIT(2)
> > +#define DCIF_INT0_HIST_DONE			BIT(5)
> > +#define DCIF_INT0_CRC_ERR			BIT(6)
> > +#define DCIF_INT0_CRC_ERR_SAT			BIT(7)
> > +
> > +/* INT1 - Interrupt Enable/Status Register 1 for Domain 0/1/2 */
> > +#define DCIF_INT1_FIFO_PANIC0			BIT(0)
> > +#define DCIF_INT1_FIFO_PANIC1			BIT(1)
> > +#define DCIF_INT1_DMA_ERR0			BIT(8)
> > +#define DCIF_INT1_DMA_ERR1			BIT(9)
> > +#define DCIF_INT1_DMA_DONE0			BIT(16)
> > +#define DCIF_INT1_DMA_DONE1			BIT(17)
> > +#define DCIF_INT1_FIFO_EMPTY0			BIT(24)
> > +#define DCIF_INT1_FIFO_EMPTY1			BIT(25)
> > +
> > +/* DPI_CTRL - DPI Control Register */
> > +#define DCIF_DPI_CTRL_HSYNC_POL_LOW		BIT(0)
> > +#define DCIF_DPI_CTRL_VSYNC_POL_LOW		BIT(1)
> > +#define DCIF_DPI_CTRL_DE_POL_LOW		BIT(2)
> > +#define DCIF_DPI_CTRL_PCLK_EDGE_FALLING		BIT(3)
> > +#define DCIF_DPI_CTRL_POL_MASK			GENMASK(3, 0)
> > +
> > +#define DCIF_DPI_CTRL_DATA_INV(x)		FIELD_PREP(GENMASK(4, 4), x)
> > +#define DCIF_DPI_CTRL_DEF_BGND_EN(x)		FIELD_PREP(GENMASK(5, 5), x)
> > +#define DCIF_DPI_CTRL_FETCH_OPT(x)		FIELD_PREP(GENMASK(9, 8), x)
> > +#define DCIF_DPI_CTRL_DISP_MODE(x)		FIELD_PREP(GENMASK(13, 12), x)
> > +#define DCIF_DPI_CTRL_DATA_PATTERN_MASK		GENMASK(18, 16)
> > +#define DCIF_DPI_CTRL_DATA_PATTERN(x)		FIELD_PREP(GENMASK(18, 16), x)
> > +#define PATTERN_RGB888				0
> > +#define PATTERN_RBG888				1
> > +#define PATTERN_GBR888				2
> > +#define PATTERN_GRB888				3
> > +#define PATTERN_BRG888				4
> > +#define PATTERN_BGR888				5
> > +#define PATTERN_RGB555				6
> > +#define PATTERN_RGB565				7
> > +
> > +/* DPI_HSYN_PAR - DPI Horizontal Sync Parameter Register */
> > +#define DCIF_DPI_HSYN_PAR_FP_H(x)		FIELD_PREP(GENMASK(11, 0), x)
> > +#define DCIF_DPI_HSYN_PAR_BP_H(x)		FIELD_PREP(GENMASK(27, 16), x)
> > +
> > +/* DPI_VSYN_PAR - DPI Vertical Sync Parameter Register */
> > +#define DCIF_DPI_VSYN_PAR_FP_V(x)		FIELD_PREP(GENMASK(11, 0), x)
> > +#define DCIF_DPI_VSYN_PAR_BP_V(x)		FIELD_PREP(GENMASK(27, 16), x)
> > +
> > +/* DPI_VSYN_HSYN_WIDTH - DPI Vertical and Horizontal Pulse Width Parameter Register */
> > +#define DCIF_DPI_VSYN_HSYN_WIDTH_PW_H(x)	FIELD_PREP(GENMASK(11, 0), x)
> > +#define DCIF_DPI_VSYN_HSYN_WIDTH_PW_V(x)	FIELD_PREP(GENMASK(27, 16), x)
> > +
> > +/* CTRLDESC0 - Control Descriptor Register 0 */
> > +#define DCIF_CTRLDESC0_AB_MODE(x)		FIELD_PREP(GENMASK(1, 0), x)
> > +#define ALPHA_EMBEDDED				0
> > +#define ALPHA_GLOBAL				1
> > +#define DCIF_CTRLDESC0_YUV_FORMAT_MASK		GENMASK(15, 14)
> > +#define DCIF_CTRLDESC0_YUV_FORMAT(x)		FIELD_PREP(GENMASK(15, 14), x)
> > +#define CTRLDESCL0_YUV_FORMAT_Y2VY1U		0x0
> > +#define CTRLDESCL0_YUV_FORMAT_Y2UY1V		0x1
> > +#define CTRLDESCL0_YUV_FORMAT_VY2UY1		0x2
> > +#define CTRLDESCL0_YUV_FORMAT_UY2VY1		0x3
> > +#define DCIF_CTRLDESC0_GLOBAL_ALPHA(x)		FIELD_PREP(GENMASK(23, 16), x)
> > +#define DCIF_CTRLDESC0_FORMAT_MASK		GENMASK(27, 24)
> > +#define DCIF_CTRLDESC0_FORMAT(x)		FIELD_PREP(GENMASK(27, 24), x)
> > +#define CTRLDESCL0_FORMAT_RGB565		0x4
> > +#define CTRLDESCL0_FORMAT_ARGB1555		0x5
> > +#define CTRLDESCL0_FORMAT_ARGB4444		0x6
> > +#define CTRLDESCL0_FORMAT_YCBCR422		0x7
> > +#define CTRLDESCL0_FORMAT_RGB888		0x8
> > +#define CTRLDESCL0_FORMAT_ARGB8888		0x9
> > +#define CTRLDESCL0_FORMAT_ABGR8888		0xa
> > +#define DCIF_CTRLDESC0_SHADOW_LOAD_EN		BIT(30)
> > +#define DCIF_CTRLDESC0_EN			BIT(31)
> > +
> > +/* CTRLDESC1 - Control Descriptor Register 1 */
> > +#define DCIF_CTRLDESC1_POSX(x)			FIELD_PREP(GENMASK(11, 0), x)
> > +#define DCIF_CTRLDESC1_POSY(x)			FIELD_PREP(GENMASK(27, 16), x)
> > +
> > +/* CTRLDESC2 - Control Descriptor Register */
> > +#define DCIF_CTRLDESC2_WIDTH(x)			FIELD_PREP(GENMASK(11, 0), x)
> > +#define DCIF_CTRLDESC2_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
> > +
> > +/* CTRLDESC3 - Control Descriptor Register 3 */
> > +#define DCIF_CTRLDESC3_PITCH(x)			FIELD_PREP(GENMASK(15, 0), x)
> > +#define DCIF_CTRLDESC3_T_SIZE(x)		FIELD_PREP(GENMASK(17, 16), x)
> > +#define DCIF_CTRLDESC3_P_SIZE(x)		FIELD_PREP(GENMASK(22, 20), x)
> > +
> > +/* CTRLDESC4 - Control Descriptor Register 4 */
> > +#define DCIF_CTRLDESC4_ADDR(x)FIELD_PREP(GENMASK(31, 0), x)
> > +
> > +/* CTRLDESC6 - Control Descriptor Register 6  */
> > +#define DCIF_CTRLDESC6_BCLR_B(x)		FIELD_PREP(GENMASK(7, 0), x)
> > +#define DCIF_CTRLDESC6_BCLR_G(x)		FIELD_PREP(GENMASK(15, 8), x)
> > +#define DCIF_CTRLDESC6_BCLR_R(x)		FIELD_PREP(GENMASK(23, 16), x)
> > +#define DCIF_CTRLDESC6_BCLR_A(x)		FIELD_PREP(GENMASK(31, 24), x)
> > +
> > +/* CLUT_CTRL - CLUT control Register */
> > +#define DCIF_CLUT_CTRL_CLUT0_SEL(x)		FIELD_PREP(GENMASK(0, 0), x)
> > +#define DCIF_CLUT_CTRL_CLUT1_SEL(x)		FIELD_PREP(GENMASK(3, 3), x)
> > +#define DCIF_CLUT_CTRL_CLUT_MUX(x)		FIELD_PREP(GENMASK(29, 28), x)
> > +#define DCIF_CLUT_CTRL_CLUT_SHADOW_LOAD_EN(x)	FIELD_PREP(GENMASK(31, 31), x)
> > +
> > +/* PANIC_THRES_L0 - FIFO Panic Threshold Register For Layer 0 */
> > +#define DCIF_PANIC_THRES_LOW_MASK		GENMASK(11, 0)
> > +#define DCIF_PANIC_THRES_LOW(x)			FIELD_PREP(GENMASK(11, 00), x)
> > +#define DCIF_PANIC_THRES_HIGH_MASK		GENMASK(27, 16)
> > +#define DCIF_PANIC_THRES_HIGH(x)		FIELD_PREP(GENMASK(27, 16), x)
> > +#define DCIF_PANIC_THRES_REQ_EN			BIT(31)
> > +#define PANIC0_THRES_MAX			511
> > +
> > +/* LAYER_SR0_L0 - Layer Status Register 0 for Layer 0 */
> > +#define DCIF_LAYER_SR0_L0_FIFO_CNT_MASK		GENMASK(9, 0)
> > +#define DCIF_LAYER_SR0_L0_FIFO_CNT(x)		FIELD_PREP(GENMASK(9, 0), x)
> > +
> > +/* CSC_CTRL_L0 - Color Space Conversion Control Register For Layer 0 */
> > +#define DCIF_CSC_CTRL_L0_CSC_EN			BIT(0)
> > +#define DCIF_CSC_CTRL_L0_CSC_MODE_YCBCR2RGB	BIT(1)
> > +
> > +/* CSC_COEF0_L0 - Color Space Conversion Coefficient Register 0 For Layer 0 */
> > +#define DCIF_CSC_COEF0_L0_A1(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
> > +#define DCIF_CSC_COEF0_L0_A2(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
> > +
> > +/* CSC_COEF1_L0 - Color Space Conversion Coefficient Register 1 For Layer 0 */
> > +#define DCIF_CSC_COEF1_L0_A3(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
> > +#define DCIF_CSC_COEF1_L0_B1(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
> > +
> > +/* CSC_COEF2_L0 - Color Space Conversion Coefficient Register 2 For Layer 0 */
> > +#define DCIF_CSC_COEF2_L0_B2(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
> > +#define DCIF_CSC_COEF2_L0_B3(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
> > +
> > +/* CSC_COEF3_L0 - Color Space Conversion Coefficient Register 3 For Layer 0 */
> > +#define DCIF_CSC_COEF3_L0_C1(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
> > +#define DCIF_CSC_COEF3_L0_C2(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
> > +
> > +/* CSC_COEF4_L0 - Color Space Conversion Coefficient Register 4 For Layer 0 */
> > +#define DCIF_CSC_COEF4_L0_C3(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
> > +#define DCIF_CSC_COEF4_L0_D1(x)			FIELD_PREP_CONST(GENMASK(24, 16), x)
> > +
> > +/* CSC_COEF5_L0 - Color Space Conversion Coefficient Register 5 For Layer 0 */
> > +#define DCIF_CSC_COEF5_L0_D2(x)			FIELD_PREP_CONST(GENMASK(8, 0), x)
> > +#define DCIF_CSC_COEF5_L0_D3(x)			FIELD_PREP_CONST(GENMASK(24, 16), x)
> > +
> > +/* CTRLDESC0_L1 - Control Descriptor Register 0 for Layer 1 */
> > +#define DCIF_CTRLDESC0_L1_AB_MODE_MASK		GENMASK(1, 0)
> > +#define DCIF_CTRLDESC0_L1_AB_MODE(x)		FIELD_PREP(GENMASK(1, 0), x)
> > +
> > +/* CRC_CTRL - CRC Control Register */
> > +#define DCIF_CRC_CTRL_CRC_EN(x)			(1 << (x))
> > +#define DCIF_CRC_CTRL_HIST_REGION_SEL(x)	FIELD_PREP(GENMASK(17, 16), x)
> > +#define DCIF_CRC_CTRL_HIST_MODE			BIT(21)
> > +#define DCIF_CRC_CTRL_HIST_TRIG			BIT(22)
> > +#define DCIF_CRC_CTRL_HIST_EN			BIT(23)
> > +#define DCIF_CRC_CTRL_CRC_MODE			BIT(28)
> > +#define DCIF_CRC_CTRL_CRC_TRIG			BIT(29)
> > +#define DCIF_CRC_CTRL_CRC_ERR_CNT_RST		BIT(30)
> > +#define DCIF_CRC_CTRL_CRC_SHADOW_LOAD_EN	BIT(31)
> > +
> > +/* CRC_THRES - CRC Threshold Register */
> > +#define DCIF_CRC_THRES_CRC_THRESHOLD_MASK	GENMASK(31, 0)
> > +#define DCIF_CRC_THRES_CRC_THRESHOLD(x)		FIELD_PREP(GENMASK(31, 0), x)
> > +
> > +/* CRC_HIST_COEF - CRC Region Histogram Coefficient Register */
> > +#define DCIF_CRC_HIST_COEF_HIST_WB_MASK		GENMASK(7, 0)
> > +#define DCIF_CRC_HIST_COEF_HIST_WB(x)		FIELD_PREP(GENMASK(7, 0), x)
> > +#define DCIF_CRC_HIST_COEF_HIST_WG_MASK		GENMASK(15, 8)
> > +#define DCIF_CRC_HIST_COEF_HIST_WG(x)		FIELD_PREP(GENMASK(15, 8), x)
> > +#define DCIF_CRC_HIST_COEF_HIST_WR_MASK		GENMASK(23, 16)
> > +#define DCIF_CRC_HIST_COEF_HIST_WR(x)		FIELD_PREP(GENMASK(23, 16), x)
> > +
> > +/* CRC_ERR_CNT - CRC Error Counter Register */
> > +#define DCIF_CRC_ERR_CNT_CRC_ERR_CNT_MASK	GENMASK(31, 0)
> > +#define DCIF_CRC_ERR_CNT_CRC_ERR_CNT(x)		FIELD_PREP(GENMASK(31, 0), x)
> > +
> > +/* CRC_SR - CRC Status Register */
> > +#define DCIF_CRC_SR_HIST_CNT_SAT_MASK		BIT(13)
> > +#define DCIF_CRC_SR_HIST_CNT_SAT(x)		FIELD_PREP(GENMASK(13, 13), x)
> > +#define DCIF_CRC_SR_HIST_SAT_MASK		BIT(14)
> > +#define DCIF_CRC_SR_HIST_SAT(x)			FIELD_PREP(GENMASK(14, 14), x)
> > +#define DCIF_CRC_SR_HIST_BUSY_MASK		BIT(15)
> > +#define DCIF_CRC_SR_HIST_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
> > +#define DCIF_CRC_SR_CRC_STATUS_MASK		BIT(31)
> > +#define DCIF_CRC_SR_CRC_STATUS(x)		FIELD_PREP(GENMASK(31, 31), x)
> > +
> > +/* CRC Region Histogram Counter Register For Bin n */
> > +#define DCIF_B_BIN_CNT_MASK			GENMASK(20, 0)
> > +#define DCIF_B_BIN_CNT(x)			FIELD_PREP(GENMASK(20, 0), x)
> > +
> > +/* CRC_POS - CRC Position Register */
> > +#define DCIF_CRC_POS_CRC_HOR_POS(x)		FIELD_PREP(GENMASK(11, 0), x)
> > +#define DCIF_CRC_POS_CRC_VER_POS(x)		FIELD_PREP(GENMASK(27, 16), x)
> > +
> > +/* CRC_SIZE - CRC Size Register */
> > +#define DCIF_CRC_SIZE_CRC_HOR_SIZE(x)		FIELD_PREP(GENMASK(11, 0), x)
> > +#define DCIF_CRC_SIZE_CRC_VER_SIZE(x)		FIELD_PREP(GENMASK(27, 16), x)
> > +
> > +/* CRC_VAL - CRC Value Register */
> > +#define DCIF_CRC_VAL_CRC_VAL_MASK		GENMASK(31, 0)
> > +#define DCIF_CRC_VAL_CRC_VAL(x)			FIELD_PREP(GENMASK(31, 0), x)
> > +
> > +/* CRC_EXP_VAL - CRC Expected Value Register */
> > +#define DCIF_CRC_EXP_VAL_CRC_EXP_VAL_MASK	GENMASK(31, 0)
> > +#define DCIF_CRC_EXP_VAL_CRC_EXP_VAL(x)		FIELD_PREP(GENMASK(31, 0), x)
> > +
> > +#endif /* __DCIF_REG_H__ */
> > --
> > 2.46.1
> >
