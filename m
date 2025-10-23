Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F677C013F7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 15:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CE910E8F7;
	Thu, 23 Oct 2025 13:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cDEmAHkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EED10E8F7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 13:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLpZ7D99qkDIbmmvCkEdFQZX8gikF9BRIbdnV/bF6EK8ekazUH6dgvh+vszqt6ytH58ZnlUvEK6UFpOeQ3C8F+P85Z7QTwB34vI4kYrZ0kYf5GzRxkfESz8ppGx+eB18ox+Bu1XVwDiqWQJkLPOuIQhmR9OFW6aTK62Usi2Qg7vwVSW058vTvk800/N8Xnze5cwZpavCJFboJ+ef7dUKZ4dmpZK72S4oS24B6NK2awLfGeIj9GjzdM1mUYQJw8up4OZalAyI1IG3G8t61eQy39tl6Bn3tFnY2cypIEIBFZnIXAy2sZtPxRtq6plxSFZ40X7XGkBorwxQGkXlv/7l6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPSOGJ3VSQsez/0U+ts/28gxwRlpAS+pvEOpWbxA5F4=;
 b=NvV1KMUe3HVD4CcXpbqcAKNOE75wypMVEXIizyUUd+pFtm/HCMOod/uBwemnODuFkG3laqfB/Svv91EvMTjfhYT9F87eHYSrRI0ioCPxaCeh1nib7fP3H3PTJ+jsPnVTrd0VCRsf5p7lOb+btvnteO71cZpAZ7Z4Ey0deqciqfcERC0rdB0eOHKNAeEXcBSglWJmLRqCkfaivi7MErmcyEZWLKv4civ+7Qe6qJ5RBfnI45yQHXjg7ZLlYHcogfsyG49avWldbdA5FwSfDBDOnU04pTpFHQTTua3oGd1XYz5BabgKbbDmzMB5cLG4XgNNCcT984d6sKNcihbHkyj+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPSOGJ3VSQsez/0U+ts/28gxwRlpAS+pvEOpWbxA5F4=;
 b=cDEmAHkJFhGCy0wGtTe9HRvbmoQnK/IFEfmmUeRLhoM4duaABeROJtBUx+sDJfzIKDeorLaOWdEXsobQoP6nC03lrj2iyhXxoPPyljH00TF5DjF0YgfgTlNF1UzGNEA43Aw95B+GwFBF0dMGXq9QEG1Rz9fvpkQqQuhcxdE+4Iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB14278.jpnprd01.prod.outlook.com (2603:1096:405:20f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 13:01:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 13:01:55 +0000
Date: Thu, 23 Oct 2025 15:01:35 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/display: bridge_connector: get/put the stored
 bridges: fix NULL pointer regression
Message-ID: <aPonL6Uhy9wlgS9-@tom-desktop>
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
X-ClientProxiedBy: FR2P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB14278:EE_
X-MS-Office365-Filtering-Correlation-Id: 78faef4d-4269-43fc-3def-08de123457fc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fdlyoi3Dzot9DCr4JJTALKYVtO8AzjxiFdLss0rsF39t0rMOLkjbCl8SZPf8?=
 =?us-ascii?Q?uSrIQRxtkayvU0o/SoiwgfsPcIvk4MyRmZxiMpzIkFJ6oarLihUdNlUNhhhg?=
 =?us-ascii?Q?nx46LImOsjY4fnq06dEbOdbxFdvealCovI7FudtZ2vNednkpfSJRTPQvXanW?=
 =?us-ascii?Q?OPCWZfZ5mayhmcOdwz2e5xShvsGVmlZfFnpugr6ucuaBsN23zBqcehuDocsu?=
 =?us-ascii?Q?78nGGExyhNUsj5/nq7ELS6IHICpUWa3BUw5tMNgWju/tg5j+Y/vDIEMb/RgK?=
 =?us-ascii?Q?KHcWCJnEmLH1ce6T8eq6P8e7eLIeZXRF0wC6kC+ObuJu2ZO77UDhLKAr3MTy?=
 =?us-ascii?Q?PDhrrNkaVsPoOk0WwGxEN6nW1BF9nn3VpfvbMr7vwg4hdrWjVfX3q9HQZhFO?=
 =?us-ascii?Q?Hr9GVDLLs9SdugrO8FQtFos85MZiQBLO9IoimZjHHYzaAiorqimy1Q0XTi8I?=
 =?us-ascii?Q?/9FSCWAABcLIAnz8JWp4nf9tIqDwE/A8vF7qd1IcFTMhToB67o6hxHHsdsLE?=
 =?us-ascii?Q?INhxQ8PdQVtN1tsUXOB8VyPb4KzuKoAC2VWnFkMFWF0JXapqK4jK0QSVElRj?=
 =?us-ascii?Q?gWMLmDIyEWhlVwAjrfLpChx8w3QoNcVk8Qi3abfaW9L/KtOQNkDAYMn+t/oB?=
 =?us-ascii?Q?q4Aen4iblaoETMYComBrMXQsGnZVgkeRvzD5Xzsxlgl+A3+BcWCOlCaD4BDY?=
 =?us-ascii?Q?i06l58jnsjrF8Kr3DnKsjBOchzNmRtciNaiiyFSfDu50sFEcschU+O8+pWOK?=
 =?us-ascii?Q?h5rHlAvybST5FRl0TzPSHm0niHFcCeplqOI3JmbEhccG0CIAA+FlNZ0GpgIh?=
 =?us-ascii?Q?QLX+ylK/8ufbklP8zVfO2UCvxgDpKLiMDgJiVYZhBHtJGeo8JC44g7qAP8JR?=
 =?us-ascii?Q?a0CGSZKoqST8gda3xaXgOSInzCTmLT3V5Rsn4VsbG+C8nTcPITs2WhfjzPFk?=
 =?us-ascii?Q?87VG1+vX5T3/5hX90BCvc33E7vARTDPlMg1+OIXYtkxoXh6kwPbbyo4U5uzH?=
 =?us-ascii?Q?sTF4Quev+pGq+MZAvpIYDGteHOgKMBuiwCYGC+Ca9cQoqjHMo+lai0Puy5UL?=
 =?us-ascii?Q?KU/HdYn+A1bmQz0ZlVXLx21q97Z+ZDL24Ax/oss6wrAcrvKDaREzvoEQJLC3?=
 =?us-ascii?Q?P+QJGv98Pt9zh2117ALfunM0pJfKkohbv2Qdg4C48/h6vEr77XDd5F7LNVQi?=
 =?us-ascii?Q?cUXxSrRCIKcQ7zgJYDune0xViE1xn6yGkKq8y5ySSyhA/mcSc+02hnj3IGhd?=
 =?us-ascii?Q?G0oJByA5bvxvWH+csv6hDB7Gtb+QzALywSRP1NwP1EVuB5Bz9+SRLLzCTzj/?=
 =?us-ascii?Q?7LDRrY0e07HHl5Kg4YQ9qF/O1U42sacOXNiEBk0bdpDaqUlnrBe5+MuTTZN/?=
 =?us-ascii?Q?uFKuKhakj4DLQQ/GqtI13NxaAFaGwol/511aRyDhMGGD9XhvZmtk54zrdnat?=
 =?us-ascii?Q?yplGbOP8lXnW/ve0oETnHPDNBi6R5YNuwIJPK2RTiGzAw9pNZsu3kLQyIEJw?=
 =?us-ascii?Q?UIeYjpS4FaD8IwfDdPSVdytnYbe5nQ6w7bRQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HeSgbPQu35vHPWK7+dO45vMP86w7RF+kiB19pzppasASiangxjDTt0gyrjvS?=
 =?us-ascii?Q?kecZM7gWWb4XAumOD0FRUDwCOgOc0s85Zt05GiBidm8foJV3FfJhu+aLzlM9?=
 =?us-ascii?Q?BKfxK3G26d3+Sfn6Whel6GG227wrFloTq4IECJPnnp//s4GLj30SOYZy+oBX?=
 =?us-ascii?Q?WnGkvH5xtp3SgX4mfAABb/WpdrncFTq32JUMI2qxGmJRBXWlYtObqWTbjIqU?=
 =?us-ascii?Q?dGjqN8cBKGEsH9Hk89W6XeX5HU3JKB9MRZpDFdONEzjJ6xaLkBizGbVOkXyE?=
 =?us-ascii?Q?fRAVaO5D3kqVMzl9CUQuTRsCCZDgPFqM0CzxCQyessW7VD/vGyWt3nRJVgvC?=
 =?us-ascii?Q?/woLWohRJeGj9EYOzrz3mTNnBmF8zJZGepK3DU/TbGVlF0na8FbTM/8mURcK?=
 =?us-ascii?Q?8FyYCsGeoP2upSovrkJNR78YO1wAj5a1fEmAC+Q9QyWZygE8sr3ZM/pqnhpq?=
 =?us-ascii?Q?oZGCtacNU7LLmFsy9lyQ7P8H9PMBmK+6nOOZfT9htmMGXp4mLTPXB+PXVrUl?=
 =?us-ascii?Q?RT5Pk5E1y4HJJuUb5QWl/ihMCtQ4658Qqy/cQzYA+kHqbnzsqM7/D2HdDD6+?=
 =?us-ascii?Q?Lm6476TkEijuqSbPtKE4UUeedu1HBieqbcxNnf7bIVd7NUSeR8t1GiHUFax7?=
 =?us-ascii?Q?7KODqS4ldDCi/BxAGLwZ1b2I9Gf+0f+83zKvq5AsyBU6sE7svot1NNovB0ZP?=
 =?us-ascii?Q?GoQW7dLR4RkLiv3BHIk2+u6k73RRoHnIqJctEc0G5P+NtFWeFzU4j5B0kk4e?=
 =?us-ascii?Q?+IqHi4jtaJs9H/yel0E3d5DQpTp3pL/WU/Rk5mjTC7hm3foFjc/fdW8n/wRH?=
 =?us-ascii?Q?47C8ydv99GA8AP2LnxKhDE3Zbasw0aRjaqwM/uAUktpmg/Gxak7dL5BhV2Bi?=
 =?us-ascii?Q?tJQ6a45EKNv7a4yxCAxbUVIMNXxEIKf5JqEk2enFmUZUblh4aCGrPiXPtTAJ?=
 =?us-ascii?Q?ZWKH5kjG7pjV1HeClvHGM6ohjpYx2o9U1eiiCi73s3cKTDUL23tCWmt6SE3u?=
 =?us-ascii?Q?W+GURu+0J/EZOKRJc3Pvmz8ZUvKmxKY0QckXtUNpyQon3wshhVUXgly98aZb?=
 =?us-ascii?Q?eyTmZ29SSV5kr17i/kgvUsg+VSvmXSYWcmQ+5TuuEuPukMSqVWb8t11lRbz7?=
 =?us-ascii?Q?aHdHlU2aZH1SIQqXVeGckuf6KTWPVd385AeOc6QBykRyK1Te8CdxeDtcrIVQ?=
 =?us-ascii?Q?Y7V9ZdzqXR+4Nh6zMa9BNAsRq2pL50vOd1PBQugLhuVElChL2Wsc/BiNHOwd?=
 =?us-ascii?Q?IawmTtd7UQkverFQWA270GjxFRmNkTNlNw1+KveAgix/4ML+e3R+bdpw2vNj?=
 =?us-ascii?Q?MegeAGdO/vQ6oT0qrHsloEVzNwlCQhlzhvbpsr9HMAoYAAnGi502fA1voWrt?=
 =?us-ascii?Q?77D7z5aoAzVl7Z+PLqB3H2jnevMQMxFA2UzozRQMSyxDv0ny63afpoDViGLX?=
 =?us-ascii?Q?5gTNAZSAFbLweHj0fUdc57ihoGZTCP9gtxR6Cvk9khTKW7hRfX3kx40JCPDQ?=
 =?us-ascii?Q?TPdJazFVPwffWiyrwjyd+fKoVLSf9yPBLXsFBmwsMQ5v/96YLy2RyhosQ1Tp?=
 =?us-ascii?Q?aLOY7dn46X5y6eFVc4DwLTv1Z8MC7S5ae9cwUs06cCuwX4TDehuDmNiLeCA+?=
 =?us-ascii?Q?i5KODq0adYEni0aAdAKduxU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78faef4d-4269-43fc-3def-08de123457fc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:01:55.8924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eg/uilLo7019ddbE0Jsqknii82iCN8SaXYMSG6H7LkSCt21jahJzyNTAaRCCejmLqIdu76iu8VmOBLqF57himdvKJP/FQ+YIP85iQnNMtYNmc+Hf11DGRJf664sssdux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14278
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

Hi Luca,

Thank you for your patch!

On Fri, Oct 17, 2025 at 06:15:03PM +0200, Luca Ceresoli wrote:
> A patch of mine recently merged in drm-misc-next [1] has a NULL pointer
> deref regression (reported here [2] and here [3]). Being in lack of a quick
> fix, I sent a revert proposal [4].
> 
> The revert proposal has no answers currenty, and in the meanwhile I have a
> patch that implements the original idea but without the same bug. So here's
> a v2 series with:
> 
>  - the same revert patch
>  - the original patch but rewritten without the same bug (and even simpler)
> 
> Also the re-written patch is now split in two for clarity because it was
> doing two somewhat different things.
> 
> [1] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> [2] https://lore.kernel.org/lkml/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com/
> [3] https://lore.kernel.org/lkml/CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com/
> 

Tested on RZ/G3E board using DSI output.
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks & Regards,
Tommaso

> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Changes in v2:
> - No changes to the revert patch
> - Added the (corrected) patch introducing the same feature as the original
>   buggy patch, and also split it in two fir clarity
> - Link to v1: https://lore.kernel.org/r/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com
> 
> ---
> Luca Ceresoli (3):
>       Revert "drm/display: bridge_connector: get/put the stored bridges"
>       drm/display: bridge_connector: get/put the stored bridges
>       drm/display: bridge_connector: get/put the panel_bridge
> 
>  drivers/gpu/drm/display/drm_bridge_connector.c | 92 +++++++++++---------------
>  1 file changed, 39 insertions(+), 53 deletions(-)
> ---
> base-commit: 84a0a3f014cda68ff10b8517d09e9f0c1cd942a2
> change-id: 20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-9a429ddb48e2
> 
> Best regards,
> -- 
> Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
