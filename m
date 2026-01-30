Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPmNGtOjfGmMOAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:28:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B405EBA832
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E1010E361;
	Fri, 30 Jan 2026 12:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="h5eWiktD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010006.outbound.protection.outlook.com [52.101.85.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADA310E361
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 12:27:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAF0iIum6eixUEwmD0AkH1OaEG18exxyFCXfuRJu9e79eaEcUjsPovrcxrVSP3h7n14dZOttY5xhnApEzwU1ubtwIj78jVuiwdW46sSTtMx+iNttPMdWaeyP5i4vzXe6+NI/uGyjrJ0uMnS4YT/uI0WLQ27Vz4OyS5cJVZy1qLrDW1g8ZxAanHPGa5X5skqwZKt2OlvwB+nT2DCnhzG7J+VzVWXyy4pCe0vSA6ItYE7jaieQ3rtx6ZDLykDKRyy3ffzvfrAeea33UFZ7WotfusTD0in1JJ5P5W6VnnfovLeuaj3Nv+XNna+9Xe+XuU3fBzI5TzWBOPxcmXOTtgbB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkZvl5mM0Cn/olqItnN8Af7f2wJF4gGCI8yx0fGdlw0=;
 b=dbDLWQo7L6ear0MgilorW4lFIjuTaTMHZgBZPeUsyMB2T4PZvtysdW0xDVpEG/v0pqOXIvpKEm0TcDxtExA0anutT6gwkXxT1U/W3HGao2xyeJ+uctRP3Wh+gxvnlKMoNaXFUMD4LVduJmYaTmSZv3+bUYdhVhhJcvxwRbEHXuCkzOQmOnXr9qdMoA+I62FLhCpBrpVUM0MyPE8l+NoQH1rTnXQRKkeqbgQcXEXctGiq/nmT+9YQHH9Q8jkeooxMjxDefUaCNkxVfjRIRph7efgtsvTHrXvmIV38BF2sLywmrHBH0r6YUysv99TGTh3lWzaFMHipy86vrb7nb0j5kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkZvl5mM0Cn/olqItnN8Af7f2wJF4gGCI8yx0fGdlw0=;
 b=h5eWiktDlvk/IRoITNQcHFz9rkf8eApyC88K9JnxeGzD01hACbcpU2wPKsLK2q2Kut969yxQ4eGU02b1jnGnnMtCFYJMFlwm//bfuoNrse2CAS6dwb54bJrNNW/0T3fj+J9iCWsJOIuk7Ka48LGBajilcI2+9uoBhsKjWvVdsEU=
Received: from BL1PR13CA0399.namprd13.prod.outlook.com (2603:10b6:208:2c2::14)
 by CO1PR10MB4676.namprd10.prod.outlook.com (2603:10b6:303:9e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 30 Jan
 2026 12:27:56 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::9c) by BL1PR13CA0399.outlook.office365.com
 (2603:10b6:208:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.2 via Frontend Transport; Fri,
 30 Jan 2026 12:27:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 12:27:55 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 06:27:54 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 06:27:54 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 06:27:54 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UCRsAZ1302946;
 Fri, 30 Jan 2026 06:27:54 -0600
Date: Fri, 30 Jan 2026 06:27:54 -0600
From: Nishanth Menon <nm@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: Swamil Jain <s-jain1@ti.com>, <jyri.sarha@iki.fi>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, 
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>, <mwalle@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: ti, am65x-dss: Add am62p dss
 compatible
Message-ID: <20260130122754.4ywqarmjzgnhih7f@recreate>
References: <20260116095406.2544565-1-s-jain1@ti.com>
 <20260116095406.2544565-2-s-jain1@ti.com>
 <462b3b7a-c228-456a-84bf-0e6103be61b7@ideasonboard.com>
 <5f0d509b-f1e4-44c8-80f4-74c3f4b61b28@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5f0d509b-f1e4-44c8-80f4-74c3f4b61b28@ideasonboard.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|CO1PR10MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc9917e-496a-4729-77d2-08de5ffaff2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?05wdAmSfkOaF/Gfag1OrzRGKD4SAcpf7S8HJMKm5OotdEtWOT/1MoZb10ior?=
 =?us-ascii?Q?Du5dDTXhdIDmThmog6JWNJBG7KcBwBA/TGKBHnLF2svLm7R18/mqpl5oZVn6?=
 =?us-ascii?Q?pAInLEf3PpDEhOTq+g9TbsVD5I0cKPkM/x0dRgDemutdMAItUYsY8ARdXwop?=
 =?us-ascii?Q?YIkRdxPrApmlHdpVFaUHv6XWLXkH2h/u3PkIZ5sX47piPjAWtup2rD8i7Duu?=
 =?us-ascii?Q?/4Qwp2/BLRSK3ferq3Ky/Yx+loMle0ZYPOS4KdjkKq/ckvRaGL6T03ZcqzC9?=
 =?us-ascii?Q?RHyfuw+FBdm3ukBpsM4ptrlB8uDdT5ir+GEi8Pytn5jtK2modzz+RqJt2EiR?=
 =?us-ascii?Q?oD/r8n8JYoMJAA9H88J+dmABBo3TPSDcoiA+l6RaN7EzHa9OuOAWu7JEHghL?=
 =?us-ascii?Q?lPPu2WW4T69xeymAFWkCboPMDji1oz9tqeCHeZoaldK9MC+1TeGm3GkAHYOt?=
 =?us-ascii?Q?/PKDfMlMIWbQZXNiUiOVy1rienNiZov4oBrfw8QDddpsdEp64ycxU1UQ34/i?=
 =?us-ascii?Q?RrvEKhpUsSWVDlRGjsrg6Q4oyfctcFclLSzfv9kXexD+t7CK0hR0jgsKT61g?=
 =?us-ascii?Q?++FZGVQwAT7yG/ZqnPbl89lSezlo7AMJmhezj/f6/vfiRn7kxzdGyRr3krX6?=
 =?us-ascii?Q?6uubJeyZvFESRMlUZrAHdfmc4breAb4H0lQw7lEN8zR7fZIpREeBWinvwGIv?=
 =?us-ascii?Q?otwPvuhcFF0GY9UpF1DRpIPec98dH2zKr2hrX3HzItvPgANJ2DWRygFRhb0i?=
 =?us-ascii?Q?07VgFIehP5ssf3YN+Jl87lJVw5qpxV1JBNyUfTgFA+0SQUosOuuVfTw3w5kD?=
 =?us-ascii?Q?nyU/kAHLkZv8MOB7d215HsMKVPk6LVvZM80F5bMUwoUQkHhoBV+lsKnyiDEa?=
 =?us-ascii?Q?p3U34UOURidSJ8Y7cYU0JJuxgfJwX4SQPLoef7JszGeFRpyOTY65yQjEk/a/?=
 =?us-ascii?Q?2n9zyMa+ZVtflbkKytjKJesU15xvKlylPln4/9DK3CISpK/6zXV1+T+S8cgA?=
 =?us-ascii?Q?B7owijD97hbfMff/0U+nVoKZnkjm48XKLpBL2ck5hI6T8MBOIA7LFymXNCYW?=
 =?us-ascii?Q?litoGRW031m6BiHyj/Fi+pVcgZrmE9pLVGZ0aG6TFplFJse7QS0FFcNVcmCc?=
 =?us-ascii?Q?cBPtyrY+SNQ1uEQF0T5UqQ2wiaSGBqVnKSprq/zBFh7Y5Pa6pgMaRu8IRbx6?=
 =?us-ascii?Q?5g29r/MjE0UcND+4PpalvqXyJJoJcxvDF81LU1NvYH5ZxzXM1s+4FzWrhy23?=
 =?us-ascii?Q?dwTTTwlRhmxsubaosllFRTEXGZG16ciLgEfg1nBqUt59+ngqPV94hH5jZArY?=
 =?us-ascii?Q?z7wtxTlm9lrNtQkJN1mJodASBEnNI7TkoSgKipwTVa2yKbqXDogo73jEBn3/?=
 =?us-ascii?Q?09Ffa2AvgC+ccbBbVTX3kVUI8ltrCGzzoCplJ+je3AY0wItwoDLe0b8tomnA?=
 =?us-ascii?Q?s4KHcF2fD7VwUc26oJF4YeQesmxAJAcbUbI3P3xv00J2p1bv3NQAoJuNPAHC?=
 =?us-ascii?Q?zrckpepssCpVfd2OXr9G6tWBMnEpU0QNjNKMPDOzSLzPeHs6shj4RWjugFJM?=
 =?us-ascii?Q?bfq8btO59wfcj9g4cuYJJBODaENSDYMuA0s0nXZDmIkb420x5X7cmZ9jlUHK?=
 =?us-ascii?Q?6gBjXYjuHv8MYADTJ/s34Gucwb+gUIBeXnYx1cS8bjxKKU46eY6f4X7cAmQp?=
 =?us-ascii?Q?OixPNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4EK7FkOupINvKZ5LZ+kngmKSb+32cgzx2ApZiQsJxJt3DeW9KfsRBKTOSD7To4dWq+ubOwez9qoKzu6ErBHu7C7RZ4P/Yw+Forq1JBauqPnjqeXanwFS04fC3HclFsc1V25zXGtmJ064zM+Qq8uvC26pM7FL4uQo5kUv4Qw7yLMljra1iWmsXACywWULZ1rqDokeH/1Lqvo25MQ5rEf0R//Y+Z0nJJ4vPi0PlRmue9q7UJ5DRabzbGEgzn/wp/Ci2c8Zqg0ODIGh6Ucj0Pu+yhVskp+vNje+B2/8W5sfu1PpPspuaw1eLbBa41eH7/ANL3lWwM7CwlwaLbB9VBLEtSQugyv2aBoYIZny1TToBj6Sx3h4tK9uJmABOYapAxvD0m7r8XTouajCl4ZgqzpKTGIxJAcxMCKE2IiuECxnbMG3chd4nRitPXlGbHOjAiQN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 12:27:55.9710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc9917e-496a-4729-77d2-08de5ffaff2e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4676
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
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[ti.com:s=selector1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[nm@ti.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:s-jain1@ti.com,m:jyri.sarha@iki.fi,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aradhya.bhatia@linux.dev,m:mwalle@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devarsht@ti.com,m:praneeth@ti.com,m:u-kumar1@ti.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,ti.com:email,0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DKIM_TRACE(0.00)[ti.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nm@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ti.com,iki.fi,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,linux.dev,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B405EBA832
X-Rspamd-Action: no action

On 14:00-20260130, Tomi Valkeinen wrote:
> Hi,
> 
> On 19/01/2026 12:10, Tomi Valkeinen wrote:
> > Hi,
> > 
> > On 16/01/2026 11:54, Swamil Jain wrote:
> >> TI's AM62P SoC contains two instances of the TI Keystone Display
> >> SubSystem (DSS), each with two video ports and two video planes. These
> >> instances support up to three independent video streams through OLDI,
> >> DPI, and DSI interfaces. The OLDI interfaces utilizes two OLDI
> >> transmitters OLDI0 and OLDI1.
> >>
> >> DSS0 (first instance) supports:
> >>  - With respect to OLDI Tx interfaces, DSS0 instance can either drive
> >>    both OLDI0 Tx and OLDI1 Tx together (e.g. dual link mode or clone
> >>    mode) or can only drive OLDI0 Tx in single link mode with OLDI1 being
> >>    utilized by DSS1 or left unused.
> >>  - DPI output from video port 2.
> >>
> >> DSS1 (second instance) supports:
> >>  - With respect to OLDI Tx interfaces, DSS1 instance can only drive
> >>    OLDI1 Tx given DSS0 is not utilizing that as described above.
> >>  - DSI controller output from video port 2.
> >>
> >> The two OLDI transmitters can be configured in clone mode to drive a
> >> pair of identical OLDI single-link displays. DPI outputs from
> >> DSS0 VP2, DSS1 VP1, and DSS1 VP2 are multiplexed, allowing only one
> >> DPI output at a time.
> >>
> >> Add the compatible string "ti,am62p-dss" and update related
> >> description accordingly.
> >>
> >> AM62P has different power domains for DSS and OLDI compared to other
> >> Keystone SoCs. DSS0 can have up to 3 power-domains for DSS0, OLDI0 and
> >> OLDI1, and DSS1 can have up to 2 power-domains for DSS1 and OLDI1.
> >>
> >> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> >> ---
> >>  .../bindings/display/ti/ti,am65x-dss.yaml     | 37 ++++++++++++++++++-
> >>  1 file changed, 35 insertions(+), 2 deletions(-)
> > I think we have a bad design issue here, and I don't know how to fix it.
> > 
> > The OLDIs have been a bit difficult to model, as they are not full
> > devices: they are not on a control bus, and don't have registers, yet
> > they need configuration. Part of the config is done via separate IO
> > controls with syscon, part of the config is done via DSS's registers.
> > It's not documented, but I assume the OLDI registers in the DSS IP are
> > wired somewhat directly to the OLDI IP.
> > 
> > So currently we just consider OLDIs to be part of the DSS. We do model
> > them as separate custom DSS child nodes in the DT, so that we can model
> > the pipelines correctly. For example, to support dual-link OLDI, we have
> > two OLDI TX nodes, which get their pixel stream from a single DSS port.
> > The power-domains for the OLDIs were just set as DSS power-domains, as
> > OLDIs were part of DSS in this design.
> > 
> > This felt perhaps slightly hacky, but it also made sense and allowed us
> > to model the HW.
> > 
> > Now, with AM62P, it gets a bit interesting. We have two independent DSS
> > IPs, each of which have two output ports, and we have two OLDI TX
> > instances. The OLDI TX instances are shared between the DSS instances,
> > and the first output port on both DSS can be muxed to an OLDI. The first
> > DSS can be connected to both OLDI TXes, the second DSS can be connected
> > only to the second OLDI.
> > 
> > This DSS application note has a bit more info and some pics:
> > https://www.ti.com/lit/pdf/sprads3
> > 
> > Now, both DSS instances have identical registers for configuring both
> > OLDI instances. This is not documented, but I'm guessing that when
> > configuring the clock muxes (the clock tree is also "interesting"), it
> > will also mux the configuration wires coming from the DSS instances. So
> > when you change the parent clocks for DSS & OLDI to be the right ones to
> > use, say, OLDI TX1 on DSS1, you also change where the OLDI configuration
> > is coming from.
> > 
> > So the OLDIs are now shared, and the configuration registers are
> > duplicated and routed based on clock setup (afaiu). Clearly the OLDIs
> > can not be considered being part of DSS0 or DSS1 anymore, nor can we set
> > the OLDI power-domains in the DSS node.
> > 
> > What this series does is that it adds three OLDI nodes, two for DSS0 (as
> > DSS0 can use either one or two OLDIs) and one for DSS1. And then,
> > depending on which OLDIs you happen to use, you're supposed to set the
> > DSS power-domains accordingly, so that the DSS being used for OLDI has
> > the necessary OLDI power-domains. And connect the media graph so that if
> > your panel uses OLDI TX1 with the DSS0, you connect to that OLDI DT
> > node, but if you use the same OLDI TX1 with the DSS1, you connect to
> > another OLDI DT node. I don't think that's right at all...
> > 
> > I don't right away have a good idea (well, not even a bad idea) how this
> > should be designed.
> I still don't have a binding-idea that I would be satisfied with, but I
> guess there's just no sensible way to represent this hardware. How to
> model an IP that has its control bus changing based on a clock mux...
> 
> I think one thing we can do is move the OLDI power-domains into the OLDI
> nodes. That feels like a more correct place for them. Earlier the OLDI
> PDs were in the DSS node, as the OLDI was considered an internal part of
> the DSS. But now that the OLDIs can move from one DSS to another, this
> "OLDI is part of a DSS" model doesn't work.
> 
> However, even if it looks fine on DT side, I wonder if this will cause
> problems on the Linux side: OLDI is not a device, so I guess we still
> need to associate those PDs somehow with the DSS device.
> 
> For the issue with the control bus, I don't see a solution, so I propose
> doing what the patch here does: The two OLDIs are represented by three
> OLDI nodes in the DT: OLDI TX0 and TX1 under DSS0, OLDI TX1 under DSS1.
> Only one of the TX1s should be enabled at a time, of course.
> 
> So the DT structure would be something like this:
> 
> dss0 {
>   power-domains = <dss0 pd>;
> 
>   ports {
>     ports for DSS videoports
>   };
> 
>   oldi-transmitters {
>     oldi0: oldi@0 {
>       power-domains = <oldi0 pd>;
>         ports {
>           ports for OLDI TX0
>         }
>     };
>     oldi1: oldi@1 {
>       power-domains = <oldi1 pd>;
>         ports {
>           ports for OLDI TX1
>         }
>     };
> };
> 
> dss1 {
>   power-domains = <dss1 pd>;
> 
>   ports {
>     ports for DSS videoports
>   };
> 
>   oldi-transmitters {
>     oldi1: oldi@1 {
>       power-domains = <oldi1 pd>;
>       ports {
>         ports for OLDI TX1
>       }
>     };
> };

I was discussing something similar on #devicetree yesterday:

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
index 8203ec5e5bb3..7902637587b4 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
@@ -29,6 +29,11 @@ properties:
   clock-names:
     const: serial
 
+  power-domains:
+    description: phandle to the associated OLDI power domain
+    items:
+      - description: OLDI power domain
+
   ti,companion-oldi:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
