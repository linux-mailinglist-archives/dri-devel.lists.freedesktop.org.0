Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DEDC9F0B8
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C0A10E791;
	Wed,  3 Dec 2025 13:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.b="p+LGp3Zq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5444810E793
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 13:03:56 +0000 (UTC)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B3APg3A202214; Wed, 3 Dec 2025 13:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=cc:content-transfer-encoding:content-type:date:from
 :message-id:mime-version:subject:to; s=PPS06212021; bh=aRs3WmxQT
 NKqN26QLO+B7UW7EY2RrnXklSNZ3AeBv0k=; b=p+LGp3Zq6OGXBWI/w3kesGMQb
 Yh8g0MfJ7HuR7ZGLtnNkMWGedXDi8RVx6p54Xxbsey0zKqi36RMtSbpP87xT4H70
 178mkhY9Vrv3mOG2RdaVSXeamY/uNTSimsYKoLcdOnOVwjxa5ghQhitbEzopcwfs
 81+hb732w4UXUHSTv4AWQzIC9XLhaEkBVyRRnfv1U9qb6DXQRRT9hztxcCM6TMDD
 CeeEHWiIWd2b8PSVKoisNPqaSJKX81Nxx+5HHsGFPEQuaGQsPWhGza/9OMla6U7C
 tCjrJypBf0oSDbLJc7bTaMLOJ76Sxy7TbEsAhjnRtmSVwJdt+E3voNsE3yFEA==
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010004.outbound.protection.outlook.com [52.101.46.4])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21w274-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 03 Dec 2025 13:03:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTcje4ngR0sGuDWuSdqJBXDGBMDPtmNe3QbHVzqXzOnSR0tONAX2+D2NRHZVX0GhYPsRZx62Ed06Hr2iHRXl3KDKC5GXJCl9ZlKggPTYtQurPFCMgPcr3mGPnLTJHUH87B+2uKHaAs80BwKrl3t0bO+0KMt+KDww/r0WCWAtRnl4sTS0r2Ta2W5NPRC+NDWRX+BXtfY5SsFSC0zfzvdgsapGdgDK5VSImt1OK1tKcIwO+VylotPMlb4QHP0kXNCmmmMLaN4tJmZYd8yYAkMl3JG0IzVrFlH7FnA8SMSPXzH16HHSHpqr+Y7XeFG0tmkpl5ReD/0O+rrrQ0w96L6Weg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRs3WmxQTNKqN26QLO+B7UW7EY2RrnXklSNZ3AeBv0k=;
 b=tbVT3zXViFFp4Rrelxlduli1v6QYAwc/0bg6zIG324lGUsEvz+rw1tMTiKU8AzSFrkC4faORP1mK2c3jOl5Svl7xdjvr/UxVP9WarXrWIhnZlvDSse8zHW32VLYbSug27KoFZb7Qnvm2JesGSb/1UBOVt25QV+HjtcbSS8sO11y7z2RmK0z5x7bE2K8AhHrOVm2Wid4u0I2+pKo1CbM99SXzqmjvX684znK7I2KVp4j64ZIHvuiD2asHeggeinXMCWZUJw9fuLx5lR8Sk/mObNLDJO0kqV79i6dHFz/9BgsWDw5hmgZ7udDFnITLORcaEVQLHUY4xh3ZGQFnDwSDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SJ0PR11MB5136.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 13:03:42 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:03:41 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: mcanal@igalia.com, mwen@igalia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, xiaolei.wang@windriver.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/v3d: Set DMA segment size to avoid debug warnings
Date: Wed,  3 Dec 2025 21:03:23 +0800
Message-ID: <20251203130323.2247072-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SJ0PR11MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f702185-4526-41b0-9d17-08de326c620d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rtrezt3GwJdWA4OhFL/8eRvByc2YR9qdQFq4cbfqilCZHdh4C5LbjaMPvLV3?=
 =?us-ascii?Q?7pU232Hk8cTeteSkNR/jyLCDZzp4gLhY0OU1uLRQR0ljnkmTLxgTcHkUd9AU?=
 =?us-ascii?Q?Kd+9ID1N7+4TBmo/+5m44XRtc3cnBdNyinv4p61kjwvqJqxnBfZ7thTcQZqn?=
 =?us-ascii?Q?dmp+8Fy8t3z75+lN7IFjVaTmJox/13HM2ilyHhPZiswD+EF2dFM2p3YI7YBt?=
 =?us-ascii?Q?hYIMzgFtdwPqS7n4hLOxR3I90HUY4n2+nHHirhWUtSQT/vUxFVZwTV8yj6gt?=
 =?us-ascii?Q?gLRnpcwHN7qqnapfRUDqrHVD7Hy5dzmo2FdR4UbR90QzGhp1+MmxnkP+M/Wo?=
 =?us-ascii?Q?X9lF3nwzTjOYffZ3Igv+zDK6tioBx9bGzsjNY3qaCpHwPGQedROrPUQI4Ic+?=
 =?us-ascii?Q?o3I1Cdov9z1lznB9HTBmPrj5o3Z/T26xY2rPggIs0xc3k090aqygfjFgs0bR?=
 =?us-ascii?Q?6G5L3mma3/cTiQ8ZvQXCL3ln3BtUx7GWH7fhx5K+YHlMSFZGmecwiXhjZH26?=
 =?us-ascii?Q?WxB24b5Vk+jvsy0jmV8qfiZXKPNWGW64qZ9DgTykqJXp6U1eaOC68GXw7bvn?=
 =?us-ascii?Q?R2m1j53gQEhUo7PbPDUmTud6UGC3tCF3jLVLcfT30aSYD4jKyGZ7EmLaghHm?=
 =?us-ascii?Q?7BBOqVsXf05EJuK0Q4thB9FfDaPz37KohaZ7LQ1SmErXYCP7w/oGmeG7wqGQ?=
 =?us-ascii?Q?A4PnYbGHziGAuDJ7aS253eXManzHWXuZpanUeeubZmt2jnNH6bLotWexk4Lr?=
 =?us-ascii?Q?AqQZmDVnUGNEoHVcOH8+OZAgeVZntRNZCPlO+lsHxZ0Pr4LfAYPCg1CEO00Y?=
 =?us-ascii?Q?fwteYXR+zTDnZAhQ9sT+6EkoO/KOqyjiVsMXTyLIpcINlUfqllzJBX2hDifX?=
 =?us-ascii?Q?Atl00U9DNExnGZT+ZA4gFhvGpVjCfv15h5lVGypqG2AtTG7W5yPvaWJTd7yo?=
 =?us-ascii?Q?rcqo2k4aqjy2AlhRQVFl8Cu/TVByNlyx5D8O+dVNyTmcqgM2GJPJMmHXLUJx?=
 =?us-ascii?Q?9J2+GawCOBSSMD1/VzcUEspf1sBMAykMhQwuoyN364y4JGXKR6bF74Ri1cMg?=
 =?us-ascii?Q?S4wz9UoTRFq8NyXKqIIpws3haTxmVAB+cyGjDqyRf5bJAw01J1hGmM5hvWZ1?=
 =?us-ascii?Q?6GWXQsotJaA+6BKa4F+CIkgnjqzuJBuvCrOwxmiIS7Ol42FMtqhd4pmzeJvq?=
 =?us-ascii?Q?OOT/sDFJKtLu7bb+EvLDNb9TEQpvFnF5IVQ88/7xLbv5/NJqVv6fyiKoHLja?=
 =?us-ascii?Q?ajA20Ya+s9Bh3t247yN5Lu+O7zuKkXz2whpp919J0QcznNiRnThVqAocOF7J?=
 =?us-ascii?Q?PE9eeoD2D/jzJA0PXEPQD2nLFasUVOyJMxuCEui+xZb9Qc88mAx1ET4VSwLQ?=
 =?us-ascii?Q?mxzHFLz/8Ho5XW5bS0awagbdMXTBYBUIZlWj4PB5Prc2vui79ADjgQd8yuWp?=
 =?us-ascii?Q?ktJIyYrvUsfecqt6LmYQCdCrldOXYAgY/RzD/+VgvfX/zKsHaMmRLv+5Q714?=
 =?us-ascii?Q?4reSt0kFr/Oeb1kZvZLvsA12ZDDFeFy42d3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFD667CEBB6.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EuIdyBYW6aOm4r9/tGF9yUYqsr/0AaEGLxd0pKuFxUeV/5BhkqG9qE0pwwO6?=
 =?us-ascii?Q?JsGVjus2jHBeK4z3DFWof2dgdDRTp6ZDsDRVp31Kum2hx1Bj/Sk/IpjXgeEZ?=
 =?us-ascii?Q?eW9XOsMo2nCHrRHXcfIq2PCxBSCgbaV/sQk2nWkgVUtzg+Nwbrq461QPxk3E?=
 =?us-ascii?Q?Y5nueIGbP4GQOVxCe0UTm358/Eg8TI2zcOqYkobIrr6XMqo2xji8qP0ymSaL?=
 =?us-ascii?Q?H+GubK77puBa/oG6IWQgdfzU/FC0aViwwIHvZUiNP0brflZ96jiFV0RmoYS/?=
 =?us-ascii?Q?rDdyGTF2UspJwPpp/Tqb0L0STsYXQ/z2xI6VirksbR2jNG2w5ZOswPBntCcA?=
 =?us-ascii?Q?3qc4leG80s9qvuIh+Xqg2zGtwPkRBVD0Tw42P68JkGBtAoKcthYkUh5CxjiT?=
 =?us-ascii?Q?6f2iQpn+HeI1VUWqjbiPiu8XxfiEo1UXkjp3deThlOe6e/YH9nXWRDoQMmLW?=
 =?us-ascii?Q?akp0l5bMvZ06DKcMsIdQ2cYDd2vl8rnzhezO43hHvyuBaBiBaBcw9Z2A4Vvd?=
 =?us-ascii?Q?4bOGE9P39UobE6MCbk1fqnEsA5LGM/KbsMstOjEeArOMHOnWPR2UMUoL2sKh?=
 =?us-ascii?Q?Vu7endt4ZF9OfMUUT+8Phxr0bXhJPiyrK4vidQHHfQ/rDz2wgg6KNdPxQVQE?=
 =?us-ascii?Q?ZAXlmQNIH751Mto7BIBtMoMPUjQEVyMva6PO6T+jqhJOnFUXXjDgLgwQpqnD?=
 =?us-ascii?Q?u18SUovrwjXGY+YP72Eg7yU5NIECon8snUTzUXdgdhB2uymsdwYgYUBlmlmk?=
 =?us-ascii?Q?vK4IM/SJb5hgCgNlkmxuE5ywyWK8zAX8IjBa5Mx9ydW2Nte/Zu8QG0VwWS8c?=
 =?us-ascii?Q?+DII7ukRwwRluMJhxy4BEgBldJlRSfSV3MZ4F4rSvYPVSMceQua2cbM7vHbH?=
 =?us-ascii?Q?OVrI5RKq5+8T5Vl/A1M3iVWGstWICZ4Sv0Qmo7RbagwpAyTf5sfrSdUe3+qC?=
 =?us-ascii?Q?CLNhCu2exXTgVA1c8tCoLMbkBogkhsHsPDBkyZ8qQ/5mb2n6Y5+HRCWdQhgv?=
 =?us-ascii?Q?qDjA+XRX5+1jKEXQSCRo/4FHElpK+gawpfqZDi8fxzwWjt3bL7RZOfkqZ1ir?=
 =?us-ascii?Q?StKGMFzdJBZT0aHENRcCrMpTb+zL/UqjzfX+NaX3ZoX1NBIjB/fsSvJC4Ifn?=
 =?us-ascii?Q?Zf2RyqooWfPUZWwbGIEqbC48ryLsVKnQUkbqAcFcrFKzHi7/o2ps9Zrx8bqw?=
 =?us-ascii?Q?ElA3Q1Ls/6DG3XJUzS5bNgDaRsx1NxhE/F2oC6/0uW0j0fc35wvv3S85iePJ?=
 =?us-ascii?Q?nIijLz8k3nAN/sB/pROnNliTcYiM3mgLMVQSullT8ZHOcZBxsK7XmsGyJ9ok?=
 =?us-ascii?Q?25LRvTToeWNh+2senbhjkFGGlGFsHwxTvQ0WRhcD2F8+2MsP07QzhyCmxiPn?=
 =?us-ascii?Q?7d8Bbix61PkaIx7eSBrVQR+xpeKcTOBUchryBN+mEdrkK63+cLg47iiuugp5?=
 =?us-ascii?Q?cevdWW1b34/ucndSVJYPAuedvIxyRksinZU0+3JQcVy7uoMy7Yqa9XRVp6qq?=
 =?us-ascii?Q?b0fB85A+MdmJbAk6m1QrQuGmkv3KXKNN5bsFUV5FYewwI2ZB3eEV+z9iUoqH?=
 =?us-ascii?Q?FMIPOmED9azMe+n5UQ9fWn8NA5b342EVtPe42MLm1FD3Z2i6gMcf0rQvAwTI?=
 =?us-ascii?Q?Dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f702185-4526-41b0-9d17-08de326c620d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:03:41.8551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWOCsjMTpzC7I7zbFVDmCluyBynaKXgH9694m/AOlvlt0Mgf9bFTSxMRX9cBsO9+2PxRefolTf5MButyWtsg7Rtn1PzX2jxeEX+BGJWUkjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
X-Proofpoint-GUID: 5yhcHWAHZyXp5oPq0b_ifUfq3UhYjsZI
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=69303531 cx=c_pps
 a=Yjro67SWnLjgwqeg4v/dNw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=2nXAMA55c-ftXtIlIz8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEwNCBTYWx0ZWRfX0t1Zqv2fW3oa
 nXjc8C+a5u/+yshT3YfPfg3XhPfQJ/tkF5PY55+/Gm9Ri7B++H+ZHFbxenunCmtFKQzhpE5ZjoD
 E0RTKQCcPZMu9HUkezQYHxE1tFaFIYU+dtufBI249sidOStQ3gi7wA8rbPMT6mR2ykIl5RExbic
 2IGI+bVvroqvsnqFeqFZyMDUbozfCEkRFBQ2rJ8dtxXJYsGuQfpaZSeZDVrFEwO6ui86fSuflk9
 z5F2OI8Z3hWRXW4niBK0hDDrxDcF7yv3tBx+aGv76V3CmtSLCbsVJAM99GA7Crwnutmb0X3US+g
 nC18Y00LU8n9Y4RjQc8z8u81fo/6WIxBdH0ulhU9hcHTPij0MJmmQJfFRyKMvFwY80AytAAbxoR
 Zo8NmxraHETXxwhRWeG8LqSmn239+w==
X-Proofpoint-ORIG-GUID: 5yhcHWAHZyXp5oPq0b_ifUfq3UhYjsZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030104
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

When using V3D rendering with CONFIG_DMA_API_DEBUG enabled, the
kernel occasionally reports a segment size mismatch. This is because
'max_seg_size' is not set. The kernel defaults to 64K. setting
'max_seg_size' to the maximum will prevent 'debug_dma_map_sg()'
from complaining about the over-mapping of the V3D segment length.

DMA-API: v3d 1002000000.v3d: mapping sg segment longer than device
 claims to support [len=8290304] [max=65536]
WARNING: CPU: 0 PID: 493 at kernel/dma/debug.c:1179 debug_dma_map_sg+0x330/0x388
CPU: 0 UID: 0 PID: 493 Comm: Xorg Not tainted 6.12.53-yocto-standard #1
Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : debug_dma_map_sg+0x330/0x388
lr : debug_dma_map_sg+0x330/0x388
sp : ffff8000829a3ac0
x29: ffff8000829a3ac0 x28: 0000000000000001 x27: ffff8000813fe000
x26: ffffc1ffc0000000 x25: ffff00010fdeb760 x24: 0000000000000000
x23: ffff8000816a9bf0 x22: 0000000000000001 x21: 0000000000000002
x20: 0000000000000002 x19: ffff00010185e810 x18: ffffffffffffffff
x17: 69766564206e6168 x16: 74207265676e6f6c x15: 20746e656d676573
x14: 20677320676e6970 x13: 5d34303334393134 x12: 0000000000000000
x11: 00000000000000c0 x10: 00000000000009c0 x9 : ffff8000800e0b7c
x8 : ffff00010a315ca0 x7 : ffff8000816a5110 x6 : 0000000000000001
x5 : 000000000000002b x4 : 0000000000000002 x3 : 0000000000000008
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010a315280
Call trace:
 debug_dma_map_sg+0x330/0x388
 __dma_map_sg_attrs+0xc0/0x278
 dma_map_sgtable+0x30/0x58
 drm_gem_shmem_get_pages_sgt+0xb4/0x140
 v3d_bo_create_finish+0x28/0x130 [v3d]
 v3d_create_bo_ioctl+0x54/0x180 [v3d]
 drm_ioctl_kernel+0xc8/0x140
 drm_ioctl+0x2d4/0x4d8

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---

v1: https://patchwork.kernel.org/project/dri-devel/patch/20251113092538.1971286-1-xiaolei.wang@windriver.com/
v2: compared with v1, The updated commit log indicates that this only occurs when CONFIG_DMA_API_DEBUG is enabled.

 drivers/gpu/drm/v3d/v3d_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index c5a3bbbc74c5..f4da7a94e401 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -377,6 +377,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_disable;
 
+	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+
 	v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
 
 	ident1 = V3D_READ(V3D_HUB_IDENT1);
-- 
2.43.0

