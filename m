Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA51B39C49
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 14:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D685A10E98A;
	Thu, 28 Aug 2025 12:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.b="m1Hk7Lww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C657F10E98A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 12:09:14 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57SBXMbT3832000; Thu, 28 Aug 2025 05:08:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=cc:content-transfer-encoding:content-type:date:from
 :message-id:mime-version:subject:to; s=PPS06212021; bh=22/94NztE
 gnjDYgicP9hcVYLk6yEsoZORFt4eeLly7o=; b=m1Hk7LwwYwFzNu1GMRNsXjxYd
 Dfnbwyqv4UoaGyoMFAYdOFPJtL6y+PPMpMC/DPJ07Ssq01JQu/zD4n1qVR9soMpu
 8VhS6XbtroLzpHF9aKOXkjnkj3edduY6xfdvZxsyUNOkdF/uzhpmkbFF7lgW03ff
 W3119Mh5sqsgPo2qynUUtOlj/fy/fewFyXTmdV+ETkw4tZB1p+VqzXIqqzZ9IQt+
 BNUR9TBPLC1cULh/0wHCyUM83d6A+LkF3AvhvBWjFD2p5s2RnSjgn++rpAJSAt1X
 dM5I8VVjakOaRxvqweLlrrMoAbLzidbHEXPwKh1MD6Pm85FNAA7BobTH0Jmyg==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x25pbg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 28 Aug 2025 05:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kv9NkH++MmwckGgEfE68v+IM3XpUbbF0HEMkv8zju+J8priIZxMbxi3+q2ZA7NXiDyRO89nRvD29qoR4MOgsBYqztlGvUyvMiSI2NY5MqPjBgwR2pB3MhApSIiGsddnKaG9fUSMHesJgLg53THLmwyJG4JFrh7632Z2c7GSi8ifhlLkrYxgKY5gDiBhmDobs8oAj2+rhOhKt+dv9D1aOuYa1ASWns8GxHbD50zArS3mq3ZvkzDqLFwzXO3VumU/8m8QMa9GS9zWuUqxtwYaff3/hkOBCHttjBsLjY2B4OyhwjNvJT9oA7uVM+zkJ8Yo23RxSJoc5ZaJ8USrUMBNmJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22/94NztEgnjDYgicP9hcVYLk6yEsoZORFt4eeLly7o=;
 b=kGMy5XQaETPBSqqxBD5bB+nPoG3wf5MOtvwsb/JuM1h8xM+aPe/QHEQ0UO2ZkR1neoZ4CBYDSYPIT6e6No8mRF/eF5FWbNzH7IYKmCFBilEw8m6A9asTd66iJNURhRNgk27vwXc3H4ZWpmm337AuzfHJWwXfw2CZL7U00QYpsAaO4VqHwzRri13nfjj4yznIWfG0b8nixrTKGcGN4y3NmrnTfaTDuPk9v9NrXDT/ZFXisidX9+ADIxygD2vjociWzyJPjLW2CR272CWt5awrSJxJIEqKfqT4DXCEusyTvY/U0c0+vUHKMVh8ja//ECbo+Kf0ovibmOEpi9A4vlcwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CH3PR11MB8363.namprd11.prod.outlook.com
 (2603:10b6:610:177::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 12:08:42 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::6364:ea34:bd8:1f8f]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::6364:ea34:bd8:1f8f%6]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 12:08:42 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dmitry.baryshkov@oss.qualcomm.com, airlied@gmail.com, simona@ffwll.ch,
 dmitry.osipenko@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/gem-shmem: Use drm_gem_shmem_unpin() to unpin the
 backing pages for a shmem GEM
Date: Thu, 28 Aug 2025 20:08:17 +0800
Message-ID: <20250828120817.836415-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CH3PR11MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 2770631d-1dda-4759-1b16-08dde62ba15a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nSh/fWsL7wJMiDEzA41PH99Q2W7UNd5JETwe6fAaiNtW6C/OpT+/7HN/yAZJ?=
 =?us-ascii?Q?ycP8MNU8MISd4LUCOs/CQCjz/cAInq2wJqo8Lf+MoMmM2jSOx8RWz0v8oPNr?=
 =?us-ascii?Q?aomn0dlb6WYAZ6LVfSDdcKZgOiJzX2BhxSmQV5yjcn4GMyXlCw9zOSy4RhEa?=
 =?us-ascii?Q?750TihCsXXsR/fRisfODXxLAI4/HFIlc3CJsqkPStZnSGSPUNIW/9gtPf1/o?=
 =?us-ascii?Q?aAgeKU0XkJoUJPNJT7totHdUGP2dy4AWtr9DNuORSC21VZIx9krIRhj8wXzT?=
 =?us-ascii?Q?chYs/CWNxzPSEBEn7fo19+BLOfQClmAc6dGB4kZJLMMVWouW0V/cu+spnS9f?=
 =?us-ascii?Q?6ohRawCq0hYpGgHvQe1Pma6vCOF7aquF5N0qRb87hLSkTSnXgmXChCDihyU6?=
 =?us-ascii?Q?Ud9o4sl9d8b0pvy5uezGj6vMekKcV27GNMnqtu4QtGVRno/rUgQv6LZYWZDh?=
 =?us-ascii?Q?deL8Ipln9XcnMMW/orNM/kcicu6izbWQH6S44/qD3PHKrpdwC+izCueCDAQL?=
 =?us-ascii?Q?JSBeOdu24NBY5XrrsT6ADZtjfZMUx7BwyAGl+kVuycNdEEOamv9VbdxSZ9d5?=
 =?us-ascii?Q?vUh4ItswjfEyO6lv8/GhtOljWjiyDUS0NaP2Q2UVnZsl7Ml/EWkl72y+pbBJ?=
 =?us-ascii?Q?ganSrEdvN4cgSCUaX6HEsUbAVnq7iU8yUshKZ88TINKhnplFtrCK6seAVThW?=
 =?us-ascii?Q?6Eh+4D+3lSmbLRqFeuhlKN3/2NfpKCXkpMuwO1Zii2zyWtgSX4F+eGNBRRLX?=
 =?us-ascii?Q?TyxZnY2jmOXiJH6W3gDhOd1Hr7gE97TryEthOmqhZmnQzz2E2YXCwFqnM+lD?=
 =?us-ascii?Q?KhWB7qcprKubikzKO3DRV3UaLdM/Dx7VtytilbxEOdz5Uzu4BuipYGD1M22n?=
 =?us-ascii?Q?f5T78b9JmWI3tTmfD5oD+0qMt2mTKmdxYGPsRpgdLOXRJnvHIpmNATCFp3Hx?=
 =?us-ascii?Q?L1QXcZKJQlCat9ouuxA6FgIz8HuPGQ69ejm4lOT7Kd0JtxswqXg9RvSGNROp?=
 =?us-ascii?Q?F+jmo3me5EpAQ6oWggig6TtNxFCSYQayfHX6taiwu9GzS6eOE5UNu5tDSXm7?=
 =?us-ascii?Q?zPumXsVX2pl2ohLHq4jKq80gEGjM77oFfgNqnOzqeGtkJV0CwHhp4VTHtMu6?=
 =?us-ascii?Q?dPHtQvUOiZ8wt6n8q+wOZPcRLHrAcxagFM+Cbn46LfhRuGM+xWEwuRzxuwsm?=
 =?us-ascii?Q?xO2+uj7WtdOvPX+0KJdgtnbeA+KwI/N2fq6JVDmv4r5O9lDT1MuvKmQcSAw/?=
 =?us-ascii?Q?RkEqUmcZQiDJjFkkHVk11piX9ggwY+DsgaCjWo3Zmd+y513HTHn2foweyrCy?=
 =?us-ascii?Q?C2gAV7LkbV9KTTAkizczyfx/9xStf9gLv/CAnZ6nuEHwY6nPpnAnpgaPiOlM?=
 =?us-ascii?Q?w1iPvzPak5+qi+qn/UVqDCuBmapx14pRh0L3BwlnBnbw0zwQiX+oGPdjQKGy?=
 =?us-ascii?Q?IaskmgjrXaPHVWlDfnmxKVLXAC91MT53NTWG53cM38p0e68Vb3zZPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFD667CEBB6.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YdeIH4C3ZBHsGBK8zfELPHjTDbX3CR1f8ufTgvA1HYOIFHAjZcZvBOtiWYZ8?=
 =?us-ascii?Q?nR/o9Wxa7Irt+r8O4evqvE1KAm9uL90aj2YiCBHI6pCBGfp1H3KzSU0PL6u1?=
 =?us-ascii?Q?oAztTanyPJ9leOlSLMmGyYAQsn3kZ+HH/642fnYmN4TAkdF/7/kI0sc5YW+P?=
 =?us-ascii?Q?2tpISdXeAKP/691JhrpLkJmSHo+6h/fdTxLWB6rxew3ynPyTR9fs7h5KwFJx?=
 =?us-ascii?Q?JHz7779QpJYmQBsXOt0MexdvWm17k4UFfMELfqpUqH20asmlaY+9uViuDXIY?=
 =?us-ascii?Q?MAccKwMJ64R6t5k0+B/zPinEqSUrgEtHtb8D/qKchkKPKB7qStpXmh8VRpC/?=
 =?us-ascii?Q?W4S9I2rZ1IudG4LEpOmGJRI9PuoHURJkzCmb0SZUHcdnqCWMMNV163ZfCApm?=
 =?us-ascii?Q?346COWyDS2wbEgiN6o1zADeYBvJ6jq1uhja7xliRHC1Ml1HEQ7P9ZTrTEqhG?=
 =?us-ascii?Q?IBK3r+tbS3LdTwsSGs8EE2/WXco7LfgYA7avAslrc9QHeM4fQgSVHISlCoXz?=
 =?us-ascii?Q?CLxQZvBuI8/XF+kYEC9iEcDTDD775HkDAEUNLFfMrvz6GjJfRGn9ciTSEx+J?=
 =?us-ascii?Q?trEmIt0x7qph3TxaPXpuk9nx0Av75Cpp196SMPNskFANf2R8CY5Tc/+GaFtQ?=
 =?us-ascii?Q?MXQdOvkHSDoagGN6MSqnBkLdqjUl5JxjgX0Lh+1k81+gLoIqkY86CiSaT5t4?=
 =?us-ascii?Q?y5gacelWxL0awc/YVyf+OkoeSQHaUK4+a+YkoK5l7EvnvN04Y22K6V8Hd9HB?=
 =?us-ascii?Q?RpI7Bb5yLDytaRLSSDLU2WQsff7OfJiR2tLoDQ/3GvpbzHdiTVu+PJgOjt1M?=
 =?us-ascii?Q?c4NwyqTjcerWYE/lWQjLPvUa1/3TV9sjos/wT9EieUSe9yoTvM1PSTxATr3D?=
 =?us-ascii?Q?EL4Kz8nfv4dlnWhH4qYYKItTOVpc1RjBJCU7MM1OuJrdw28IOh2JvgdfXzPs?=
 =?us-ascii?Q?+j+O0CMWQYl0d+5/CpvuL+6utY0D7dOmncxbO10LPVKtuZmBJqVOa3FNQAeg?=
 =?us-ascii?Q?DvUrdW7l8yk3uh4MsUv1obzp647dFJUkYlBhAyLeAgQoel3rpwbR0vdTMzSj?=
 =?us-ascii?Q?nh8dQ0p19gO+tPOPSCdoEMl6RXc7oRrR03uDkVzRPfuKCUH6L1wypE+DalMN?=
 =?us-ascii?Q?9y7VWp+SSHdD4X62DYoHWzIpOyMmyi6PTcPPJ1rRTx+N8stFB3vI2ZaHKRoY?=
 =?us-ascii?Q?F/2PFhcHEVgdqJFVGSD1x/h+IFpwiLjFzvuYqBGuBHLQiOkZQBtVuHEPkMD6?=
 =?us-ascii?Q?RWz2cfCj0horJ3K/Y/R8hzMwn1ZdB4JycGQuy3TzfgIoP7zObePCdsgMKE76?=
 =?us-ascii?Q?0t70JZW8YQTWwidzIVNcupcDY8fMW5VLS3rYIwjvujO8N552ao67NkSEIDBb?=
 =?us-ascii?Q?1311ajMEDTXG/FfwpMPYt3u6KodROQ3K1PYYPrfZjiiNEFO3vE2LPSKccdcK?=
 =?us-ascii?Q?Kt/u7MCAaRsQ9JevB5VrPr53AsNvzIKqlIGvHqcaK25j+pKuo5djWj+Y9AMR?=
 =?us-ascii?Q?UbIi4/O8P0PcLhj3JebgqI9Xz6eDHmFJHXGquSSM34ryQnx2Bx5k4Kkd5aWR?=
 =?us-ascii?Q?m1fkXMRQwZssTzwHEyhDO0Ni+Wgj7cVbqtbX2oWLQuTwn7zhTEjjTjshT0GA?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2770631d-1dda-4759-1b16-08dde62ba15a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 12:08:42.4679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFjLM+kVAZ2uCcVmvwMLY49jObGBXYD8/2I0NKgzo24rFgDsBl9ugjLHY7x1lhaiY7SqsQ0CVSe2ihV15lZ9m7CuIOD2zZS8k+FkIS9hO0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8363
X-Proofpoint-ORIG-GUID: Ovmq-y4DDE8_ptK6oHvJ1ZkmtER8ymTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDEwMSBTYWx0ZWRfX1GcVyQ6NsjvU
 Rl0zmcekFTotLnoEl4gM9+4H+f6gi6E0zwFncvq3BXcrcPSdY5d+nNKMUWTS5p5Q5UJrKoH+zgb
 BYBbegvSovPM3UEGzMUUFlq28RW7pAJu0fLrKO2sk4ptytjGELe7w81xaevpwLaLs7LB7osf9c3
 jQQMHzz+R9d1AQvI2SMVWPWVLCoSySOJqgXeTf8rDoCpSD71Yp00XhjthOUo4yd1aVM2esCc+rF
 hiOFB1SqcXE1T54SEwwU4EjZSwC+IeX2mspR+PMAr25DkOSvGQlZnhSBfHEv2x8glk/GNcuhlYO
 26ka7dNI2+CmGp/ZEWhsOSeaBWG96aRgt6BcIqFv3fUcq4SaX08qo5MAc/waXI=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68b046d1 cx=c_pps
 a=08oXzaogWWciT2Q7DnPvDw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=QX4gbG5DAAAA:8 a=C1uUpZZ-KwEODqPgQmsA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Ovmq-y4DDE8_ptK6oHvJ1ZkmtER8ymTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
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

Although drm_gem_shmem_free() will decrease the use count
on the backing pages and free backing pages for a GEM object,
the pages_pin_count count is not decremented, which results
in a warning. Therefore, use drm_gem_shmem_unpin() to unpin
the backing pages for a shmem GEM.

WARNING: CPU: 2 PID: 1106 at drivers/gpu/drm/drm_gem_shmem_helper.c:180 drm_gem_shmem_free+0x4d0/0x6f0
 Call trace:
  drm_gem_shmem_free+0x4d0/0x6f0 (P)
  drm_gem_shmem_free_wrapper+0x10/0x1c
  __kunit_action_free+0x50/0x70
  kunit_remove_resource+0x144/0x1e4
  kunit_cleanup+0x64/0xfc
  kunit_try_run_case_cleanup+0xa0/0xd4
  kunit_generic_run_threadfn_adapter+0x80/0xec
  kthread+0x3b8/0x6c0
  ret_from_fork+0x10/0x20

Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed by shmem")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---

v1: https://patchwork.kernel.org/project/dri-devel/patch/20250827022516.2890226-1-xiaolei.wang@windriver.com/

v2: compared with v1, update subject

 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 68f2c3162354..e0a9f3a917ed 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -227,6 +227,7 @@ static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
 		len += sg->length;
 	}
 
+	drm_gem_shmem_unpin(shmem);
 	KUNIT_EXPECT_GE(test, len, TEST_SIZE);
 }
 
-- 
2.43.0

