Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E1DCtWVgGnL/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:17:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A66CC44A
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0682A10E297;
	Mon,  2 Feb 2026 12:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSSKdiNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E3110E297;
 Mon,  2 Feb 2026 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770034641; x=1801570641;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pdojQG2rIF8PyGWxVtwASEM9ISGLeZT3HALtNiKTBp0=;
 b=YSSKdiNjcvIgTHNafML0wQm4zrIo2j4IS7T2v9Oltib1ALcNpHDVbOs1
 SDwJDNC46pozW/6ShHsCQC8XkW9K2vuD/y5fa/Hlab/oufv9tD4p0JVoT
 I18wC/xd5IjIuWRoS08RKDkz0ctcn4LQBR7U61CWiPg0Zh5jI2EoYjCd8
 8ZB5cgX+Gafzs6Bi+8VAOkRukkx+60k449pWMyV6Esx77M4Mhu4HvVzDO
 Q83IDuNhar9EPZ5kIynLQJtBaIYRi5aVIW/kZX/ejQCsBbXEsKHUFZO1l
 GA6qkMpru+VaPu04YC1jZcSDjR2+0avtAXTQyzU7kiY40RmLJYjGZuOMw A==;
X-CSE-ConnectionGUID: y62zBqHYR0Kqw+TvQYknng==
X-CSE-MsgGUID: LzkzL4fzR9KF7vAon3OCOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82616179"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="82616179"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 04:17:21 -0800
X-CSE-ConnectionGUID: vMCo5zvuQquMtbj/RtaCeQ==
X-CSE-MsgGUID: +jRt7yAXQwSLjdOYRCEVwQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 04:17:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 04:17:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 04:17:19 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 04:17:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZDXLTSWfpiC6XFXC3OkMXyGjqonIixW4PSWcbgxqREyfyEM9nxtDHbIZYzU2BfhJRfaRK4KvUdgi57ZQj6ypIcupkv5DiEg0QhuE3iKzL0d2CKoGq4gecHUPga1xXi1m+pQTag66vfNc2JJcQ7qy6omUnpCDUGUguXZP5NIcPlAHMiWL5nuJxcBTAfVEnrXaHeldLlC1tEK/hkIVnzqRX1QiRlQQ1Wuqm5Zl37MYMqnm3YQ2hJG5rO7XF71ve+m7guURK+Imf435w5JK2wbucTd7CPo577H4+lf71Bp9Qj7rx8BJ1q5VUOW2ysjw2R41jDO32wpe059um8wKyNS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sv0sidJ8GnNNYzvBv8ctzjqMxtNBQfrfAh3gcvYiDj0=;
 b=EOoE+kOE/Qveqx77kBw4TJccykuNQRn+O2KKba1r4dNeFeMqleNXArO9xUvWKXoLLtdKFVtKLbHfeKgjfTjyxm7g7K+NC5KV3XBXwW+AFA72R+LzCGOv7CGoyMNB9E08gYh5R65j3BiDAOtHpshg5mLDAVeG/sxQOgAcoCCUqOEW48FflF+eJrssoKkZ0aem/QPnGLwvcSffYvCsChO/DRFkyYl00h8DH/HFEftBzFlGraPUG9BLKZNY/DHEAIvLiUt3LZutjYI35sSgO6rLKoSYv2Vsytj3/cDeeHhMRw/f8v3tR+N6x2M2NTLTaJ9WuEh8bIePw/5aurib+LcSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH0PR11MB8144.namprd11.prod.outlook.com (2603:10b6:610:18d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 12:17:11 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:17:11 +0000
Date: Mon, 2 Feb 2026 13:17:04 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/gpusvm: Force unmapping on error in
 drm_gpusvm_get_pages
Message-ID: <aYCVwEs7wg89LybW@fdugast-desk>
References: <20260130194928.3255613-1-matthew.brost@intel.com>
 <20260130194928.3255613-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260130194928.3255613-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB9PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH0PR11MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: fe465b43-0143-485f-cf4c-08de6254fe4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YTAhFuygHDbPPPax2go+OPsuuozFAAtF2IpXfal6WtuPmqY0SxQM/Wu3zHOc?=
 =?us-ascii?Q?bzuORh+u500qUoEGYfS0/6HpTPTg2kh27I470DNg1xSM+e/4lpb+ipdZwskh?=
 =?us-ascii?Q?G7PW9BnRdQs6akPxm+vRI1rPBd2U4YhyjmLiQwantdRtQNgEDfw1m/JiFXWG?=
 =?us-ascii?Q?FwhEktv+mwrV2mXFX6h3aUGLB5usLE2TsXxiyCOwrA6VXkxbr90ucyEfa0Zf?=
 =?us-ascii?Q?rq5wi+E+FMs5IfjMOCbzjxbznuQAPJlIxzg00o6xdVnb1LL3TUZacsxfD4iy?=
 =?us-ascii?Q?C5Dh5QEgZ80HO/qg9fL9vI7K3YxrePlBgiz0lCE7tFrX33MO+P6s9V2cHRYh?=
 =?us-ascii?Q?51CT/ltoGV+i19M/I/5IzU3yZbRstG97ylymIlEJ801o5hnfy9ygE8KG5Bq3?=
 =?us-ascii?Q?omW09J7zgD/I55nO49qsGZHeBMdpWLOYU9fyeI33gparwof0P907p7FpUbZT?=
 =?us-ascii?Q?2ASsALBoUdGmDM76CBh6gQPtwXHXE3+JndeczMkCqvJoX/0tDLoWu+uzRWzM?=
 =?us-ascii?Q?NuMMFQe+BSs1X7/LhVzk9oD0cW0iL/PfmgMP1ZKtVuaLJXCWkO3zxf7Z2+9j?=
 =?us-ascii?Q?H1Q+tOKPmHVKqrPyoYUmbPByi24zCKb+WJ1JkBQlNNxamp3+KZGAIcuJbxrx?=
 =?us-ascii?Q?Xb6UpnRSnfLf+ZlbqOSez2gqgLaDS/2yZ+UnuyxFpOQrGRElkBOGx1INzcXA?=
 =?us-ascii?Q?WQZvX7wAM0oxNvrLQsxDVVwG4CBTfM+UVg3R7YoraWTjO7GCSHCLx0puZgMa?=
 =?us-ascii?Q?xkD1Fa51FSiyPCNgaLm5yH0sxMrsFr8AKuxGRaCQI4W21pK01ofzgBulrEGb?=
 =?us-ascii?Q?W+ijFEP/lhqyHPyn4IXIZqQaC8OERMkk27lNIKZSHMbs9M11P+T0+K2qF+ne?=
 =?us-ascii?Q?VumTe0P3X8hnPTWKBHQj8cc0gWzQWKXPOaLGOaA7LbBmyRqH7UYtN9pCpdl5?=
 =?us-ascii?Q?mzqwdtbKbpjQ09WbR9FKnehoCZo/82eEjE95e9NxMff9bP7ZYGsVguJJ3/hd?=
 =?us-ascii?Q?8qqSeV8magN4W5DP5Eo56Ho4FLLVsyRNbSxiQo6Ag0q9qvkZrqh1VSSuwCo3?=
 =?us-ascii?Q?KaCrMOwHqwVwd5Al2oN7Jyzqq8+QjB1OBKrc9zkxDqYfYde2lONghaXbnSTJ?=
 =?us-ascii?Q?aUdnYe7od6DTy8cTfs45+hT02LmLHOUOGDAUeJ50oq/35L4ZNmt9Sogq2IVi?=
 =?us-ascii?Q?rWdXxPKbkYioSsJjOpoLa+aM34SrCh1hWvf2/ZITmCtF7Qj/evjNoAMcEbM6?=
 =?us-ascii?Q?arWncv0INN+vjtpmhiyFOX+OYBrCvTfPT92dLXY6eMrbL98rwyzKPhm2ifdw?=
 =?us-ascii?Q?xMruVrDm+Rx0tgoRSKa4rpQwm6AI0xbkZ8uzAwnH3YBj+QjtbLgTcIrsZpZ4?=
 =?us-ascii?Q?dl5ncMgr4rKbOZ4NuhqKIOjFjhOEjNtAIeWMhs0RwqnUUY+Dx4cb5hQs2H7t?=
 =?us-ascii?Q?I6+TwxT64div0G4jBD/RLmRmziew99kQ64CsjtbTTiYiWqtmlY4qBnAQA2jE?=
 =?us-ascii?Q?k+/8dF2TCG0oF5TL393T/upMquD7dvsHXskwNunBiPdrBiUdoLZcE5+tzpWd?=
 =?us-ascii?Q?DBlIInd1RBUrSkv6T78=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xC4exIXJHOgzDmcXLijqXuPzSKINDcJaFE9u/5Cl9U8jykwGfxZB+GNHXCzv?=
 =?us-ascii?Q?+Hz3J415DilmVaXdBoTsMj5MTmkEGDx224b1GbvyDBzhQWvFoS4+/VHKoPe7?=
 =?us-ascii?Q?8ookCHbBywxO2RZ1ajxFKeL5pbhtVME2ZV5QZQ0NYgWxGx+69bZt1JVczMxJ?=
 =?us-ascii?Q?VB8jJZw8LsDGuHZhxs271aAX0AdY0jWml3Rk7bu44Pj0NKSkycqLzCt1UPf2?=
 =?us-ascii?Q?nvw1UbihwXNX3Yvk6GwaH7PGzyVnawgRzN1B6sOJVw3tV6ERcZM0iv/ugFw+?=
 =?us-ascii?Q?Jp5ehN+3NdWMaTSUIgau0Vl3b64y9HP5l4dZsK4dINS1YiDraiBZWY8Kkgb9?=
 =?us-ascii?Q?Q/34i87O/n7KSL/vTX3qrRmcDM25CS/cOEgVCVtZeF0LgJd06ad6L1go1z19?=
 =?us-ascii?Q?Gt8qFUq8ed0osY4uhaPn4Ofnz3vcO4qHrc46t/pxywHSzBymnv29m/cXvRWf?=
 =?us-ascii?Q?dzecAPGtntBhjTWP0CaSUer86VHuqCF9Qyf1cpH23MYVV2cfclqEYYsBvh0v?=
 =?us-ascii?Q?Wae0M9y2A7fmOoN3/4QGsn3gQn3bg63nQvcmuTPdZd5o+EGIpasjMm+8bHx6?=
 =?us-ascii?Q?e6MGhibBJD5Gq8FNDf1puaWkvw+qZPKIq5AeLsHYmp+gT40gCjmj5tNsSRoP?=
 =?us-ascii?Q?S2lR3qSK9HxFYsdLCK0WEGmpYiJ7ssCiiv4fYf+nQdqf3kfV3p9N1Adv3eal?=
 =?us-ascii?Q?alaW8Hi8XiQirRuwze6NrGmKIPr0A8AxEbVvb66JKrrDQfn//cVahFyt5vPP?=
 =?us-ascii?Q?fMw0voI3zqbMpMvS4KCInpLlOfWc5HVgPqeItzbfgCeLXlyNb56AdJFq4NTd?=
 =?us-ascii?Q?3SxC25BvmPMoSrLWlLshS03XJf8MUIu+7wFTbDbQOSybgo93q8t6DPHP12iJ?=
 =?us-ascii?Q?Re4x5Z5hv+TrrmKGK8bbrRFYZKxrrZGLOwPLVmvNzup71AAGHI3KT3yJYtAs?=
 =?us-ascii?Q?XMLxTN9OXmnmBVMfZf7VkN5Otq5oLeOKp4UxEy14bPy+ElyUmD2xEl+JIz1H?=
 =?us-ascii?Q?MQN+PGc9TmjGtrNvLn+xHulsfAezwSVOMIkoYQfDHLs1OqbEJUmWNYaEqrYG?=
 =?us-ascii?Q?O8+l18SkStmHXKj5Xf830ARcHNkPHl76xd452hQDAzSDvSl7Y2o8TcAO08V3?=
 =?us-ascii?Q?LRRWT3BLgW+0UrlynXf3We8z9LNE2TN8qJXLopdfnekAPZDSr8rrg+HD81fT?=
 =?us-ascii?Q?nTUzobo/OI+Egcut5GDR8rrI2UsZ799EZAToRH+04NKCKwt1Qwd9q857T8Ie?=
 =?us-ascii?Q?ITo+Vk2miJwSBjaG01iaH5966+if4LUYdM2UQhICiIkd3eunq+kh7bZmqzrM?=
 =?us-ascii?Q?GGDgHP48enx2JlAw3iYZduSFYQpBaf4T9gM8vpG/zn1c8HIWhY/bi9ED04xI?=
 =?us-ascii?Q?8PTVbXqHhbXn9Yw6pCSSA4y+q00KXAvzSC5CMB4aVCBvwEjZC0l10qtrqMkM?=
 =?us-ascii?Q?xZtG+FPZtt8O9N8S53n9ya32JaJqO7jU1MRoKWeh9Fb2jSp7uxUwUUruUtz1?=
 =?us-ascii?Q?4Y66yHDKbmPSlX4cMjMwIwbUuup5tCp20458TuHwtHKpk75ybL4eHeV+iHtR?=
 =?us-ascii?Q?VSIFOfwuc5iFmugx+XURe+dBCKE60hLkYSFX1LP7sQpgPwavqMccwHcg247z?=
 =?us-ascii?Q?eKAq6BfRrJaiGG54PCrTtC0AelX8Jf+GckXMx3ciTAmrS/9yzQYsu82pcFlQ?=
 =?us-ascii?Q?Z8kQ5JiLG7yponzx+3wYKLFEU5T/QMAuzD5XjUH82LaeKNz3ciz+frky32G/?=
 =?us-ascii?Q?CuyHkt9FG0bCrcZ8UlPJTB24tQbSfzM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe465b43-0143-485f-cf4c-08de6254fe4a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:17:11.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/FNlj3/OK4UnffygZ9zAYEPTs5CYr8seMDiChY9ebgLamTCrUUmEMK2qBK3xtBaCOqHGOyLNx7gaLDJ66rQJ8GplQaxBYOMF9vk5rbCnVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8144
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
X-Spamd-Result: default: False [0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francois.dugast@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 88A66CC44A
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 11:49:27AM -0800, Matthew Brost wrote:
> drm_gpusvm_get_pages() only sets the local flags prior to committing the
> pages. If an error occurs mid-mapping, has_dma_mapping will be clear,
> causing the unmap function to skip unmapping pages that were
> successfully mapped before the error. Fix this by forcibly setting
> has_dma_mapping in the error path to ensure all previously mapped pages
> are properly unmapped.
> 
> Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index aa9a0b60e727..d733599ceb9a 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1572,6 +1572,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  	return 0;
>  
>  err_unmap:
> +	svm_pages->flags.has_dma_mapping = true;
>  	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
>  	drm_gpusvm_notifier_unlock(gpusvm);
>  err_free:
> -- 
> 2.34.1
> 
