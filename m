Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA67BCC524
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E057E10EB96;
	Fri, 10 Oct 2025 09:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwsMd6sn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B1810EB96;
 Fri, 10 Oct 2025 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760088135; x=1791624135;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=XoU40kMO/thi2dSUwxLP/wr10q6eETZsI6XwMpy7OmM=;
 b=XwsMd6snK5fsbGC0Iv1XxS8DQIulASJLPHNcJMQF2BV2kHpVJD3+nHm7
 0jkhD1lpw74LjPscTp6BGwoyK3uVx6wDAjn4W4MXIQ6SU9V2pRwzjv3SQ
 KHaBN4Hy/q+sEUJQK4MWB4vBlauJHa9FvkFR7HGn1+Pm3XqlJjwj1jPrp
 c131sLVJVk5ZZgY0OSnLcP9rSrH0MUmqd3Kb0AdPxAmKxpFyYEXCNmXEN
 3iI5nJBfHGUV/quUmUosEkSHDw8FfeHpgpx5k8P3Qn97VtHf6defyQOXO
 0SuZL1P6V3b890P8vfjT/ij2vX1iDrTjiV+IGyVtEZoul6KmpXXZviWfQ w==;
X-CSE-ConnectionGUID: S0qLLD9XTXicfYXMcmPUKA==
X-CSE-MsgGUID: jPhS/nUESdmr+PbP1w1bdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62405912"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62405912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:22:15 -0700
X-CSE-ConnectionGUID: Anjn7vqRQo+ARKEDCQSDgg==
X-CSE-MsgGUID: 1NT3F3u4QOqFfkw1GM83nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="204637180"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:22:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 02:22:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 02:22:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 02:22:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPKtw6KeZlk9BDqmSdan+t8IPsHR0ScMdGP3DYnoibM9MtdRetWPltOUv1ThINfOu815seASnIoleptlW2M3s980VHfkE2+1yeo1G3EO3AUEHapZ836PrE2JPkbKGpBM3GmNRvBfCGMkcXS1tLGKrM8FcO6LESPFBSOJGFk95Ru5kuP3f4YGUTpPyFVeYZz/k6dT6rwxnHJIyliXvi1QkeA/b8VU1SDghOB0cM6ntE8ljPjmM3LOvZbc8qgqwxlBV5umuoE+VqWQfPXqQuzBmPn0UjvMJF2A4jvf7vnkF6HihiGod8x+jUU1frJeaipxs4uiM5gJTvSFqGBmTDSa3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT/qCFN3cmBJi+Pwj0aN/MLlVZisfNckXTs739ZjOMk=;
 b=jWB5rsZZB9EwuxontdZOg8nmB+ef7YxBtDlO/EpMYvcaB9O//va8onhHW+ynvhLYxA9NLqYF3Y2fcNuhSltYncZZUXo+MMRiVoEfYYbQ/1iByasMlrwoeQCwEztn2YciFszBrqODffSBf4rJ0c8w9vSoycdOkr+PLzN3Iw1kdCS2OKKONyld/01n48i8OBx6LRQbPiZ8ZRwGPu11PNkrLz8qzp14Jdi1Y4MiZvEteK2RpQJha6CZVdZZWgR6ZmO5wle1tb63T7grGhHt6Ruio31RRyQI95BibjCNGrtYfA5Sc3nfRGLbJr0+rdLJ8baow0RBZow9B/1ZNAz/CEq3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 09:22:13 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 09:22:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Oct 2025 09:22:08 +0000
Message-ID: <DDEJ63KBNCGI.3F0W0OTC78RZ8@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Wait for page_sizes_gtt in gtt selftest
 on CHV/BXT+VTD
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
 <20251008161258.3568573-8-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20251008161258.3568573-8-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: VI1PR06CA0153.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::46) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: be9f4d02-6f60-4af7-033c-08de07de7f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzhlWFNwWG5XeEhWZURuVWRDdjRocTlOMmQvQzhZR2wwM3N0eUlUZ1IwSkNP?=
 =?utf-8?B?c01jdkkyZ1B2WW81RjlMTkNqcGlHZnh1QThlaDF6NEJaZ2p3ODgybzM2cHB5?=
 =?utf-8?B?RVV6V3hQV3M2M3JyaTV5ZGxTbCtYY0VDTkI2VEU2VTVQb2NBNERjT1FHamty?=
 =?utf-8?B?d2cyTmc2NnZLQ09YMU5oMCtGSXJhU3VkMUxpYlFmRXF3OUowV3hLcDk4ZmtZ?=
 =?utf-8?B?WmRpc2xuYUhpcldzUkViQUR0dVk5TG4yL2dWcTIzdEZzSHNDZDZWMkpNaU9I?=
 =?utf-8?B?U2JGQktHK3psYUpsN0ZUL1VnUUI3ejROcWFyM0lsYkNId2k4bXdHOTQwWkFk?=
 =?utf-8?B?Tm9FeU5LRDA1QlFQei9HMnJ0VVlGblZjb0RWMkttcWdXVlJDanB1cEV3a3JT?=
 =?utf-8?B?NVMvelgrdURRQTZGSWlNVXZmdXlpS0xzVmR0NEEyNnFwZmdBUFZWd3E2T3FT?=
 =?utf-8?B?WGVRQnNpVkdQV1pXOUtMQXlXVjhiOWh0RXpiVTY2dVBkVkF5WDhtK0hlY01a?=
 =?utf-8?B?UFZsNkZxbVdmSkJHS29oUDBGcmlNYmFTTHp3WlBtMUxya1FSeXY4anNCMXc2?=
 =?utf-8?B?OGF4bzhlS3JSQk01TGFsR0crNWNlNklLVlIwL0cvZm01cWJPNExUNDU1OHJD?=
 =?utf-8?B?QVRXdVRJdlhkRERmdjY0cnRUOGl2dHA4TkVtR1dvVDRkSllhYXFuQ09uaE9j?=
 =?utf-8?B?YksyeGpyRmMyc0pqd1Rqa2ZYWURsYWRVRjNXSDZpZWNYNzZqeEM0V1gvL01z?=
 =?utf-8?B?eEZscDZ0ZDZlaGMvZGxuTTVIOTB4Ylc3dmpPbTZ6dVd3QVQ1QUxVS3p4MC8y?=
 =?utf-8?B?TWM1TGY1emN2YTYzTzNPMFA2d0pURnlTY0taYllrMjVsSFVVME5MV0RKN0o4?=
 =?utf-8?B?WnJWYXE0ZjI1V1krbDQza0lVeUNTN0Y1ODFTUlpxWFBsRWZYR1lOV2xNOUY1?=
 =?utf-8?B?VnJkQTZDL25uSmNTSHRFSXF2NFBNYzFwekRTMEhtNkcrdDA4L1ExUkFsdWFG?=
 =?utf-8?B?cCtzbGk4MCtYMEtJM1Q3WjNuR0cyWXdpSkdONjRqUU9XeEdKay9oV3Mvd09B?=
 =?utf-8?B?UWVPbi9xK0RoOEp1Y3g0R2o5N2FLbGxFb1NrWm13QmFvM1IzM1k3dEtTVW5P?=
 =?utf-8?B?elp1dklmVHdRY3dHNUJoQlhyTEkxVExxK0tHWDNNWTcralpXVWExREhaUXly?=
 =?utf-8?B?RHcxb3JiS0VPSnYrSEw5K3FNME5pdSs0NkU0M0EyQ082NWh5cVpjaURMbU9B?=
 =?utf-8?B?S2Z4SVBEZlF3aE43TWlKbWU2Umc0L0tERDVIeDRJTTVnbEI3TWl4UWk0WFlP?=
 =?utf-8?B?Vy9GMXZoTzUrcmlOa3BlelJTKzBNNXhUOXdjNzNyeXE2SlJ3MEFCQmZINS8v?=
 =?utf-8?B?MTUxY0pBamtvcGh4bVJmaXBFa2xSNUNhS2ZqUU1TTm5pdlFPVHcxb2dmdUtO?=
 =?utf-8?B?NWpiUmxlQ01aM0YrYk5wK1JST2V4V2hEZlVmcVFaOUZKQ3g5ZUtVUERUT0F6?=
 =?utf-8?B?MVNZV2lMRXpkVWc5OTBwNjR4RThyaDBEOEdMUm53Mzh2K1owckNuVkF2clhF?=
 =?utf-8?B?bHdoOTFKYkNnOUQ0NnlabXVJZ1JCNnV1UzNWK2JnYXR5LzZyR2loRWhrbWl1?=
 =?utf-8?B?bzZUNzhGVDBkd2pHUGdpakxKckZrcGhYS0NKckljOVVhanc1Y3Z1UVFtVkJk?=
 =?utf-8?B?ZFVFYzFwUVp5MFBlQSt5QWpNM1ZIZCtob2h3YmpRWloyOTdJNUFCZktYdytG?=
 =?utf-8?B?d2RuU2FKWGM3OFZORXpPby9nc0l0b0pMelozdXZ6Y0IrSFliWFNQaml6Yk1i?=
 =?utf-8?B?eUhVUVJ5QnZ0VEgrNGhIUFpVQkFiQ2tnR2ZKeitmL2EvUDBFc1dGQVloS1Bq?=
 =?utf-8?B?eHRkckNIbE01ckdocjRTaUlmQ3lYS0grNDR2UlIydGtzRHpsYWM1Qy9ZMkRa?=
 =?utf-8?Q?+AjrPjrzl4+VE0f6K7O65YVAUXQr84hS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG1vL2w5ckV5YnFhVWpjbFlWRTRocmQrd3FnaWc4SDhjOXhUbGJvb1hvK1ZN?=
 =?utf-8?B?MFA1V2w3Zy9qalB5U0MrZFZQYjFWQVJSbTBsTG1nSEJmMUh0V3NYeFpHYzVE?=
 =?utf-8?B?VHNMNm9renR6NGhobjhrRy90aUZ4ZkJQMnhJNGZoK3F6TjNPRzBPNi9iaEdq?=
 =?utf-8?B?bm9pbnZQckFOMXJmcy8rUnYrWWpQMXI0M0NkVEhYdjdXMkhLYkhKTEFidXY3?=
 =?utf-8?B?UUJKNDFvbzJPTVVxbkROV094ZWwyQmRZRWhIUzIvMnhwdldQNEk3Y1MrWXFY?=
 =?utf-8?B?MHhhTTFsUHJveUdOK0J2dkVlRCt4UytBZmdHVkViWWt0YW1ZOFRGTFpSejg4?=
 =?utf-8?B?d01DU0NjS2E1WkdvcWU4NVVBWGRhalJnR2FXU1hpOXp6bHNVYVFSeHhBeFlO?=
 =?utf-8?B?SnVIN0VIZ1hQZmVRUDlrbnREWGtXbGlTWXlPSUdEaHVQVXkrcGdaL3ZGK0c3?=
 =?utf-8?B?ZmhYNVZNUkJVVzVsK3V5Z1R0MW5YeGpxUkxUbWRFRGpad2Y0NkUydjF3U0pG?=
 =?utf-8?B?VVBISThrcjNBNGtqRHIzYzBDVmVMWlhmQWF3TUFUZEUxLzlyb2s1T3V0OXhs?=
 =?utf-8?B?Z1JQZ0xlMG93Qk9MWndoSm53R3F6cWlMeUg3aC9WZUJ3Tm5lRUxkSG1ZanRr?=
 =?utf-8?B?TVhlOFRYdUlicFNZUVREUlRUM1JEbElCTUxYL1h2L2dpcmZYVDFJNTltMzRP?=
 =?utf-8?B?NzBNbThZQ2puODh1Y2FEOVNHcnk3SlN4UlFaeS9iZk9VTEY4MEkzdWxhdGNF?=
 =?utf-8?B?WVVVYlVOZWJtR2VwVnExeHFVbkwrSTAvbHpYanJDU0U1NGJNaVh0N00wQWZy?=
 =?utf-8?B?NFVZcnY4Tm92UlpxM3UxU3o2Tnh6Z1NDV2NkQUdQdERRQ1lzL2NQTGR5RzlL?=
 =?utf-8?B?YzdNUW9tN2dBTFFjTDd5dHdSeXJ1VmtQZ01ZY05aSFdWTk10Z1Y3YmdmU2RE?=
 =?utf-8?B?YjFNbVVHRUZDWXNmSXZueHNjaDBBSFZmV2RYZE9GM3pjOHJBNTgvM1UwU0JS?=
 =?utf-8?B?S1RUeTZVM0xReUdlNnZJeGlkeStIWUNWa1RKeTNkazhnQlFlZWQ0cjJMSVha?=
 =?utf-8?B?cjJCUVEvdjN1b3ZwSzBkbmREQ2dTVUY1MDhHVUdTTVNvejAzTHFNN2s5eWw5?=
 =?utf-8?B?RjR4Y1JVdUJmUENmZlNTLy8vM1k0RTdwRmhpQzBFRmlianZxTVhtdENHTDc5?=
 =?utf-8?B?Vng3SkpJS0RMbktSVFNndDh4b0ZzOGhnRmJxVy9YbUd1THpQa05qRk00clIv?=
 =?utf-8?B?a2IwVE14YkdCSjVIUkVHNnpucWQxUFlVUjFUTS9IaWxZTEk0eDNLTTRMT0d4?=
 =?utf-8?B?eUFjbFFwR2FmblBwTUlkeG1ZOHNoZmpaYzZnSVR2K1BQZXcvNkwyQlVmOXBR?=
 =?utf-8?B?UzI4aC9yOHBPMWhIWFZjUDBJdlNsdXBUMnZ3ZVFQREdUMVQyUTNiY0pxVWx6?=
 =?utf-8?B?TDlFTG05d2pUeGd6ZHcwV2E4TkxiYWcraXBTUkVDenBZOTQ2dEoxNlZCbHZh?=
 =?utf-8?B?SG1hd2crNm1vWHVyMmdSemF3ZDdkQ3NpckYvMmpQc01idDNsU2o0ZDNQbmFL?=
 =?utf-8?B?dGRtUkxwR2xpWHkrZHE4Tm9hdFJ6MmF0NjFxbGQ3SnF6ZXR3bFBJOGlPbDND?=
 =?utf-8?B?UmtYMFR2VmlrU0tROWk4emxIVFhHYXd2NW9nMy9kbkl1Y1RHWWhmSjFuRmtq?=
 =?utf-8?B?NThseG1GajFnazAzVCtWb1I5ZjZQQjFUOUM5WVE1U3g0N29CcEpvUHRWLzBF?=
 =?utf-8?B?NDlHT2JHcVNHdUxBOGFkSmJWRXBHTytyUTBKbDE3K25uR25BMzRvMzV2YW9t?=
 =?utf-8?B?a2pJR05vSVBXazdMRHhLU0tEZnpyRXZPR0FYa1dxZnduMkFQR0hub2xsVjQv?=
 =?utf-8?B?blJhejNPMHVqZ3JOMExUV010bGlBQ0hPeW14UU8wUlhtSlVVeUJ4Yzd3RzVU?=
 =?utf-8?B?MTUvNnI0eDFQZUZGVHNkZ0pINXZwUnFKeGI2Tnlzc1lpWE1GZXBZTWx5akRG?=
 =?utf-8?B?cnpkWFRhbUs1VVRmLytBZnEvYmtuQ293aHVjZHVTQTdScTZwdU5TcXZvbXY4?=
 =?utf-8?B?TmJ5MDNKOXRYbnArbEo0TzVzTVNxZnpncGVnQ09CTFo5NlF4WFM2eStsdjR5?=
 =?utf-8?B?NWhoeVRiMndjcXV0aFRrS3NzZ0NrMnEzNkNnV09LWTY0QktNNFJCdExEMkJq?=
 =?utf-8?Q?l8fC2i57tFu39diJThYqVK0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be9f4d02-6f60-4af7-033c-08de07de7f47
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 09:22:13.3817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZQMD2XSk1y3sZ8tktlD2kPQE0GzyIiB0FtQSSmORz5Rgs2nm3htNR7jrRNYE+6mZtD8CpyqPcGegP96UAHQ/9MVrqLtQbx2jM6ZNpahlgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
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

Hi Janusz
On Wed Oct 8, 2025 at 4:12 PM UTC, Janusz Krzysztofik wrote:
> VMA binding to GGTT is now asynchronous in CHV / BXT+VDT enviroments, the=
n
> vma->resource->page_sizes_gtt the test uses as shift count may still be
> not populated (equal 0) after i915_vma_pin() returns.  Wait for VMA bind
> completion in those cases to avoid shift-out-of-bounds kernel warnings an=
d
> the test case failing with -EBADSLT.
>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
LGTM
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
--=20
Best regards,
Sebastian

