Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F33139F5725
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 20:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB76A10E64C;
	Tue, 17 Dec 2024 19:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLfAg6Ae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB06110E649;
 Tue, 17 Dec 2024 19:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734464953; x=1766000953;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o/KTaCBmy/DuoPjWII/2DYIwWLKzJVYXhIN6CPZ7NaY=;
 b=gLfAg6AeJcU8hF+1k5kPDOIHFLVxViMF09yu+mmKIHKlEmgU85/3rYh/
 CT5DFlNDrWNhUZsPP0pWOBDUWTZ0j3jsnl4NEFjE/W01FT3PjTgbKzepM
 yNLChwsl6OGoc7gCyRgoaIN0bToWWYlZLZSoy7POUwFuXyfrLq0GVIPgD
 5bYr2OsYdaj4cUgMeAZTjGeQ5+b6wVijEIvSEOdzk3TLpeyRu0wO9GxLX
 TVZWfqbq1wWM1jdWOjSVQe40EKsd6Y6bUAA8UjPJXwTcfSlZVdb4uX/0D
 mpo95Gi/3C9yaFibBko0GQ8hlagM1NG1kbk0jF8/BWvfJr7lnl3l0xM6l w==;
X-CSE-ConnectionGUID: uuDw0EkNRTyHEQgDZxfU6A==
X-CSE-MsgGUID: mFFkowhbSPaSEDXnTS9GVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34788508"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34788508"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 11:49:12 -0800
X-CSE-ConnectionGUID: jXYmgTNGTVqHa3ZO4QjPuQ==
X-CSE-MsgGUID: /ZyTpYHTTiqd2RUOFz80Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="128444723"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 11:49:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 11:49:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 11:49:11 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 11:49:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQ/6scRM8z0ge5m3/SDn2ZmsXcKou7EdipfjzrraYW17RpjvxWlMFOuGqpuk4fJFdgTuk60cBOYpaIMlgMXuTkUDmxcfhxkAalFbNc7gjpmXVeTwVx5QQwDbbjrwuaYtfA4jhdcLIkN9vp0xPNvoimG0XZtf3ce09DhkkiAvfbSqWhMkxoz7CEbuW+zuMbfRbamZHtud2uvejDSubslgM4HHSUQl/Bihn5ax6J1qJx1ys2GLqDbRV+yRuT0RUvBZu9G/9pOF6Ly44SfvhWyEIKfvMyJygqDRxbI/NvyEkfj8wMPZAuCoT6bR8vL6S0dctJKC2IvKbkxZPVOD9JrHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQYFfXkFEnmrqQWYK9BIyhugAxr6bdRxHHHQxGTeSNI=;
 b=voZt2/X8ZocpqBfyt/tqit+4iM3tmc0RwGgI/v98Ziebeprm3jauxWpkLCkrPG+oHg+3F9F3li3kjFCZCJEN4jhiN3iEebFVVHy7si7Q0sMcgM9pML+IuGBt6bPs+pbVRGQR9lZYy6urSgnKQEmrItwpCh1FpB5zYEY0tNcKIL6aSpSp3W1UfO1yHDpl2izyXV+GFRXtkWkjRicCylrDZagZH3mz5Ldf5cLIv+3dg6SEMM7avZtGdawPkBjnw5cVb53REFxUupYoUfTD2TXy5QS7S4MPSD38qoQHOqSyfuYq9c3jj4le44BRkk28sBXuzEBPbTk512D0dJmHFco2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CH2PR11MB8816.namprd11.prod.outlook.com (2603:10b6:610:285::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 19:49:04 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 19:49:04 +0000
Date: Tue, 17 Dec 2024 14:48:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, "David E. Box" <david.e.box@linux.intel.com>
CC: Arnd Bergmann <arnd@kernel.org>, <michael.j.ruhl@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "David E. Box"
 <david.e.box@linux.intel.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/vsec: enforce CONFIG_INTEL_VSEC dependency
Message-ID: <Z2HVqlvldbgZhH-v@intel.com>
References: <20241217071852.2261858-1-arnd@kernel.org>
 <Z2HIW4c-S_IA9bWb@intel.com>
 <36bae0e6-9153-4cb4-9c85-8a582a47044b@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <36bae0e6-9153-4cb4-9c85-8a582a47044b@app.fastmail.com>
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CH2PR11MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: d21d4635-c0e4-48a9-9c38-08dd1ed3dc34
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wcyGWWvXe/GRMJWAnY+UfppSeVJjC2xYdqNMO9QGSu2gW/HdJjooVAEBwgE6?=
 =?us-ascii?Q?Y/gO3k5er2Oum8tbDlBlLUJmRI+mnK5pDHe7CdtV1wBBmuDk5yzvfRjPNEv/?=
 =?us-ascii?Q?GgumZYvJYtiVGDHaF7JKCfmgArJTG2iziDQxjn3972i5RjdAv0R3MgY3fLMy?=
 =?us-ascii?Q?zJ25y3wJGaGo9nfidPa+tBZOLfbT2+5BSGZFbm8l9An5Yj/W1M9I7qu67zpa?=
 =?us-ascii?Q?dwMt4KwcM8J8/D4DLqAsiucZRMeFRNHdoxEYkIivoubwjemFpw4dENQo6YjK?=
 =?us-ascii?Q?PZxlmPncEa4Nho2/PlXXh6dDTOPNYjSR+Dzu4pLkTRdKr/hQfNtO2Ls0EN4f?=
 =?us-ascii?Q?iMjcP28s+w4AXlHNVx31WlRUZeYWKiqFaOkHyBPQmTdIiTBC82UMboZtLukc?=
 =?us-ascii?Q?pmCsLWdDVx/3E4DbCIYGZNkqN61dbpxNeRoQfx/moYs8JbR2RpoQKIw9+O5R?=
 =?us-ascii?Q?3PigEP/oHJnOCNFAYULr4gf79PfUs7KXg9fkT8wJ2hUXGoUy9QL8bTCR5Xeh?=
 =?us-ascii?Q?KbCFVONkEdcNEiZLgr9UUGLuiZLwGo0ZzY88HKWAsX/MCJTozF7g+jJV+34w?=
 =?us-ascii?Q?MlijDw4usoELFYPJcpS+Kqe0yKRfY4QT1BiDhKiOGWnmRiVCDv6HB1IPBcH8?=
 =?us-ascii?Q?002BNg1C83nafXhbthRjs0sUh/XoMDp0qeORZAkLS8t4wM6D5gBg1Q8qI34p?=
 =?us-ascii?Q?WQmQYO6M0QAHE9bPfW3SuqNX+nk9CiiPUwY/chKghanyDirPAdxPDWkCqmbY?=
 =?us-ascii?Q?4gL2pdAoI1rWTzkXb+IAhlmBjWypky2K8eHLOpDMz+hWGJuizltKPFKeWODn?=
 =?us-ascii?Q?TTwbLH+UO7JB9p1Yij/OzoDYC0/BGEZ4Pr44857FQPp8gMK8PP2dxfzsDGXu?=
 =?us-ascii?Q?1nCUnff6Fz1CbJ0uGFLMjUHtdGfH65uun8N0W3Lx0ZwNY/WRl/pudquJ6p8k?=
 =?us-ascii?Q?iHdWayk+tTlTdrw2Z3UmvW7og3H8gZH8FbHNqeqg6cptcciq7oE0F8iDgg5K?=
 =?us-ascii?Q?eSNL26Rh1taGRyKMXQBc1QjiVXYm+USM2hTKtwuTwGaqYqtdBNDpSiQ45D6n?=
 =?us-ascii?Q?ce3wyr6Oslk3B5eYN4uU0gQqUc7upWn/IdWOwQJj6JaJJTvcSTm3qWGXmd9O?=
 =?us-ascii?Q?BCtw1tK91yVpCBWv5bwSMCK1rCat+BaMm1uNiQdjjCzaOvrFkbDSJdDTyzMz?=
 =?us-ascii?Q?f3KK+Qi6jECl/QrLyBExlY7pVVA+zd9uqCLR1lshLlkqyTbewva+9hZ7ltbP?=
 =?us-ascii?Q?7WrVdlPZPDJaR37Y0N1LiqAq4eBEZFpPTu4gtw6q+UXBtVKCR0jl3SoUdmOW?=
 =?us-ascii?Q?b2nL36RWqpukMvBWInoJyaZ56bGnpRQ2g2C+sUwDtW8B5apMpORl6kUsVcRj?=
 =?us-ascii?Q?YOkwMytdjZadae9U3r9P+jyGBDjY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LxF7zcb7CZHBoG5ku3B0eg9x0hWaMm6c7pwoz5hwH+4ZQo1EEr90yLpWF3O5?=
 =?us-ascii?Q?JdXPo/sRi+WYlGxM9tciDoCYHooVH526/zTu0s9PVjZ1Lzk0NY3RwXqQwLld?=
 =?us-ascii?Q?RFvFGdv9Qs0BIEzt+IwTEwl/Kbbx5up/jujfuhzRuWg1apU7I9LSXRMovQF/?=
 =?us-ascii?Q?KXnuytmqA05c+J41NzO0zvhyj8ZjslR0sV/70J/dwLJhjS+m6VkDmpYije8G?=
 =?us-ascii?Q?gkprkPZyEC5MqmPbaBTr/l330BW/HTBdk2LBcRuFcA3SWj0O0NdZ187QNNwt?=
 =?us-ascii?Q?j5Iq9HBYDkHc6zF/NbTC2YDXnXMcNuunP0maOxT15m3KrbfdsZYU+DJIhS9J?=
 =?us-ascii?Q?N1NevAPmGTNVB22OyO6reNG3+yOT1Skp5/GfHi5wSYpouM+XV7hiNYfhIJ5u?=
 =?us-ascii?Q?M0Kv/lX1DeUbh61L/0QyxaVhdHlWaNp5T+TX1/0SYYac+3UTZkWo5XGbrExM?=
 =?us-ascii?Q?rm47ggGYnXVVvFg1Par8oA3guEhWLEAGs6gkO7WfNvIoprpGBNA+9K1R32k3?=
 =?us-ascii?Q?RPkB9wxLMw1tBg424D8JHMhqMuKrgRZftRzO+U1nwCmgvsl82vH3XjKGSAGl?=
 =?us-ascii?Q?zGfs5C03Z1nrdibysvPMPTV0YcFcLWk5w2FM1D+t2vuciv7008w7ldcNGN20?=
 =?us-ascii?Q?hH9W6j/wrJcu5IJ1zM831EgoXvr4ho7QGMvcU9FJGizIWHrBYsORxfsSvi0W?=
 =?us-ascii?Q?3LN70VuZApWYcfVtd/nFaLMUXAa8nRFQud55R37c3EJ5lnbMDGeoEAuXezKh?=
 =?us-ascii?Q?AACxBXL+KMFgIpYBJnjUqXCGa3XOqKLDU9lcT65hGnpajuaJTcwDsB/kq7Q/?=
 =?us-ascii?Q?ChE9RvNpMsYD68WR7cRm52qHOZPU2l6p8lJ25aiO08wpW4r7kC5+4VHUyuDX?=
 =?us-ascii?Q?eGdqbukNawiItKSnFb/SPvC3MUUE6dRlHgylqqj9emLkHlFuYJBCfSBil17R?=
 =?us-ascii?Q?IJxRtZ4meE1XqZZXLtmvk/N7f/JD+Iu79I5fkmdXGCDoxZGyZvz1DrvA8W5z?=
 =?us-ascii?Q?WuPyFZ/+kBeozMBuWBjE133PEzgMNiPbBhzyIAYMwgyEUlDtVWGbTGAGT2p/?=
 =?us-ascii?Q?ZybZ+xl//gulvWO/OCnCOHOD4x8xrVtABzJ9FeqReK+IfL+/E7uMsYW/leWv?=
 =?us-ascii?Q?dxcL7ebOLOsPJui7DML1tkzx8jf/HChLiHpEOFD5QAQaMb000Qd97qYN2Ud2?=
 =?us-ascii?Q?reKIBLpk/w/Vpmbt7PMRqr+TgqoRhNpNlon2aegfeJo/SrtgJrSuVFpOLWdp?=
 =?us-ascii?Q?+OZ8aipCWEscx23XR23j4VGDRS7cC09xu4NKd7Wjx6wdqn18rh8Zw8yi86AZ?=
 =?us-ascii?Q?2UJ6tkWXsP+4PN9CalFwG3mVC7z9z9MsqaIz7iYjHWPr4GfmytQzEKYv10o6?=
 =?us-ascii?Q?6SCRRYCMKNGfLs4hTeEfjd1CVx46dLdbb3PY4uuZrfiJQjcLbIt/9hmUhTA+?=
 =?us-ascii?Q?Am8eqiwZF8+OXl7mQz6Pe5vPfav8bxCkxGR+c+k0jo8fYdAArHpE/bQoeri/?=
 =?us-ascii?Q?c2uRm9rjdeW3PGcU5OF4IRclWU3RDjiBnrZyP4grPd5cJHLjwL3UvBKy1MSA?=
 =?us-ascii?Q?9UfPugu8L1yEzqWNsRNBdo6klCtCKN+a8n043dVe700gU6n1ce/SGKkYa/iT?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d21d4635-c0e4-48a9-9c38-08dd1ed3dc34
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 19:49:03.9741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/P4K3+OjwUqRD3XTklI5YKyf9QQ94qFSfUSI3yb0rsY6Wx9px1N4QvvsrW2r5NJ8WOssMALsjPbvhJdgoK9rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8816
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

On Tue, Dec 17, 2024 at 08:28:59PM +0100, Arnd Bergmann wrote:
> On Tue, Dec 17, 2024, at 19:52, Rodrigo Vivi wrote:
> > On Tue, Dec 17, 2024 at 08:18:44AM +0100, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> When INTEL_VSEC is in a loadable module, XE cannot be built-in any more:
> >> 
> >> x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
> >> (.text+0x19861bf): undefined reference to `intel_vsec_register'
> >> 
> >> This could be enforced using a 'depends on INTEL_VSEC || !INTEL_VSEC'
> >> style dependency to allow building with VSEC completely disabled.
> >> My impression here is that this was not actually intended, and that
> >> continuing to support that combination would lead to more build bugs.
> >> 
> >> Instead, make it a hard dependency as all other INTEL_VSEC users are,
> >> and remove the inline stub alternative. This leads to a dependency
> >> on CONFIG_X86_PLATFORM_DEVICES, so the 'select' has to be removed
> >> to avoid a circular dependency.
> >> 
> >
> > I really don't want us to hard lock this X86 dependency here.
> > What if we add a new DRM_XE_DGFX_PMT_SUPPORT and that
> > depends on INTEL_VSEC ?
> 
> Yes, that should work if it gets phrased correctly.
> Something like
> 
> config DRM_XE_DGFX_PMT_SUPPORT
>        bool "X86 PMT support"

I'd say bool "Enable PMT support for Intel DGFX"

the X86 PMT sounds more the cpu package pmt which is enabled out of Xe scope

hmm, I'm thinking we shouldn't also add
depends on CONFIG_INTEL_PMT_TELEMETRY

Dave, thoughts?

Cc: David E. Box <david.e.box@linux.intel.com>

>        depends on DRM_XE && INTEL_VSEC
>        depends on DRM_XE=m || INTEL_VSEC=y
>        depends on X86 || COMPILE_TEST

and also
	default y

> 
> 
> 
>      Arnd
