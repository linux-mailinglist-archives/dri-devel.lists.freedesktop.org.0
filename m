Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBjyDsb8oGmqowQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 03:09:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B11B1DA7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 03:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8B110E0D7;
	Fri, 27 Feb 2026 02:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwoHyCZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953E410E0D7;
 Fri, 27 Feb 2026 02:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772158145; x=1803694145;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XBkfCs0Y5sBXenRmacI4OKzlvfVfmuDkTveINeTIsac=;
 b=LwoHyCZRwQlpeGrQsVlUPRhMeB40CkXynsfLeosFkmCMVYe8bA1fQfOU
 olFx00stGam0yx0reg2994V03lsYe5JlZBthQ7U7zu+Y8Iz4vnAlukYL8
 g4ZgtcfUrEUt0WS3OTewl+y4IaXfQ/5Jz5+2fI4BekhY8v/OtHA3hOiUL
 e/lWy5JoSZmvdb80I7jXcD19QeRVJEjacX1c6MXDE6fhA6big+QSNN6bR
 dCI707USDOBLF6Iz5IMBeMWF8TdlAgGsET1VXBUG4DeMnG9GF8L9zwnVI
 Cr4kF6p9LfVRY0VJXhCfWQ/4apRFQC3e6qSk7bOx/0xhE9wvIdqovtapQ g==;
X-CSE-ConnectionGUID: 7uog+evQQqe2bHKxyMBBCw==
X-CSE-MsgGUID: nG5oyodQTPilC+0zwl1kcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72939785"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="72939785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 18:09:04 -0800
X-CSE-ConnectionGUID: uEkm03rzTjGomGikEafypA==
X-CSE-MsgGUID: LumtwMUOSDGZlcJYqrvtaw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 18:09:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 18:09:03 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 18:09:03 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.55)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 18:09:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lY35Zh46/irxzWciu6GwU81OhI7uavP4PRsGPtibXz/FbZyOauhver7r0a4QMpRj2KtHlEHB+GhiKTSuiFDAevdOi3ZOe9oZk8GdM8UCmKLyq+IUeYxablZfQpl/JinN42Bpk7T+OSjq2pXrQ7C18JHWLvJxrF1FpmgDSsdrE4/2FbwrZHCM/4R+JRdh7Hrq5NAqaQISW6/KM4MVR0AWC6D6z5ixzzyK5m/AEUR1U1vTATaUcHz5u1PTQ77D7H+aA0bhbE0twrECLn9NBJF7cblEuqtJI87eaSs5rvrddXm67Gyk/r/IkAEJdFZmsUWRdOzbYdDDiAGcgyzcqlfECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hB1+TADh/6VCXuhoDyS/E5/oChv8mKEKogJ18N6TsQ=;
 b=X37OjP6xkO85banbNUvCiUk3pk2CzRbB0dYmfJkoZwo7yHqryUvnryyKmu81+ke8kNpYmmBYkJYe/as+dXZT8xLT4dmYo8s/ZmR082p9ENS0YI+v3dwPbu12OSSDvsFm1z/EZljoKLCcqt9NpUr4neRcd6hjYpPpFU8ZUpSip5uvOmhxMAq/oQoampNN8Y412C+cs39tTEN0EZ6e3udQ7D/2ctX7ydXvLRULJvC9aBXyp6nH+Al0pm8Nbrqa8CGfl5EDcqy0JvMfIzAXGyBRKrle7BV7/+wPu9sUcDGX9MgrXcVandPSCWH5M5yN/2yKcdVn8afmY5kzCLwIusTNaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 02:09:00 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::804e:63d1:f2ce:7ce4]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::804e:63d1:f2ce:7ce4%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 02:09:00 +0000
Date: Fri, 27 Feb 2026 10:08:10 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Matthew Brost <matthew.brost@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <phasta@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Srinivasan
 Shanmugam" <srinivasan.shanmugam@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Asad Kamal <asad.kamal@amd.com>, Yang Wang
 <kevinyang.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou
 <tao.zhou1@amd.com>, Gangliang Xie <ganglxie@amd.com>, Candice Li
 <candice.li@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/7] drm/gpusvm: fix kernel-doc warning for
 drm_gpusvm_pages_valid_unlocked()
Message-ID: <aaD8is1OE05GuJxL@X299>
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-2-yujie.liu@intel.com>
 <aZ+4sZoTzX4C/P2T@lstrano-desk.jf.intel.com>
 <aZ_gjpylcgG7PxPL@X299>
 <c0323ccf-5c35-4dcb-a409-a1e63d157b19@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0323ccf-5c35-4dcb-a409-a1e63d157b19@amd.com>
X-ClientProxiedBy: TPYP295CA0058.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::9)
 To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: caf53e17-d55c-4396-a067-08de75a52bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 6zJ0VNo57KdWm5ucHKJkbnhpangpupmzzvzknqF739kaSrdLc1iIXo6nRi8BN5Q9WLIDDMdeZ/LXUeoGU/zm7Esa1uw0caI1zABfCpXPgTgLB9Ea0HZUxyDxWiFWGLly1yeEYHktxn0ebPIKxR5gnXp9yT8w1/luBle6weksGIrYQRLxGt+qrtFG2f4RcNgsdwzKKWzAV+L4RQWGjp25Gu7VEIVz+eapUJF7K7uA/mS52E+KhNHs3pGxnc4KqObr3l2ifvan0o5A/TBGaw1ABukyzVnVgBFz9kcgY6MFJbjdmLBZ8ouTQwIb+dqT2tKzKdewYxgfyASICuWnT0zGI+WtCf/GXh1S3dZfCazHScW3yWJIdAecvihFqFVWrpAa1bDW6SbMplIayOzYW+91OTa4sIovcL1n38s/2AVD4/Nck1bwV4GW/ZZKNiKxkH7BjR4BxkI+oVJyrJXJ98rfywrAmWFRzJDgC8YXFg+dmeU/cn71BYt0p0gMzgqKk2MKgSKD1J5U1tkm491UjX5T/C9Tc1IZkz9+BgQ2tRImz6YXk4HyVpFpcZgbqVXhSRY15npegv34kLnDzPcLwUASRxLSS5yUnzORT5uWc58vKV4aYzp6+RvPDPvSTYL3yFNcW8J/Jqc5qaUNnFVYdBA5XBay0p1gQn6aVhlXH+GPCOqHoRy0giKorVdcPjgmjSpOo3HfgAOK3WAsrlMNv/CnzdWsuXwTLEe1ENgU9+ngp04=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8393.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?F/gGhWmHKW+UhU6DiAepbCw1nJ+xbsea58TRMnrfymSRR1CeQ9dhoW2Et1?=
 =?iso-8859-1?Q?HvES5UWLghGlxI2B8DzPV3L3/3hoWM/anxqWtjB4FHLDMNl0jmvqM6Zp6U?=
 =?iso-8859-1?Q?83jcrvTH2m0ZwUtZmmBATNZFIibIKjvG7zaXe6N19bhcOPSspp+ywKE3lx?=
 =?iso-8859-1?Q?DEkICMsL1Df3a0TGonGB0X80HJmGlsWOnsW1EEZeb0H7StcZxX93pM5FQJ?=
 =?iso-8859-1?Q?TcFYqmF8hUv8WWOEr++3ICGHtgWuLVwp0DeLzI2ZhRNcEo70RNONSc5hGF?=
 =?iso-8859-1?Q?RSMakJ6S09L/Z3MW3tnTs2K/Y9gpgD/T1ICCL87P83DX/ijujMkiABL1IU?=
 =?iso-8859-1?Q?GwfV5M0j2uD216USWFNwZHfESZGr+f7I2jQP8FPFkTTORuWTQGMjqdICk3?=
 =?iso-8859-1?Q?sJPCuuej2zCDOh4MQPAW/3SNVOO7nzEKGiouL0cp5Ha5iyUcjuaBQ8/ipP?=
 =?iso-8859-1?Q?GBgfDMPW1dkgXxKPjv+OnZNTTJuL+9Un/IRoLVOrvxkDCxgMHveJ5OBjUN?=
 =?iso-8859-1?Q?OAY5rVjAjEEag6QzOE+5/XhYHGCY9s/rIvGIPxbfHoQ1uauZkXopC+YoIl?=
 =?iso-8859-1?Q?f5lJ71T4/moB1eRVu+r43IA55ay1kKHRxfzuwXt9yWeENWkAeYiW6eZjFU?=
 =?iso-8859-1?Q?un8rVuziLK4GWw3W1Su9N/iNZiZkW1NwlwMgy6/qqANjDFso16MbrtAtaX?=
 =?iso-8859-1?Q?aSVbp+m7ZW4kt39MOK9cXcd2H5ew/3ksj0nfFOQuZZdG56KYW/pEMxngAG?=
 =?iso-8859-1?Q?hsfiQ7fO4EHZEpdG68iZF8dE8MJhQrmw4ik5fAmgmWOAtTcTdijVXA4yJk?=
 =?iso-8859-1?Q?HG+MFYJMWpWeYLfnIkeXu2kbFlqDQ3pWcSwX3xuaLxoRN9ARr+MrT65SVm?=
 =?iso-8859-1?Q?K+1cPJU0vi8g33BJdpj5IAJjrEG2sz7FgHPFsQ68ircV6x3Wwn/3h1aaYP?=
 =?iso-8859-1?Q?+ImAmHAwYr3Ko4EicVpbHihmREf+g+sSYMfHAkCHjztP4Y6ohRB6/x0DCP?=
 =?iso-8859-1?Q?V5b8ewiS1Qjqkl2fDYuOyoyrFQu+8yjEf+MwwdgiPs27cmXpem56RdB98z?=
 =?iso-8859-1?Q?oF7WH73Phd1M39cN3lKQDn+2v5zivlV0OhVrrQGyBhA7mbUOw4AC2Z8fWH?=
 =?iso-8859-1?Q?jp+pVJYuQrMJLt1puh2eX1jiylREdaHnXfEw7Nj2w5NhlFrK4o179FEcLi?=
 =?iso-8859-1?Q?Lqpb7oQXav8C4vNHs8oLTQWOGM6z4t9w8qMt0jWciqAeTcXw8XVZgUZQnn?=
 =?iso-8859-1?Q?04RevoFL2bT3vGQAaBnXx/eYIi+jl6nqV0hDr1w1jM6RskYSoOIjA0P+QB?=
 =?iso-8859-1?Q?ErvaZV5K/yW4tmcUOtcWIkj0siy52Zny0mZJ1AwWia7JZ8ascU+LA4DGAm?=
 =?iso-8859-1?Q?xvV++2QUdIJ/6rZ86yqMSyLZFwhzPLc50npJzxezhfPbHr1EM6pnW8Efov?=
 =?iso-8859-1?Q?RjPScxoQ+KRo3HbqM4Qlk70FcR+DCOIaxLYodnT1XccJrzhDlbJ3A+bBPQ?=
 =?iso-8859-1?Q?pRNkab4DBouReRtlkXMRMyiJzh+mNW51ZlO4riGnqxonVhRhNleUbY9TUr?=
 =?iso-8859-1?Q?9gtBYknYlhAMyeeR5d6L6yH4CNCefAQ1NwGvKvG1KdWyZvX81iLyIcB0IA?=
 =?iso-8859-1?Q?oQtjp4zu+u1QUI5jwWYL5G1LKhrj46FagLH/eV9zVt6eW4jj1bq8STtXAw?=
 =?iso-8859-1?Q?+nCxd57r5xPDxyktQGPBlImyHPvTzJ7sR8y13Gq9PruyO4i5Kac3/OJ76x?=
 =?iso-8859-1?Q?PN0ye4KuU7wjC6+2SxyWlfm2ciJ+28SbYLXwjPwE9lCuABUMjNvNHoYyLR?=
 =?iso-8859-1?Q?DQckeDHVgA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caf53e17-d55c-4396-a067-08de75a52bc6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 02:09:00.0115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PE3zTmOddTdAQpOxvucHOyMMYURmIENFxnhln5nG8PIiQxcWxPoCVvjMSGsevXcGw3UPkuQSg0oZeaNFVXHgOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
X-OriginatorOrg: intel.com
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.834];
	FROM_NEQ_ENVFROM(0.00)[yujie.liu@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,igalia.com,lists.freedesktop.org,vger.kernel.org];
	REDIRECTOR_URL(0.00)[aka.ms];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 990B11B1DA7
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:39:01PM +0100, Christian König wrote:
> On 2/26/26 06:56, Yujie Liu wrote:
> > [Some people who received this message don't often get email from yujie.liu@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On Wed, Feb 25, 2026 at 07:06:25PM -0800, Matthew Brost wrote:
> >> On Thu, Feb 26, 2026 at 11:00:32AM +0800, Yujie Liu wrote:
> >>> Warning: drivers/gpu/drm/drm_gpusvm.c:1351 function parameter 'svm_pages' not described in 'drm_gpusvm_pages_valid_unlocked'
> >>> Warning: drivers/gpu/drm/drm_gpusvm.c:1351 expecting prototype for drm_gpusvm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid_unlocked() instead
> >>>
> >>> Fixes: 6364afd532bc ("drm/gpusvm: refactor core API to use pages struct")
> >>
> >> I fix this one already. Believe it merged yesterday.
> > 
> > Thanks. I will drop this patch and respin the series after waiting
> > briefly for possible comments on other patches.
> 
> I also strongly suggest to split that patch set up by driver/subsystem and send it out individually. So that we can upstream it through different branches.
> 
> When it is send out as one patch set then that usually indicates that in needs to be applied in that order. That is clearly not the case here, but it would be nice to have it separately in my inbox.

Thank you very much for the guidance. I'll keep this in mind and
carefully follow the rules and upstream workflow.

Since patch 1 and 5 have already been fixed, and patch 4, 6, 7 have been
picked up by Alex, I'll respin to send out patch 2 and 3 individually.

Best Regards,
Yujie
