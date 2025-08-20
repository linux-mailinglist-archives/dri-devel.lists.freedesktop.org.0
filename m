Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE8B2E520
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 20:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DC310E7D6;
	Wed, 20 Aug 2025 18:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="JMm6ZuRh";
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.b="dl4KQpF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1181 seconds by postgrey-1.36 at gabe;
 Wed, 20 Aug 2025 15:44:35 UTC
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FAC10E13D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 15:44:35 +0000 (UTC)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K19d6V018860;
 Wed, 20 Aug 2025 08:24:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=ppfeb2020; bh=91rOlhDJh/LuDoI3db2gZW
 ZQapgGdrR8nKNEwYWe+/g=; b=JMm6ZuRhkPewCQdmMDzmFqi7Bjds1qFHOf6DUA
 hS48XuIvTBbdHnujSqFptQcng4eWLmCjWE0xaiyIc8+65NIbiVRfzmYdBgHbPD+w
 4pMB4ubUhoySL5RcUSCq55RMWbtBlc/+j8RFrdY3sUv/zXfZMzuHGKmpxchmyIvY
 V8+mdR9zVjtjh2LfpC3lrhC7WoZLAzrPgl99jxo1ImX2hdtNesbztPBfEkZD8SL+
 JzP7ioTCnslfnwhZ6QOsCj5syFDmbIQF/CW9zwwhtkGVH+BPh6+2JtaiJjZ8Chl2
 VNHDPgWpwNIbDPmBCF69vMYRoCfoGAVF7Fa9WKD5Cx/pnYPw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 48n3c4hyfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Aug 2025 08:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwEP4KeeESjI3TDM2t8y1cgj1vOz4n31l8EJYjY72vAOsL1/MhPPQlESVc9Ko5zDqZ4CZ8SbOz+uBFgXLI8egXd5DLVeqhPo+MF4gfY8TYRUx+P3Af2tZmNmf0JHHANe5Fb6j3aXBtnesfn+jJvtfWeUz3CA5WzGyVTy73mUdUHyEo9tIdgQgaSQvMMlEdyjSkzUbIOeADiVSCvBZPZVQAZX3QTos79LW5Rhbco5GETCGdakdKEW15RhBRqxvaj+642NgA/UN42/+1hU1gfYujS4r3oGLKXH5XzuEMNKg4hIvhU/rnrcEGAVi9RWmcc8OIuoiC4Bsi+tBgXKZonC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91rOlhDJh/LuDoI3db2gZWZQapgGdrR8nKNEwYWe+/g=;
 b=IZ7+iY0Q883KotflTOfZ46sztM3AAZu+FOPL6CguNNqL6wDrSVl5iQQC+jBx72jFwdEk5IDzcDk9Nex1SxrsboYZnH5izzQQpaAKHCIRTntHSMvlLAQ8049wD5MQJVnADfO8s6/CemQQ3g7JR3/oFwWG436QqSnzdxKVbJBooYZ4MdS4zoIoA7vSiUcdNVgfAiNUg6+kDQVzEcT9DUsaY+a1gGj6iwiwGAijxRKoL5RT6IN/AiMjonPLJksatzI2sYyekkLt7anvUZZ51sFW5QgANgU1Qixxs1U1WqxQUzO03yxP7X7JTe3daOM0yb4tRGw9AF2B2Y192QGcg3EXaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91rOlhDJh/LuDoI3db2gZWZQapgGdrR8nKNEwYWe+/g=;
 b=dl4KQpF3EqUmgiwyYewwBClJK/1WgIj2YD7ngJRJNBkEiuJLsFYSjpKeX9F0u9ebRSuhwC/dMktM5pWE9+1CnsF1uLM/3MWI6iSoG1NN1GBOHRIFTE6eP4vhZQY7YDttgI1ZmN93CtgmhSkcYKOs3gVc/lbLvgd3kPgKUgHusrM=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by PH8PR17MB6810.namprd17.prod.outlook.com (2603:10b6:510:23b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 15:24:22 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 15:24:22 +0000
From: John Ripple <john.ripple@keysight.com>
To: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, John Ripple <john.ripple@keysight.com>
Subject: [PATCH 1/2] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
Date: Wed, 20 Aug 2025 09:24:06 -0600
Message-ID: <20250820152407.2788495-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0097.namprd15.prod.outlook.com
 (2603:10b6:930:7::19) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|PH8PR17MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 09abd5f3-9da3-458c-f477-08dddffda39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JJmHRnYMweSO+OFihdwDrvy2Ntfzi82uWHWtDW0uONi4UIe462tIy7fTauU/?=
 =?us-ascii?Q?2mW8CNDiO6Hdd/dp3kxicDI32VnMKy9JWNprb/2aNmhbCwTG7PAJZuHrSy/D?=
 =?us-ascii?Q?/t+57Ctb41udYtnAsLleJbhfE1r/kZc0LPLTjJaQB7My0hon9tpnXyHjC8R/?=
 =?us-ascii?Q?n6/oD/OSGzgHwW5PdralvvLhUVB46jUlt6oD9ynbZ+rp1ZTnUXbcDZRow48R?=
 =?us-ascii?Q?FEb51vJwXsO0RsR3JC98EYlsCl0hSW4bXZIR3MZG8hDgWVt4bNUbRchBFjJu?=
 =?us-ascii?Q?07cdZwm68WJjvbeXrXWYRVsvszLs+b7liyi5sCGP8ylvpAqoSyVTBwvLTJ4h?=
 =?us-ascii?Q?P79tpg1AzleSim33w9AsLw8mNhRRg0mpsEcIAuPQQbP+MAUONQWas3DUX/8z?=
 =?us-ascii?Q?KInxsbhMbkj11MEF6sSlUjOoMR/kWHFbtOJXOyKdVBxXFTvhiWf9bhuiq5j1?=
 =?us-ascii?Q?l6dmFY0UUgMTU/wahdfy5NVqODmBUp2w5wWcd8jhcAWpQcRZdEYJ1Gjw4io7?=
 =?us-ascii?Q?GCbfMJAyvPbJFmnXmE8P2c1DmhNC6bDpR0FV4fiT/A0z+atpylfZh21LdNue?=
 =?us-ascii?Q?bfE2LhCs5Id8mG08wdRvGvS/DWZEvSN7BnOwoyrOcdoFnLXLm1zo5s/LNbrA?=
 =?us-ascii?Q?0NnLkB9c0wBxFdxj6Pz88Kq+JqLM0QlF4hPwJg7XGf3HSAWOtPGvfdaNQ/4N?=
 =?us-ascii?Q?Cxwhm+RObo1AZ2jCmmFCas+i6U0FHvwEJzJfaGi5SW5zyAXWDAp/YEnowFXj?=
 =?us-ascii?Q?9N6q3dHRfkA+sOe+ZhU8upMyWnaLycPkS33M3m1cebH7aUpFqvHQCUohCHTl?=
 =?us-ascii?Q?4Ks3QWpONArFfzP8uQyrQGgC/GKKyDGmD+GdJnhjhQ+0bAcPzkrxTF0wl9oq?=
 =?us-ascii?Q?Fk+hkdw2p2DbtMpaivX9PgaaUxFo3tKLGr/KSzj4GyE3Fx8yfrXrLmGar/7z?=
 =?us-ascii?Q?7EF5rVaRWApPywQBOdHMMzdXvaLQRNWLz2a/k+Jk+9Mm5Qqj8w/qpPVOsd71?=
 =?us-ascii?Q?uVh+T4QUTA5q1cN4AvOEe8KJh2cNfXJ5GqKY2LyYPShTrmxVAJmyGecqs+HZ?=
 =?us-ascii?Q?UXIQFbVZYmNbscHVK8K81ftYASDcuIqVAOKDnz/jcicIPxEkJXCEf/0ySJXw?=
 =?us-ascii?Q?o6+6WeKHfBfuFGEzPF8qzGl+4Qgyv5xCpm47hV6wMO9qmuEKxE/iP94uRrL7?=
 =?us-ascii?Q?3qQwyw/q+kGTMyVPG0XnCXQZ7qsBzYgMZ4cY0SiKT7EibWBGzmFu0z5X88ir?=
 =?us-ascii?Q?LhmzBrbUb12rYJreGiUhCSfUDarVNio1zqy7FAG25xGn5hO6m4zo/LR0v23m?=
 =?us-ascii?Q?i1AzyMGPmL6i2VE1dNRExjGqaTH3sxe5T80sskWo0Zqfr65OM1zHskSUGsdd?=
 =?us-ascii?Q?vWA9hZFNs09qOCDm9jPJzRjWRbGVnwwZxDJR9u62pJ0VuG8BKvWpm6OA5isQ?=
 =?us-ascii?Q?2D4usaXs+Ps=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR17MB6130.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vKkEUexZ34O2gRFKhz28DOb+27MIuHmxXV+UfyUJSd4jRt8RYsfGD2J3PWen?=
 =?us-ascii?Q?ABxOK40WXVjU8Zq8hR55Fz4vEOkoUrIi0Z5mF+0HkAUIhxuygHcwaJPosegy?=
 =?us-ascii?Q?+85t+aqFC0RDIYO6uj0RVtWWgCUbO9PuCi/oMYbtOQpvFa9GiDLEZkwluvlj?=
 =?us-ascii?Q?vzz8QjolXy3x3Chj9cIWIUAA1fnvUGAJlUn0x1i3M6pASWXS2xODMnliL9D8?=
 =?us-ascii?Q?QJ+uUa/LKaPn5kLHqZ1uiM4XDAgVjKZpn7+j91vtrM5+ken6Ej3IGUnasC5x?=
 =?us-ascii?Q?Au2B1BymbZKmc8ZVGkrOLTEm6QVlNpShA94kRhtScC7V9qK4LuJvzFtGTnry?=
 =?us-ascii?Q?oolYUkWb0sg3nxPE2y3eRn7OH12k8N70M+k+qS8u4uELfvO9FHYtoA0OzI6U?=
 =?us-ascii?Q?nqf9EZ/78YlR6e7ezEW9OmYGz5yrZALpw0DY0jHI+pWfqoGaQxVm4NlUg8B6?=
 =?us-ascii?Q?+CUiGPu5IPJXxSDU4rjexpffBNmHGbIvVM+YL/X9HglaFpD2ZGaSBat/wLWB?=
 =?us-ascii?Q?XOhK67ezxE7MRGV5pT7CKSvD3uy1hfU7+pT8pemPugrNMjgJGV2mVRDcTzf6?=
 =?us-ascii?Q?o/R6Yk/pLmohPEDll/GagGlVW/Oh8fwXq2ZIgtLF3exNlx8fVo249TE4llto?=
 =?us-ascii?Q?Ww6JJBCcc88TylJ1MEVRdQZgoXppBcKSS2ReZbX60QVMupIbzfluEJ390KTp?=
 =?us-ascii?Q?d8L321nzNhGDbxmAp/ON2aXFeLxpPbuX+LrZPhFjLoYWMcU8mvi/Du7TWHRL?=
 =?us-ascii?Q?ayHIhbOHOBVzEpD00yJpn6P5/2iQNmxzZU6iiNIoiGG/pa3PHpW+4XM7lwa7?=
 =?us-ascii?Q?wA1HeWDbnqmTryN5xtfjFXxlBnbzCTs8MWNgex3FOqTfaJou89br7sloAWiX?=
 =?us-ascii?Q?Rb92tDpZ9Z/phwtet0Rcun15Y62CuorWd5vmSLrT4ESduiSruRYTX04hfsVd?=
 =?us-ascii?Q?YcOhNmss+R0ui4FrS1JQUrAfIvnyIeY7gEKr5/kCGQ5eBGSmD/n98lbQZ6MB?=
 =?us-ascii?Q?DT/Irbf1wtx+lagp2sRmXRJ8viqwLj9Iu3leXqdy0Obg41BTPuzWMNk6c6pp?=
 =?us-ascii?Q?5oDKYJqa86BsEtY22pxqh9p+OMdnqlqNJo9p57+2d1elS2g/PB840ZV0zzIj?=
 =?us-ascii?Q?2VBJWqRf6ME27JnbT2OnDrhIG6WKlIYmEmvx+k7TMofmW0BnPI7fWWLKpu+Z?=
 =?us-ascii?Q?5nXW/g8A/yF1DrvZfIgBdLiMELZYmm4Vjdc4yPCSwL8HRyLJszcgc/sAV9kg?=
 =?us-ascii?Q?Yp+7VvS8EqbJkBZrEcR0KHi9VH6HDOQI9HtjpWlFHKdlb0+O9cUDHdcyBm29?=
 =?us-ascii?Q?FMsmU7Bl829nhPsyhd+kRZo1e7urD9zGZUWnH0KML6BR7AZIHrCCONrkEn6J?=
 =?us-ascii?Q?rQkS03x3PU6xRXKcVirVMF2HKpTeR5zDc56J3wFOeTNDzgcGZatM8XVkxRIE?=
 =?us-ascii?Q?wa6zEEUAjAX9IZn6JuG4SUQlQh2P/wLMQYoCbeM4o3DRyJfi1XimN9rHEAnC?=
 =?us-ascii?Q?FEMi3rEhz1n5Z0Ofl2eu6fT3PFFZNqKu9jvoo8ciJkSCCy4zi21EJ0SsNDQd?=
 =?us-ascii?Q?l/o6AZS6yqFzyArprZBjAPkVJyB1xOweuxkPtC4K2Z6MpT6JumxE0RkfFTZO?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5NIZtBhzDWCv0et23UoCzLKmLexbB8Y6fcdpIuN3I0+6HHFEg2CqXQD2fnGNiiewYiEUCwAGzmr6WjL1XTZuD1PlygYik4u2ncCM07RLItoRwGVL9gNzgeBSfG8zaJAJW3siNfVSJSOvkHoNchhY80Ui/UT+z6dDsQi9aYURcRf5ZtoSRZ9RD64mZ2qNTVqTHSfvR9ul7Gj2eQqsE/9T61fyOKHx7nToJCYLOhKvhogBerc1fGTREcqmU9joCOxVv169Pcc05QZmagrZj/Icb88j0ZQg0fCwYfrbxVW0kwX8VqJoZc3dZChDexogJEf6zQZgUPWxSvBwE6Gem8/NGkTFNNGuNzyZlprr5wf5nAENdu6SujXjMstRIMw/RVywt2sLoMkYgjfdv3Os52sVEnDX0dXn+dTdTwOH9zTRnRQzS7AAXAyj2H7UOBozM5auCuW34CChwD2KIZBnoObWAB1w/oUJksxS5A2DMFhPupfTunJ1VNquDptEv1TiwPNA7dpkxylI23a/41ltPHkouIA6aPbDZM88fot72qgXaXgN7ZuODox8HMRGLXkRqx+C2TZd1RShKfnzmM/JgRYZGwQQixU6wDO6TOZi7z/a1PaFiXeQbPSuasVL5PeQEHSY
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09abd5f3-9da3-458c-f477-08dddffda39b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 15:24:22.5230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JetA4WhlJanS0u1Io6wSV+qKjZ7mplYvPRcwt+1ZKoAJGMfML7tcPgmgmsIjf0HrTr6BYxqao+01xhrPBpeuckeo4Gar4P43Zm3JGJkejC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR17MB6810
X-Authority-Analysis: v=2.4 cv=EoyLbScA c=1 sm=1 tr=0 ts=68a5e8b2 cx=c_pps
 a=+wTz3zXVXQH4ZUjsIrltNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=vu2TTH8h0NUA:10 a=F6MVbVVLAAAA:8
 a=SM69HdVMXvxhhzVWeQ0A:9 a=6mxfPxaA-CAxv1z-Kq-J:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 3AlEGJzaT7K6XFiYAU6R-PBuBAkUz9xY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDIyMyBTYWx0ZWRfX7V9inIGLQc0f
 dg1M+a7f0lFpqcCJQYnPnQGjt2ZyKUCqALcopb6qgo2gQgf1q3wtDuj6bwpzQI2i3pe3A24j9gm
 YTfOZ9qqtXO6oqcNGNphIIPDFpP6S863cbByTZ41fqKH/P+vzGav00C/ZLznrlQrRlEpn2mrKd9
 Xy3voiV9E9ZMFLkXdt70yfJFQUj+0ytqnavZZoeFBgU46Hww10PKU6yqyy+3yZBfdYZU3cmxKVk
 zQ9nndakGlpSozune9obkPm3kWpHQt687P/EBbqIoolcdQBJSMum7xe0W0ciOeneZH6CxoRpc1g
 r6O3o4gwvlQXohy+iRb4573Cml8vqUQRUsVNYbb8vB+Yr/ueOlDVqxT3wFNrN/mB6312MO5YfhZ
 G2M7IbRRaSVjLXPf/Qmzv1pW6Tg4/A==
X-Proofpoint-ORIG-GUID: 3AlEGJzaT7K6XFiYAU6R-PBuBAkUz9xY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190223
X-Mailman-Approved-At: Wed, 20 Aug 2025 18:39:50 +0000
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

Add support for DisplayPort to the bridge, which entails the following:
- Register the proper connector type;
- Get and use an interrupt for HPD;
- Properly clear all status bits in the interrupt handler;
- Implement bridge and connector detection;
- Report DSI channel errors;
- Report Display Port errors;
- Disable runtime pm entirely;

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 287 +++++++++++++++++++++++++-
 1 file changed, 281 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 464390372b34..75f9be347b41 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -37,6 +37,8 @@
 
 #define SN_DEVICE_ID_REGS			0x00	/* up to 0x07 */
 #define SN_DEVICE_REV_REG			0x08
+#define SN_RESET_REG				0x09
+#define  SOFT_RESET				BIT(0)
 #define SN_DPPLL_SRC_REG			0x0A
 #define  DPPLL_CLK_SRC_DSICLK			BIT(0)
 #define  REFCLK_FREQ_MASK			GENMASK(3, 1)
@@ -48,7 +50,9 @@
 #define  CHA_DSI_LANES(x)			((x) << 3)
 #define SN_DSIA_CLK_FREQ_REG			0x12
 #define SN_CHA_ACTIVE_LINE_LENGTH_LOW_REG	0x20
+#define SN_CHA_ACTIVE_LINE_LENGTH_HIGH_REG	0x21
 #define SN_CHA_VERTICAL_DISPLAY_SIZE_LOW_REG	0x24
+#define SN_CHA_VERTICAL_DISPLAY_SIZE_HIGH_REG	0x25
 #define SN_CHA_HSYNC_PULSE_WIDTH_LOW_REG	0x2C
 #define SN_CHA_HSYNC_PULSE_WIDTH_HIGH_REG	0x2D
 #define  CHA_HSYNC_POLARITY			BIT(7)
@@ -59,9 +63,14 @@
 #define SN_CHA_VERTICAL_BACK_PORCH_REG		0x36
 #define SN_CHA_HORIZONTAL_FRONT_PORCH_REG	0x38
 #define SN_CHA_VERTICAL_FRONT_PORCH_REG		0x3A
+#define SN_COLOR_BAR_REG			0x3C
+#define  COLOR_BAR_EN				BIT(4)
 #define SN_LN_ASSIGN_REG			0x59
 #define  LN_ASSIGN_WIDTH			2
 #define SN_ENH_FRAME_REG			0x5A
+#define  SCRAMBLER_CONTROL_MASK			GENMASK(1, 0)
+#define  SCRAMBLER_CONTROL_STANDARD		0
+#define  SCRAMBLER_CONTROL_ASSR			1
 #define  VSTREAM_ENABLE				BIT(3)
 #define  LN_POLRS_OFFSET			4
 #define  LN_POLRS_MASK				0xf0
@@ -106,10 +115,116 @@
 #define SN_PWM_EN_INV_REG			0xA5
 #define  SN_PWM_INV_MASK			BIT(0)
 #define  SN_PWM_EN_MASK				BIT(1)
+
+#define SN_PSR_REG				0xC8
+#define  PSR_TRAIN				BIT(0)
+#define  PSR_EXIT_VIDEO				BIT(1)
+
+#define SN_IRQ_EN_REG				0xE0
+#define  IRQ_EN					BIT(0)
+#define SN_CHA_IRQ_EN0_REG			0xE1
+#define  CHA_CONTENTION_DET_EN			BIT(7)
+#define  CHA_FALSE_CTRL_EN			BIT(6)
+#define  CHA_TIMEOUT_EN				BIT(5)
+#define  CHA_LP_TX_SYNC_EN			BIT(4)
+#define  CHA_ESC_ENTRY_EN			BIT(3)
+#define  CHA_EOT_SYNC_EN			BIT(2)
+#define  CHA_SOT_SYNC_EN			BIT(1)
+#define  CHA_SOT_BIT_EN				BIT(0)
+
+#define SN_CHB_IRQ_EN0_REG			0xE3
+#define SN_CHB_IRQ_EN1_REG			0xE4
+#define SN_AUX_CMD_EN_REG			0xE5
+
+#define SN_CHA_IRQ_EN1_REG			0xE2
+#define  CHA_DSI_PROTOCOL_EN			BIT(7)
+#define  CHA_INVALID_LENGTH_EN			BIT(5)
+#define  CHA_DATATYPE_EN			BIT(3)
+#define  CHA_CHECKSUM_EN			BIT(2)
+#define  CHA_UNC_ECC_EN				BIT(1)
+#define  CHA_COR_ECC_EN				BIT(0)
+
+#define SN_IRQ_EVENTS_EN_REG			0xE6
+#define  IRQ_HPD_EN				BIT(0)
+#define  HPD_INSERTION_EN			BIT(1)
+#define  HPD_REMOVAL_EN				BIT(2)
+#define  HPD_REPLUG_EN				BIT(3)
+#define  PLL_UNLOCK_EN				BIT(5)
+
+#define SN_DPTL_IRQ_EN0_REG			0xE7
+#define SN_DPTL_IRQ_EN1_REG			0xE8
+#define SN_LT_IRQ_EN_REG			0xE9
+#define SN_CHA_IRQ_STATUS0_REG			0xF0
+#define  CHA_CONTENTION_DET_ERR			BIT(7)
+#define  CHA_FALSE_CTRL_ERR			BIT(6)
+#define  CHA_TIMEOUT_ERR			BIT(5)
+#define  CHA_LP_TX_SYNC_ERR			BIT(4)
+#define  CHA_ESC_ERRTRY_ERR			BIT(3)
+#define  CHA_EOT_SYNC_ERR			BIT(2)
+#define  CHA_SOT_SYNC_ERR			BIT(1)
+#define  CHA_SOT_BIT_ERR			BIT(0)
+#define SN_CHA_IRQ_STATUS1_REG			0xF1
+#define  CHA_DSI_PROTOCOL_ERR			BIT(7)
+#define  CHA_INVALID_LENGTH_ERR			BIT(5)
+#define  CHA_DATATYPE_ERR			BIT(3)
+#define  CHA_CHECKSUM_ERR			BIT(2)
+#define  CHA_UNC_ECC_ERR			BIT(1)
+#define  CHA_COR_ECC_ERR			BIT(0)
+#define SN_CHB_IRQ_STATUS0_REG			0xF2
+#define SN_CHB_IRQ_STATUS1_REG			0xF3
+#define  CHB_FALSE_CTRL_ERR			BIT(6)
+#define  CHB_LP_TX_SYNC_ERR			BIT(4)
+#define  CHB_EOT_SYNC_ERR			BIT(2)
+#define  CHB_SOT_SYNC_ERR			BIT(1)
+#define  CHB_SOT_BIT_ERR			BIT(0)
+
+#define  CHB_DSI_PROTOCOL_ERR			BIT(7)
+#define  CHB_INVALID_LENGTH_ERR			BIT(5)
+#define  CHB_DATATYPE_ERR			BIT(3)
+#define  CHB_CHECKSUM_ERR			BIT(2)
+#define  CHB_UNC_ECC_ERR			BIT(1)
+#define  CHB_COR_ECC_ERR			BIT(0)
 #define SN_AUX_CMD_STATUS_REG			0xF4
 #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
 #define  AUX_IRQ_STATUS_NAT_I2C_FAIL		BIT(6)
+#define  AUX_IRQ_STATUS_I2C_DEFR		BIT(7)
+#define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
+#define  AUX_IRQ_STATUS_AUX_DEFR		BIT(4)
+#define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
+#define  AUX_IRQ_STATUS_SEND_INT		BIT(0)
+#define SN_IRQ_STATUS_REG			0xF5
+#define  HPD_PLL_UNLOCK				BIT(5)
+#define  HPD_REPLUG_STATUS			BIT(3)
+#define  HPD_REMOVAL_STATUS			BIT(2)
+#define  HPD_INSERTION_STATUS			BIT(1)
+#define  IRQ_HPD_STATUS				BIT(0)
+#define SN_IRQ_EVENTS_DPTL_REG_1		0xF6
+#define  VIDEO_WIDTH_PROG_ERR			BIT(7)
+#define  LOSS_OF_DP_SYNC_LOCK_ERR		BIT(6)
+#define  DPTL_UNEXPECTED_DATA_ERR		BIT(5)
+#define  DPTL_UNEXPECTED_SECDATA_ERR		BIT(4)
+#define  DPTL_UNEXPECTED_DATA_END_ERR		BIT(3)
+#define  DPTL_UNEXPECTED_PIXEL_DATA_ERR		BIT(2)
+#define  DPTL_UNEXPECTED_HSYNC_ERR		BIT(1)
+#define  DPTL_UNEXPECTED_VSYNC_ERR		BIT(0)
+#define SN_IRQ_EVENTS_DPTL_REG_2		0xF7
+#define  DPTL_SECONDARY_DATA_PACKET_PROG_ERR	BIT(1)
+#define  DPTL_DATA_UNDERRUN_ERR			BIT(0)
+#define SN_IRQ_LT				0xF8
+#define  LT_EQ_CR_ERR				BIT(5)
+#define  LT_EQ_LPCNT_ERR			BIT(4)
+#define  LT_CR_MAXVOD_ERR			BIT(3)
+#define  LT_CR_LPCNT_ERR			BIT(2)
+#define  LT_FAIL				BIT(1)
+#define  LT_PASS				BIT(0)
+
+#define SN_PAGE_SELECT_REG			0xFF
+#define  SN_PAGE_SELECT_STANDARD		0x00
+#define  SN_PAGE_SELECT_TEST			0x07
+#define SN_ASSR_OVERRIDE_REG			0x16
+#define SN_ASSR_OVERRIDE_RO			0x00
+#define SN_ASSR_OVERRIDE_RW			0x01
 
 #define MIN_DSI_CLK_FREQ_MHZ	40
 
@@ -151,6 +266,7 @@
  * @dp_lanes:     Count of dp_lanes we're using.
  * @ln_assign:    Value to program to the LN_ASSIGN register.
  * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
+ * @no_hpd:       If true then the hot-plug functionality is disabled.
  * @comms_enabled: If true then communication over the aux channel is enabled.
  * @comms_mutex:   Protects modification of comms_enabled.
  *
@@ -189,6 +305,7 @@ struct ti_sn65dsi86 {
 	int				dp_lanes;
 	u8				ln_assign;
 	u8				ln_polrs;
+	bool			no_hpd;
 	bool				comms_enabled;
 	struct mutex			comms_mutex;
 
@@ -987,6 +1104,11 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 	int ret;
 	int i;
 
+	/*
+	 * DP data rate and lanes number will be set by the bridge by writing
+	 * to DP_LINK_BW_SET and DP_LANE_COUNT_SET.
+	 */
+
 	/* set dp clk frequency value */
 	regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
 			   DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
@@ -1105,7 +1227,10 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
 
-	/* Train until we run out of rates */
+	/*
+	 * Train until we run out of rates. Start with the lowest possible rate
+	 * and move up in order to select the lowest working functioning point.
+	 */
 	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, state, bpp);
 	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 	     dp_rate_idx++) {
@@ -1116,9 +1241,13 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 		if (!ret)
 			break;
 	}
-	if (ret) {
+	if (ret || dp_rate_idx == ARRAY_SIZE(ti_sn_bridge_dp_rate_lut)) {
 		DRM_DEV_ERROR(pdata->dev, "%s (%d)\n", last_err_str, ret);
 		return;
+	} else {
+		DRM_DEV_INFO(pdata->dev,
+			     "Link training selected rate: %u MHz\n",
+			     ti_sn_bridge_dp_rate_lut[dp_rate_idx]);
 	}
 
 	/* config video parameters */
@@ -1298,6 +1427,69 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
 	return 0;
 }
 
+static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
+{
+	struct ti_sn65dsi86 *pdata = private;
+	struct drm_device *dev = pdata->bridge.dev;
+	u32 status = 0;
+	bool hpd_event = false;
+
+	regmap_read(pdata->regmap, SN_IRQ_STATUS_REG, &status);
+	if (status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS))
+		hpd_event = true;
+
+	/*
+	 * Writing back the status register to acknowledge the IRQ apparently
+	 * needs to take place right after reading it or the bridge will get
+	 * confused and fail to report subsequent IRQs.
+	 */
+	if (status)
+		drm_err(dev, "(SN_IRQ_STATUS_REG = %#x)\n", status);
+	regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
+
+	regmap_read(pdata->regmap, SN_CHA_IRQ_STATUS0_REG, &status);
+	if (status)
+		drm_err(dev, "DSI CHA error reported (status0 = %#x)\n", status);
+	regmap_write(pdata->regmap, SN_CHA_IRQ_STATUS0_REG, status);
+	if (status)
+		regmap_write(pdata->regmap, SN_RESET_REG, SOFT_RESET);
+
+	regmap_read(pdata->regmap, SN_CHA_IRQ_STATUS1_REG, &status);
+	if (status)
+		drm_err(dev, "DSI CHA error reported (status1 = %#x)\n", status);
+	regmap_write(pdata->regmap, SN_CHA_IRQ_STATUS1_REG, status);
+	if (status)
+		regmap_write(pdata->regmap, SN_RESET_REG, SOFT_RESET);
+
+	/* Dirty hack to reset the soft if any error occurs on the DP side */
+	regmap_read(pdata->regmap, SN_IRQ_EVENTS_DPTL_REG_1, &status);
+	if (status)
+		drm_err(dev, "(SN_IRQ_EVENTS_DPTL_REG_1 = %#x)\n", status);
+	regmap_write(pdata->regmap, SN_IRQ_EVENTS_DPTL_REG_1, status);
+	if (status)
+		regmap_write(pdata->regmap, SN_RESET_REG, SOFT_RESET);
+
+	regmap_read(pdata->regmap, SN_IRQ_EVENTS_DPTL_REG_2, &status);
+	if (status)
+		drm_err(dev, "(SN_IRQ_EVENTS_DPTL_REG_2 = %#x)\n", status);
+	regmap_write(pdata->regmap, SN_IRQ_EVENTS_DPTL_REG_2, status);
+	if (status)
+		regmap_write(pdata->regmap, SN_RESET_REG, SOFT_RESET);
+
+	regmap_read(pdata->regmap, SN_IRQ_LT, &status);
+	if (status)
+		drm_err(dev, "(SN_IRQ_LT = %#x)\n", status);
+	regmap_write(pdata->regmap, SN_IRQ_LT, status);
+	if (status)
+		regmap_write(pdata->regmap, SN_RESET_REG, SOFT_RESET);
+
+	/* Only send the HPD event if we are bound with a device. */
+	if (dev && !pdata->no_hpd && hpd_event)
+		drm_kms_helper_hotplug_event(dev);
+
+	return IRQ_HANDLED;
+}
+
 static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -1335,9 +1527,48 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 		 * for eDP.
 		 */
 		mutex_lock(&pdata->comms_mutex);
-		if (pdata->comms_enabled)
+		if (pdata->comms_enabled) {
+			/* Enable HPD and PLL events. */
+			regmap_write(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
+					PLL_UNLOCK_EN |
+					HPD_REPLUG_EN |
+					HPD_REMOVAL_EN |
+					HPD_INSERTION_EN |
+					IRQ_HPD_EN);
+
+			/* Enable DSI CHA error reporting events. */
+			regmap_write(pdata->regmap, SN_CHA_IRQ_EN0_REG,
+					CHA_CONTENTION_DET_EN |
+					CHA_FALSE_CTRL_EN |
+					CHA_TIMEOUT_EN |
+					CHA_LP_TX_SYNC_EN |
+					CHA_ESC_ENTRY_EN |
+					CHA_EOT_SYNC_EN |
+					CHA_SOT_SYNC_EN |
+					CHA_SOT_BIT_EN);
+
+			regmap_write(pdata->regmap, SN_CHA_IRQ_EN1_REG,
+					CHA_DSI_PROTOCOL_EN |
+					CHA_INVALID_LENGTH_EN |
+					CHA_DATATYPE_EN |
+					CHA_CHECKSUM_EN |
+					CHA_UNC_ECC_EN |
+					CHA_COR_ECC_EN);
+
+			/* Disable DSI CHB error reporting events. */
+			regmap_write(pdata->regmap, SN_CHB_IRQ_EN0_REG, 0);
+			regmap_write(pdata->regmap, SN_CHB_IRQ_EN1_REG, 0);
+
 			regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
-					   HPD_DISABLE, 0);
+					HPD_DISABLE, 0);
+
+			/* Enable DisplayPort error reporting events. */
+			regmap_write(pdata->regmap, SN_DPTL_IRQ_EN0_REG, 0xFF);
+			regmap_write(pdata->regmap, SN_DPTL_IRQ_EN1_REG, 0xFF);
+
+			regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN,
+			IRQ_EN);
+		}
 		mutex_unlock(&pdata->comms_mutex);
 	}
 
@@ -1884,8 +2115,12 @@ static inline void ti_sn_gpio_unregister(void) {}
 
 static void ti_sn65dsi86_runtime_disable(void *data)
 {
-	pm_runtime_dont_use_autosuspend(data);
-	pm_runtime_disable(data);
+	if (pm_runtime_enabled(data)) {
+		pm_runtime_dont_use_autosuspend(data);
+		pm_runtime_disable(data);
+	} else {
+		ti_sn65dsi86_suspend(data);
+	}
 }
 
 static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
@@ -1943,6 +2178,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(pdata->refclk),
 				     "failed to get reference clock\n");
 
+	pdata->no_hpd = of_property_read_bool(pdata->host_node, "no-hpd");
 	pm_runtime_enable(dev);
 	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
 	pm_runtime_use_autosuspend(pdata->dev);
@@ -1950,6 +2186,45 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	if (client->irq && !pdata->no_hpd) {
+		enum drm_connector_status status;
+
+		pm_runtime_disable(pdata->dev);
+		ti_sn65dsi86_resume(pdata->dev);
+		ret = devm_request_threaded_irq(pdata->dev, client->irq, NULL,
+						ti_sn_bridge_interrupt,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						"ti_sn65dsi86", pdata);
+
+		/*
+		 * Cleaning status register at probe is needed because if the irq is
+		 * already high, the rising/falling condition will never occurs
+		 */
+		regmap_read(pdata->regmap, SN_IRQ_STATUS_REG, &status);
+		regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
+		regmap_read(pdata->regmap, SN_CHA_IRQ_STATUS0_REG, &status);
+		regmap_write(pdata->regmap, SN_CHA_IRQ_STATUS0_REG, status);
+		regmap_read(pdata->regmap, SN_CHA_IRQ_STATUS1_REG, &status);
+		regmap_write(pdata->regmap, SN_CHA_IRQ_STATUS1_REG, status);
+		regmap_read(pdata->regmap, SN_IRQ_EVENTS_DPTL_REG_1, &status);
+		regmap_write(pdata->regmap, SN_IRQ_EVENTS_DPTL_REG_1, status);
+		regmap_read(pdata->regmap, SN_IRQ_EVENTS_DPTL_REG_2, &status);
+		regmap_write(pdata->regmap, SN_IRQ_EVENTS_DPTL_REG_2, status);
+		regmap_read(pdata->regmap, SN_IRQ_LT, &status);
+		regmap_write(pdata->regmap, SN_IRQ_LT, status);
+
+		if (ret) {
+			return dev_err_probe(dev, ret,
+					     "failed to request interrupt\n");
+		}
+	} else {
+		pm_runtime_enable(dev);
+		pm_runtime_set_autosuspend_delay(pdata->dev, 500);
+		pm_runtime_use_autosuspend(pdata->dev);
+	}
+
 	pm_runtime_get_sync(dev);
 	ret = regmap_bulk_read(pdata->regmap, SN_DEVICE_ID_REGS, id_buf, ARRAY_SIZE(id_buf));
 	pm_runtime_put_autosuspend(dev);
