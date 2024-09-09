Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983F7971336
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F94310E34E;
	Mon,  9 Sep 2024 09:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="glFJwnmb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2068.outbound.protection.outlook.com [40.107.117.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F38310E34D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAs0Gjc8bpYeIdKExTRErgm/RVgPLp2Cft8QOxYsVcE3TWIQX3//l/v70y/7+41MJvpgbgad8oi+3qgskZLYk18CeyERyOIcHZc+IYPeRf6gWiRHU6Z1ZbiEBSlbE8PTlUetrW5MDAyb8SCkx362YPKTzZC/pDcuqLcCxgfzsxDnhu7ejNaqJhZQnLXSRop0pt9tWM4YUuLgkJ1NZH+sTNqV/2qu7NwjqBAbrs+scThVhnCmez42x59cQ1v9jB9bVSyDUC6WKv0YfCjpdbDiiczZLumESgsdp8gDBNpRAJmhf19dEAa13I4dGOILeOSF9cFqykL3HIZfevMx/IMduQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMzgGgj3NgwLdKXnhpYPZxgFQlER0fazfsN7tOlr61Q=;
 b=ZxCeur5Lv0mAJDS08fJtS2tpDD0e5tWw84eHq4VYxuTyWedErCvrJCGIX+NzDqQOsHn0KG8iTIz5Gmw3QUyoiS1cTiGd45nMm25sfgjxR2tqAFDGke5G+PKJwo/Qu3zUEtztUC2fiHR20m3q8tKdSJpnsBM8OW+Z1BSmGYuKTLkrNoQ9MmujxbhxIk8OH9thyChNWqGGx2wSsmxeqpYdPR7wzd3PUVgoXY8aKTsRpaUXBtssOTZtjdQH7eSLv5TkJhyTfKVLpCElpdpTr0sYPVMyvBqy2Pl7dqD7XLuGwFdpsAWlAdG50w9bjhsu93DB3TIBpSty2+l1OFfNLoMqPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMzgGgj3NgwLdKXnhpYPZxgFQlER0fazfsN7tOlr61Q=;
 b=glFJwnmbiU8AMrsh6sRfqekCVoYy5pVbaxISryxonDS+bEmV4nIRMRG/lJ4ClzCbvHhFrw7xyw4AoxO5pt+QQAL8IJdmRxD/JVlQTj9ARJUyY2lReraweylZimbZm+GZUmmIQ402KblO9MPseLzkwhQRWrd1Yn3/xvO4X0SCvI2pGLpc+PPhSy0h2F4OqcSrmVoqIAfxV9fPP6ER2AmzaoyasCfu85QDHtZ9ZOmh+/ZAa+n0WR5pOrugLfqJKvyQyY92/SCbj00vi8DwDOUNyzpgxEiLX+9R31dOzZT6QRPVFqeNZqv1NnpsYcx1YDyKUx/FVWIH35+fH4xr4xcj3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6292.apcprd06.prod.outlook.com (2603:1096:400:42d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 09:19:14 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 09:19:11 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v6 2/7] udmabuf: change folios array from kmalloc to kvmalloc
Date: Mon,  9 Sep 2024 17:18:40 +0800
Message-ID: <20240909091851.1165742-3-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240909091851.1165742-1-link@vivo.com>
References: <20240909091851.1165742-1-link@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 956f5a06-60d8-4fbb-0adc-08dcd0b07709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWcwS1g5bGNTSCtnU0NxMkFDY1M3eTZGUGxuZVl6MmVVT1NsNS9jcEVkdGdt?=
 =?utf-8?B?L2cranBNMUtQdTRDOGFLV2pBbmhMM1pxUWFteFpTY3paTnZnN2preEtBM0hv?=
 =?utf-8?B?V05OODVSVHdJamdOek9mVCt4UlFIejMzUzFMTkVQb1NCa05rRytoV3RxS3py?=
 =?utf-8?B?aUczTkMva0oxenFYQjJHbzZCT1J0OWl2OUlObDZOMHV5d3VJaXpiYkVIaFZ4?=
 =?utf-8?B?TnJEbVFWSENRbTBqSzQzcjJzMmMxUXY5Qi9NN2plZUVhcUhDaUFJM0h5cVRs?=
 =?utf-8?B?cml6c3RuVnRXWTNtWnFCMzdhZ3FqaTBnaHZnRStUakY1N2t1eXUzems5MWR6?=
 =?utf-8?B?ME05bit5bUI3Q3lVZWJQSUlZd2VaenBVUjd5YTdjWjljajdSMWtlU3RLTFhy?=
 =?utf-8?B?c1lkaEFaVGg0NlROSThrMG1YbXFmWTlHZ29LMHExWjZQTmR2ZWF0Snhod3VE?=
 =?utf-8?B?emJ2cXAzK0JKcmF1TDV4M1VoOVpOSlpFMHdnTUpSa3NUUHA0dFpyODVxa09j?=
 =?utf-8?B?S1NWSVBYeDZWcXhJd1Q3OHV5bGdHWkZiZnU3QWZiTmlNTy9SYTBDam82Yjgv?=
 =?utf-8?B?ZUVUbURhYUphS2tZc3ZEV1g0TDFYbW1zRU8vNTFBQ3Fwdk14ZDRCSHh4QU9w?=
 =?utf-8?B?azJyQUxueWxnTFdMbFpHaWFFWFJEZndKREdFRmdPa0gwbXdRU2ZldGhJMTNN?=
 =?utf-8?B?aDd1VlhqSFhRZHBvY1k3dXdiUkg2QzhlQnVDL0VPdEFoYUFtQTNJY0pGTmZk?=
 =?utf-8?B?K3RoYnV4K1lxakNWL2JKOC9DOWthRDJZOHVDdThkeEtsS3I2TkdiTkZzaHZU?=
 =?utf-8?B?UjVVQjdDM3VycTlRbWkyR3Z5Ry95bFd0ckNnalRheENKOW9pU2NnMlc3RkF0?=
 =?utf-8?B?V1Q2bnViZ1NlcTFLS0JqRnBqRkduQnhLVElUUnlkYW1tUmpqeFlrNlhuOVFv?=
 =?utf-8?B?VERZVS92U1hVbCsxZXlnNUNKbzNpL2V4Um1oZXFkaWtwenpjZEpQRWtMV2lO?=
 =?utf-8?B?NnJhZEpiZTdIZ1gwVTNxcElWc0d1VkZWeWQ4eDU2b2VZeU1QenVldFluc3Vw?=
 =?utf-8?B?SXI4QjZ6aW9GamFCaEJmQ2lPYWZQM1h4S0p1TzArK1dEYndWYVZUZ3dmcnVw?=
 =?utf-8?B?R0U4bHh6VkFkcGs5aDJ5Nkx2T2E3bWlZTjNhcFNLT3MrbG1NUVpWSHNtR3FI?=
 =?utf-8?B?RVhSN3FIVlVrQjUrNGVYb0VXM1dPTk1rZFpiQU5NM2VGQmRrY09vZ0hLczdm?=
 =?utf-8?B?NlRTeUd1M2srNnYxSDZwV0tSeWc0TEhjUjJYaG5aS1ljTVVucnNmSmZxeGk0?=
 =?utf-8?B?d0lPZ0FYNWZVZTFaUEdzZkh2dG1vbWRkNjNIVGV6ZURJNzZVNDF1L25BcjNH?=
 =?utf-8?B?bWpSL3ZtYVN6RXIwVEVnU0JJQm9KOGJBUDgvOFdiRmVzczNhZ3lrQjRLWHdr?=
 =?utf-8?B?NGZlZUIxYWhnMWZlRktKdmhtanpWRGc3R1dnM3FTZ2lWSjFWREd1eVRqaSs1?=
 =?utf-8?B?NGppa3IxQ0NBc1hIZ3AyZ1luQWNLMEs3Nk00M25BUHV6ZDdzNjU2TmRkdnI4?=
 =?utf-8?B?VllDNnRXbFFXbkQxTnBzc1NaemJLU3dyUTdna3ZGSjIzemExbDJnL3hCdGYz?=
 =?utf-8?B?azBqRmZmN2ljV3dhcWlHYnE0dTNwY1hVRFl3VXp5RzJvNlRScUx2N2JrWElo?=
 =?utf-8?B?NnEvVE1lSjRlaGp0UVJoVTRjNnRnMjBhak5sMldSY3FhaTlwVVQvbFZUZmsz?=
 =?utf-8?B?V3BKUEZidU9hc1JEdjB0NURPSmNuUTQrc3RKUWJ0SkRhUlkvVXpGOW15YTVG?=
 =?utf-8?B?OWFFOFFEMmRXY3B6b0dldkVvZ21wREltVmxqWDdwT044WGdPUG0yalVKMUJR?=
 =?utf-8?B?MjF0RWtyMHZBeEo4VjZXMkRXR1c1amFjdHdiQVdia3c1NHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enhUSlhsNTJwczZSVWJ6c0hFaDhDL2craVo0T1lDQmp1dDUzdkpqNE9FZ2Fy?=
 =?utf-8?B?ejRSOWF3K1ZxRUc4M080NGx6VTlQTzFzaGgxOUw1cGU5UWFnZElSR2syZ0Rt?=
 =?utf-8?B?RFRURTk0UmwzdjR0d21FbUs2ZWNISmszblJUNjFNVWRwL0VsZC8wczM2NGhB?=
 =?utf-8?B?N2ViUzkzRVNORWhQNTZyWERqa3k3anhtRlVmcHNOMUdESFNQZG5hRnZqTTdO?=
 =?utf-8?B?QSsxUlFOeWVPNnMyUFdxR3hFSE11OU9IUHNKYlVyNkRmTHplYUJqMm5NRzVO?=
 =?utf-8?B?TS9qTnJqM0ZtalFjZHJEd0hKZnI4RVNpOHExSXAvNFlTTkZWU3BGODU1V0xr?=
 =?utf-8?B?bnladThGbnhBUk81d2hHL2p5QlRoajVyRHNZNzlHTHpneFhadXhubEREYlU1?=
 =?utf-8?B?SzQxZTNmWTBNdmtQZHppcHNBK2pRdEFjOWxIZVlSNFlCREo5eWxkQ0NXRzZY?=
 =?utf-8?B?VWExNEw1VTQ2TCtKTEtiQlpmN0tKcWFsd3UrekVFRFc4QWpNSGJUVExsK3ov?=
 =?utf-8?B?WUZFZmZxY2pMZEtmbUhaaE9DVkFiOFRuK0J6UkxDVW1lOGhNWmIzcGphOGlK?=
 =?utf-8?B?L0QvNFU0bzlLK1Q0ZmRJNk9kNVRNbDdrUXcwekNNUTBDUklkTXdnejdiaEt0?=
 =?utf-8?B?cjdNRjhqUDkrS3JNTGZkeXBxSWlsYllzTWsraU9CRzRLZFlkZEdnSitmdExJ?=
 =?utf-8?B?RFRWdDFObjc1ZWZqZUJDL3JpWFJmVUtTbWhJMm9tWUhOUXhScU83RzN1Zk1Z?=
 =?utf-8?B?N1pTNVlRczFaVFJHNUpoejJZRnc2MGZocEd6QWZXcXU1Z2JBbVRqN1ZDVUg0?=
 =?utf-8?B?WUdDSjBnNDcrYTVDbE01d0tSUkNjcHlRUmZPVm44NEV6R0dwWXVnZEFtbGMr?=
 =?utf-8?B?SlhYNVBpU2haem95T1puUTZsWnRPTm45S1NKdGdYazN4bUI3dmNRK1J5TWp4?=
 =?utf-8?B?V3dsRVhyU3RsU1F3SzMrV3BGMVdPTTh2L25abkZJMXZiS1h1aTh5VnM2U0pw?=
 =?utf-8?B?eCthaWpIK09rNC84US9mNkNXT2pTWVNKcHJ3NVo4UHBuNmJqbVlvUVk4VlA3?=
 =?utf-8?B?aFBlWEEwUkN4RENyM1ZsK3hDR0tzWURRVnZGTGs0VzhtWEtHem9iTUdySTl3?=
 =?utf-8?B?aEtmTTFoanJkczVLbnJERjBmSkdUcGowVEFDcUpoTElRTWtaUnlRckRqb1g5?=
 =?utf-8?B?SUdsQlhQZXViQ3E2YmZpZmFpM0tKY2s0M2JpSWhjWlZDTWt0N2ZqUmppblhO?=
 =?utf-8?B?MndjZnI2Zkw3bWZwTkdNZ1AraDRWMkVhT1EvMXF3QVAxQWUwNXBEWDl4ejJ5?=
 =?utf-8?B?Z09XR0ZsdExMMTlDMDlNYm9mVk5TRTZjcGtkVFl0cTBFS0RZQU8zT3BQUWZH?=
 =?utf-8?B?d0tEWGNIbCs3UnJhbzJkelVpZWN6R3ZmZEY3dzdsYllKODNJaTRrVGwxcXRZ?=
 =?utf-8?B?ZHg2Z3A5MXpNYld0d1duWmxUNFJ4NXMvL3p6dHkvWVBWbkl5WEZvV20zdFNr?=
 =?utf-8?B?aEdYcjBzUEIxRHRvYjNmOVo3SmdjdXRZU3BHSEdFS01WRmp0b1JCdnNMVzFv?=
 =?utf-8?B?NXFOTWsrUVpTMVVxWXMyMHFkRmpNS1p5amlVWCtqa2NLM0pPQkZDa3RvcThr?=
 =?utf-8?B?S255MjlNSEZaM212VXd4S3RGVnptaXdkbHNObUxSMkxlbk5XbWpKQmdMck1K?=
 =?utf-8?B?N1lzYmRpZHFZbzMwbzlIaUpPV3lzZDBvT3l0aWlDWmJrelBocXdKYzBwbkxk?=
 =?utf-8?B?OWZrSEJSQzdqT1NBLy9acXFlcVlMaCszZ1I4MjkwaTNOQllQWlgzSG5OcWM4?=
 =?utf-8?B?UmNFaUlxVVVmVE9WRXl3TkN3a0RyeHlVK09EZmVGYkxPeEtyclBTSUhvQmQ2?=
 =?utf-8?B?K001ZWdjaVlVeWdVaEMwUjJmdWhIQ01ueHg2ZENmWkpkdHY2bTkrNDlmWm5E?=
 =?utf-8?B?MEFUT2QrbmYrckYreC9sbnA2M0NzcFYzUkhMSHpFeEVwYkZBdk5MeSs3Y1ZY?=
 =?utf-8?B?SG1mZ3hJWEw4QW5BaXlZa1hLeCthbmhSTEplV3FIa3QyNUxKR2VFOG5XZVQ5?=
 =?utf-8?B?RkNVQ0ROcnN1OElLUnVLa0pNZXFkZzVOZEduU25CUXI2U1ZKM09QMElncXNK?=
 =?utf-8?Q?BqF1AjKRV66FTSQH7BEzzMK5W?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956f5a06-60d8-4fbb-0adc-08dcd0b07709
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:19:11.1327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBXjc+mpZYaNvvYAJfUyDmJIQVpGWWmJuC7gai4PM6CxBF5/jnjvXQIMAOyBZbmMK70Tk7fntRMyRcjfm2PhAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6292
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

When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
page_alloc only support 4MB.
If above this, trigger this warn and return NULL.

udmabuf can change size limit, if change it to 3072(3GB), and then alloc
3GB udmabuf, will fail create.

[ 4080.876581] ------------[ cut here ]------------
[ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556 __alloc_pages+0x2c8/0x350
[ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
[ 4080.879470] Call Trace:
[ 4080.879473]  <TASK>
[ 4080.879473]  ? __alloc_pages+0x2c8/0x350
[ 4080.879475]  ? __warn.cold+0x8e/0xe8
[ 4080.880647]  ? __alloc_pages+0x2c8/0x350
[ 4080.880909]  ? report_bug+0xff/0x140
[ 4080.881175]  ? handle_bug+0x3c/0x80
[ 4080.881556]  ? exc_invalid_op+0x17/0x70
[ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
[ 4080.882077]  ? udmabuf_create+0x131/0x400

Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
memory, each array entry is pointer(8byte), so can save 524288 pages(2GB).

Further more, costly order(order 3) may not be guaranteed that it can be
applied for, due to fragmentation.

This patch change udmabuf array use kvmalloc_array, this can fallback
alloc into vmalloc, which can guarantee allocation for any size and does
not affect the performance of kmalloc allocations.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 2170d975cc76..ba9dbc7caf71 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -109,7 +109,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return -ENOMEM;
 
@@ -117,7 +117,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		pages[pg] = &ubuf->folios[pg]->page;
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kfree(pages);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
@@ -225,8 +225,8 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 }
 
@@ -351,14 +351,14 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf->pagecount)
 		goto err;
 
-	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
-				    GFP_KERNEL);
+	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+				      GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				GFP_KERNEL);
+	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
+				 GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
@@ -372,7 +372,7 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
 		if (!folios) {
 			ret = -ENOMEM;
 			goto err;
@@ -382,7 +382,7 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = memfd_pin_folios(memfd, list[i].offset, end,
 				       folios, pgcnt, &pgoff);
 		if (ret <= 0) {
-			kfree(folios);
+			kvfree(folios);
 			if (!ret)
 				ret = -EINVAL;
 			goto err;
@@ -411,7 +411,7 @@ static long udmabuf_create(struct miscdevice *device,
 			}
 		}
 
-		kfree(folios);
+		kvfree(folios);
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -427,8 +427,8 @@ static long udmabuf_create(struct miscdevice *device,
 	if (memfd)
 		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
 }
-- 
2.45.2

