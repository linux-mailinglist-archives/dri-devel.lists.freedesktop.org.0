Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLGXDDzJnWl9SAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:52:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DB1895B9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C01B10E5C6;
	Tue, 24 Feb 2026 15:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxrDZtBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4752410E5C6;
 Tue, 24 Feb 2026 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771948342; x=1803484342;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SbomczRmu+scLL7+gkINfWmEp/+4S7H+KBMKz+QXWPM=;
 b=NxrDZtBjPrtoqFBFXz1Kys04Xc5yNAz4UL9DxDHgHclkpuPQwqdlWN6c
 MExxwyxQKi6BqOK7r1j/Qn64NhzY7KSTDNFThkQZ9ymD0xeBZlXdSVRPV
 wgjVCKTXDRzxCxQj1CznTDi7TEk113CZWwW/Yt5Vi/bbhBBoDEmsUgQbn
 Rb3yLNJ5zqJERU0WT2g1woAWLQx++57r8IdWi0LIho5WcUS38jBV4t8u1
 4PkiJe8WK3gnj+WQBfBF9rxjKe0SoajBdHAClYEmvj61TSN1SfRY3BIcC
 0DnOiaSlgomutoL9K3hiTq5u5L5Ep5XIBou7S8f4O14His7o5aF/St6nB w==;
X-CSE-ConnectionGUID: /AeZISFSTpKx73GyQ2mSlA==
X-CSE-MsgGUID: cNw/QTPiRBicziCwQiDSFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="60545471"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="60545471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:52:22 -0800
X-CSE-ConnectionGUID: 6ZBNi3iCROuZGFfNRZMMag==
X-CSE-MsgGUID: 8jIUp37bRrilbHp7XrnGjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220536940"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:52:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:52:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 07:52:20 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:52:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUWT4kbjp9x4nGGqVzvPbTee0mKq4CCXwfQMf3OoTJ+bL5agtQuwHVdHJWahgLf2yzFVOQD6GZz97Lz0d0WXArj+MFBGQlGGny5P0JlZLLRhZgXwdNTIjvVqxkI5qjg7rh5djbKsE2pHZB+avp+x+BAUlOWj/m2YwaBabDfHS1kx+uv1fmeGS2UvMJMHacC+3YXgDPU9+W+EI5NnpnGCBJcmpP3eBQqAEjH+SiHBdefqEB3PfFa6y6a28fo1/AQbCmK/uCg9H4ueg6Q5R4dMWAtIED8J23/6wE3mwr/s5krVrhZfakTMqFlW/MqZwqn+n+YLlqvy8H+nqQdXpg2xig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32GD9YskQ3tVRratDYFrgdZXvbt6E6HCagPW8Extkc4=;
 b=Xc3BYtaCy690zRE7JeapVYSgZ7AUb8mKoEMQQRy+NBpztpL7ZZAWBFpEWq10Ebq8sq2PWCrjAq9xnFhQcsJWrMJzS6Hr3mcIbBC8Mrg88GFRTbZoyvH8I1dL/tjFIrq1VQEu+YBD94mkRoPYT+BNkl5qq1qnHQ8L1p/UuNqiyjRA7+hrA6ewg/xol188map2J2B+wbA3zoEG+hqFqUY1qIC60fV0jKASJ3+KiIlTxSl6npHVWH49KmFZ/AAWxn7Nr2ci4DsBu68qbopj5UHZ/DfFCP8EyzZ1IZhb2bpTJFEjT4TFzRoB7oW91aHZ/9Q7XsP0T1qJjc7E7FPmNU8ZRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB9605.namprd11.prod.outlook.com (2603:10b6:510:3a0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:52:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:52:18 +0000
Date: Tue, 24 Feb 2026 07:52:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Bart
 Van Assche" <bvanassche@acm.org>, Maxime Ripard <mripard@kernel.org>,
 "Thomas
 Zimmermann" <tzimmermann@suse.de>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/pagemap: Unlock cache->lock before freeing it
Message-ID: <aZ3JL1u1HVogDPeo@lstrano-desk.jf.intel.com>
References: <20260223222937.2008492-1-matthew.brost@intel.com>
 <8001c470-ca46-4390-be3c-f078b5fce498@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8001c470-ca46-4390-be3c-f078b5fce498@linux.intel.com>
X-ClientProxiedBy: MW3PR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:303:2a::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: af54d6a7-6d94-482f-0720-08de73bcb06e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8SozaacbFEo7HMw+KdMhOaYA77LalrEHskGUcB7w1aS4d07BasJFTNeo2o?=
 =?iso-8859-1?Q?TzFmVFTK9OUReaZ3F4np/aJupIU0gUcWGSXDNea6EWMNFBHpXIEsBso6Qz?=
 =?iso-8859-1?Q?EgCfYOLrLi7SLyBDxORo9DjUvLHzsq8qcsesJPFQ61mBds705+1zlRq42Q?=
 =?iso-8859-1?Q?POzTE+m1BBPtm3xJMRm1F88vtSNm7wUS9HB3uddwGktf1cU0LyE9NVlpwl?=
 =?iso-8859-1?Q?X1kyV+awwIBCPoIoqMHS8xwv6nsHYNZKBAFxcjq5GAB2BQJ5wptLsSKz7u?=
 =?iso-8859-1?Q?YqeuuQ1v3QMdUNXDNFA3b5wwQGHJuPBHHUzk/JsYdnBg0AvxdgQktmmwTF?=
 =?iso-8859-1?Q?yRwAr58KHjGIW+kMIXcuUEGpzOao4TxNEBGjxOV8/G7kAZP1Di4uuICGuh?=
 =?iso-8859-1?Q?LXwUkunSyw77ASxmivZ4Yr2QSWbupbiprKTBmSH9/YRa94ssPFHhvW/DHj?=
 =?iso-8859-1?Q?4vbaZp53g66I5SeCBYAgofPoG+cpy8k4kHbzZdb2He/LuEe/FQa0dx1dpa?=
 =?iso-8859-1?Q?E/iIm2p8y2dyKWNKChkG87EMevG84SPklWkeQyO2zuDLQ4QA+9mv6dUBiF?=
 =?iso-8859-1?Q?1JrTpJSGlBHHu2Jl8evEYUTUL6eSgNBhNUF/XVoT63OX2pVKcqirorxoIC?=
 =?iso-8859-1?Q?Xkk+MsCR8U2P1LVmiFRAtcRTX4cIy8bH5Vo5oeLeOtUi49DV4g6BFqeucL?=
 =?iso-8859-1?Q?JLQ2ao3cIa6wrrxOJHXXnbyrd3c6IhrHctZBCJ5QD3qHmNshMaXXYjoCxT?=
 =?iso-8859-1?Q?5qIEogkDtja42LrkdAQ2I9lrMGjWtdQj/k7TVo/NThJcMyFJjtkLT6XBKR?=
 =?iso-8859-1?Q?hm11JR5bb53Pd2+MvlTchpQ4aIjDRysgVby2UeihlhBj6cRtb7zhyWTw9i?=
 =?iso-8859-1?Q?Jxw71LsFMYUSnSRiPfa13VqFZQ9BflVRtpVBMQMyxv7gmzw+7JtUX8DXk1?=
 =?iso-8859-1?Q?lM352a91rfG6x3rROm39UpvqihJhblzyiz+D0MDjz9mOQ2H1+o0S+FjxEm?=
 =?iso-8859-1?Q?rzzC1MWPHWHeP8XCpsIjPpxqqAVtsxKJ5kq5ZpNCntWx54wYz8tmOz7KGy?=
 =?iso-8859-1?Q?dbkmut/YB106dNt+URmSUHUo+T5jZF8ynuP+eiLeAB0/kgL3hCbpiLKXsc?=
 =?iso-8859-1?Q?pnr22oHQd27pu+vAEMLsyS9MKGzpSPtw9brTP0RSWoV1DRKkfsyfxkzN8D?=
 =?iso-8859-1?Q?H/nDeyIG16iczXj/VfScZfIrpjJvj2IQBK03+XrXCnPlMnrMPEK8WOzUMk?=
 =?iso-8859-1?Q?H+JBYOpjEGaEKFDIg1/x9TUVM+WEwlH9gMkXEUUwh/cTA0gNFqaL8Bxkhs?=
 =?iso-8859-1?Q?E5nNHG54YLFfdpkgjh8ufBTxSS8FlE0Sr1dnhE4eH75Y69mraRjFXqp9/+?=
 =?iso-8859-1?Q?026bA2SKkYeLVn8LMILPt5+g+2Q+6ki34T7u3il0Tb5bynUGfo3rFF6t15?=
 =?iso-8859-1?Q?VaOn1VhLoUtDFEVfTiVwGsq39j98161cvOFy7n1HOq6XbHGICe9GfsUool?=
 =?iso-8859-1?Q?gvQx3CDJ35jEI44j2K+bnvZUEXdwUJqb0hkDhf9zaZt4odOEX3GaUTANOV?=
 =?iso-8859-1?Q?5mJ23jyG2erW1gnHN/f9l+EramUGEmx8vpVz7iflkE+yTBO9y3kdKovcVw?=
 =?iso-8859-1?Q?3YegN4ofj5oJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?O7wvHBBhGkLsZ1LHygC/HHwU0T9NZ7D7ITAgvxVtZQttGzmENz7Lb1KLsh?=
 =?iso-8859-1?Q?zBmPVypDrVRoFH5feutycGqagFflW7sVZMnZ58ucv8orIyt6ZN14MeDh7R?=
 =?iso-8859-1?Q?SZMqZuYpoFDgh20xoG+js2dEIijrTcKzFZKvyhXVxGGyIHuyNKV70eGtAC?=
 =?iso-8859-1?Q?ptXwA2t4eMzrem/wncxk79AeZU6PP2mTrrmo3gNsuGqoRwM7T7qHS/i9ON?=
 =?iso-8859-1?Q?zxX4j4FKxNsA2IidXFQBPKU/QBpVKEt2MaU9ByaaW5II1NpM61ejnB3FeD?=
 =?iso-8859-1?Q?WN2J5zhOhho1LIPrLprpZBfrtqxQ6gqF4LwPhoeLw4wa4hTQrk0YVqZLI5?=
 =?iso-8859-1?Q?zhQp9+TPPBSPWlf+ps4IOCqIoahVsa+z/kaWVPAQUXwcAYJWXc9JU/yxv1?=
 =?iso-8859-1?Q?rj4juCVWWq9XHKHMW4/r1uuJpZLQS/1BLxvrME+wdQaiksqui1SiZKCXdt?=
 =?iso-8859-1?Q?cwBDUYl8xYs0Vo6frwRdCGNQ31yB4kqgEpkhuOLBQc9nGmjrix3/OIFDR9?=
 =?iso-8859-1?Q?xEE0uZR7BZiCY0qIPaNSiDxKyyg87qejk+CY5DbFhlkYjm8/bdCYRx1Gvu?=
 =?iso-8859-1?Q?QYDncer7gT8qn4ANMEWW1qCmbDNodBJzrTJuSA9gRtfHGEtTFefKYBMUuv?=
 =?iso-8859-1?Q?T4Yvl5cOHZ5VsJc3kt+VfwKhpOt5NTlZ5HjsXT3eWi8jpNrHn6cJ4S9Jlf?=
 =?iso-8859-1?Q?DPPXIMy+FpFfLBHa+rjDEsR8cvJincbzuV/8ZmPieprzXDX/VXHobQ1xoN?=
 =?iso-8859-1?Q?CN26SVzCk7e1c/idiVd9H8rmz6/wUahLawW33ruzrs+Kig84xd9PiVqkcV?=
 =?iso-8859-1?Q?7NWn2yNISgC9BrBdhrQhiCgMnZXq+y0/v0Qd4Wzaz8MLXLDCQQP/ZBQ5DT?=
 =?iso-8859-1?Q?LnuQNnia2XDj+eY7hOfl2dmYj2CE+ToI1MbGkiTzqQUDw+CeIc84r5+26K?=
 =?iso-8859-1?Q?Dav5m+SPjTsL0+HjAOYlkub2O8I76S+iNspQl07w5OkOL1XgdncG9biXCz?=
 =?iso-8859-1?Q?CBwaNEqlpGCYy7bUCDA2lXI5A5PWxnZA7b4HixsdvUwfs2Np2PO00mEetB?=
 =?iso-8859-1?Q?0Ai5uS+GenJqoUYkh/Ls4M+uwQzsc8wHcBzJsC2HH8JzXOuXcOOrtBOlnl?=
 =?iso-8859-1?Q?cJrwtdv7+3n+u6ZJMsuH+P2+x4XkAlodRPeCMZcI0S2qL+QMWGiKUNZpLU?=
 =?iso-8859-1?Q?KUXzsb4AtLV5lCPdDtgnehL6MejI0Ui169I3JwFx9Ko+HlLmVIoW+whgU4?=
 =?iso-8859-1?Q?xwwznUgCDpWyjCklpie2kE8TQxSHQP+LPmw1Dmx4bFY7gT8eYuF6wfEQcB?=
 =?iso-8859-1?Q?3XivkMX65SlirJJkcUgEBIxDJP4oRGf3gigQLAX9BiJie+2MAtcfPUNEgv?=
 =?iso-8859-1?Q?aJFVCyy2pDWk447bHmzPt/aEHqOBi5C11vjk6/dZLc7Wtjy7W7ztBObXh/?=
 =?iso-8859-1?Q?o+/KKoSso8QjSTS6NI4K2DXYhzUA7UBvBoWSerAZEbiA7xZ8YPzfZFnVun?=
 =?iso-8859-1?Q?EHHHwts1zOFmoNJXMI7ks0lRGixKDhadNulnc4XAkAc1lOS1bV8Th0CAlv?=
 =?iso-8859-1?Q?Hd33wRy2WO+enJWnqrVVNxzXLboyVVZ+IQp2oyjXg58kYDY9+7ruo4NHVz?=
 =?iso-8859-1?Q?Y6uPN/L/IswxgQ4KWFYNceXd5Y2po5S/D4M6vI+8gmT34AfeIse/KrPKsb?=
 =?iso-8859-1?Q?Y3XI9o9bDcdUBC58I7QhNdI3bSABa4kJ88RIcyyj4uFBeUsEyi+Z4jbpLp?=
 =?iso-8859-1?Q?Sk6hLmoKz5wL896yXcEK7cRyStArb12OuLDLmfzli1b3jA8fyxwN4OliXx?=
 =?iso-8859-1?Q?g13k7SxwVrO7qLlKyaI0gHlfMtbMXyE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af54d6a7-6d94-482f-0720-08de73bcb06e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:52:18.5524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbbt9A2kgwXAxp6lyru+IX+FrQ6ebu6loKsyxFCbXhBFCQ2k0jlgJ2hmObcnePuJbV8wLRnUOuJNZ/6Bs7OC6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9605
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acm.org:email,lstrano-desk.jf.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 530DB1895B9
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 02:39:17PM +0100, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2026-02-23 kl. 23:29, skrev Matthew Brost:
> > From: Bart Van Assche <bvanassche@acm.org>
> > 
> > Although freeing a spinlock without unlocking it is fine, this confuses
> > static analyzers. Hence this patch.
> > 
> > Fixes: 77f14f2f2d73 ("drm/pagemap: Add a drm_pagemap cache and shrinker")
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/drm_pagemap_util.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
> > index 14ddb948a32e..50cb5f9cdac5 100644
> > --- a/drivers/gpu/drm/drm_pagemap_util.c
> > +++ b/drivers/gpu/drm/drm_pagemap_util.c
> > @@ -74,6 +74,8 @@ static void drm_pagemap_cache_fini(void *arg)
> >  		cache->dpagemap = NULL;
> >  		spin_unlock(&cache->lock);
> >  		drm_pagemap_destroy(dpagemap, false);
> > +	} else {
> > +		spin_unlock(&cache->lock);
> >  	}
> >  
> >  out:
> 
> What about this idea?
> 
> https://lore.kernel.org/all/791538fb-56e5-4ca5-9484-1180cc928a70@linux.intel.com/

Yes, that's better - I reposted this yesterday while a bit overloaded to
make sure this didn't get lost. Let's use the a version posted in the
above link.

Matt
