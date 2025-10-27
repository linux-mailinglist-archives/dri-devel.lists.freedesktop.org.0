Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD98C0B8F7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 01:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92A610E319;
	Mon, 27 Oct 2025 00:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bPYDJtIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341DC10E319;
 Mon, 27 Oct 2025 00:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHLA5Xs5kinHkEtrJQxt8vx2MEiK5yGLvgeorTFl12+UuTdGTsdpqthUxvRViT9WjQd2SWP6N19qyPpGXq+Sj/eeZDdwH/2Pw/JuCxCOqJ1fZa1Rr10sXXdFqVhTe1NUAktLm/cY6R4ya2MARAkq9IXKMwly3OKH2h2bKZZzY5vK55qas8xej5Cd8LLIdy9VcUdeA75MOm5R57bkwoJugxemj8HTb8BVhS+KvvgGyHFuBLa476NJ7NbTox85GUALuxEyx43NU/pLiT/vjmTCYuUMO+eRPLjQLsq3enBtlmFHAnGELaa+xNXLEi+SKEhsYswAtjSdCCE0/RIAMnw4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyiW2DePtl6LMHxk4PaDnOaKKgMMd6zyFPJMmgQCNMo=;
 b=X6JepwFeLdkFZ4Dat00ZnD0A7DZRljXu1v3VVx4n4g3K6WWNkmR62wl6HlOMYmyypgTd1R7+fOtkfpiS4RPPoWGNh4PD7QGnCnxVR4+vTMc+ecgzrc9z9JuiDRWJUaF5/9SiNl2Qxixf/zu+8LK2j4Cjj1km9jA31ctBNPLQfz8ocWSsHOyZrDp6aco1F4m8ACmrVXi0kO16osvzq800sEVhk2IOLwUzmGjwxXJt49ACdxrjVl9t7CwY2C46e3w/quzc/vW4F7MQmJspagckS6GFeYW7ebEK9Sq3fBZksTixM5OFarnLadWey31P8/1Nj0hdeo2iisJ3L/kQ6VpQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyiW2DePtl6LMHxk4PaDnOaKKgMMd6zyFPJMmgQCNMo=;
 b=bPYDJtIRm66tBh7M0nixIdUgfY3RMkFzeFVWDUKhAJ0Rz0HHQ7qdGdy7DNm8tt8roqYYy32ltWKYbjxpWrbfCF8Hl3Dw+8rAzMpSbtpKDQf2Yw6+cuS8Lcoiy9F4xDLQf5dTLVJajxgIPTsNjwp007h9kGddEP8YFWki24ca92ZkgLgxeKMLAyyStsv5IGqyV8HS+vPB1XSvi50OhwxinbTRhS9lCUpxyXnW4lkYfWfR+fkMnKEsysV9kpst713l3g2bq//dqO4naTu/c1RNjTPnLHbwDpelkJ/DRPhS+IMkT7Y0rQbGuNPFIYW2sn8WWHd3RHypiG8L4+RQo4gN7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7806.namprd12.prod.outlook.com (2603:10b6:806:31d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 00:55:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 00:55:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 09:55:06 +0900
Message-Id: <DDSP15IPSYDP.7I4CBR006RYT@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Edwin Peer" <epeer@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] gpu: nova-core: various bitfield fixes
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
 <508ba490-9591-400a-a216-55a69b78c660@kernel.org>
In-Reply-To: <508ba490-9591-400a-a216-55a69b78c660@kernel.org>
X-ClientProxiedBy: TYCPR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:405:3::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b594d7-1a4d-4e97-68ad-08de14f37ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2Z6ZUh6Njl4ay9PTE1xeUwzNmNwcUJtdHoveUpqVHhUUmRvQStkZGE2OTRh?=
 =?utf-8?B?STk1UGdLMTV0amFwcG5xVHFvcDc4c0dhRFVrRnVzS1ZoRjNWUllCN1hYcWRO?=
 =?utf-8?B?N2wyZ3o1RmI5Z1A4cjdQODFybVdSaExyK3dGWlgwS1Z5dXl5dTFMZjR5TFli?=
 =?utf-8?B?Tzg4SGJLSjhJQlNsYTcyYzBmcnI2bmZCTHVzRko1MW1tTTVtU3pWSUsrL0NW?=
 =?utf-8?B?UCtyL2ZlWXJyTUMyVkp3M0gzWDQvS3hmdW82U1Bzck03bS9vSGlTT2FLWm5T?=
 =?utf-8?B?NVZhWmVlRjc5M3k4QkU5UWlPRWJvU3NPeU5aOHhDTHgwbmZ4MzNGZWtVcEs4?=
 =?utf-8?B?K1RtczF4L0xORlRsNys1Vy9PZ0tRQXNoSytLcmY5R0tkYTlCMHMvOWV6WERw?=
 =?utf-8?B?am95MWROMldNZ2JDT29mblJXOG9OUFVHNUV1MjlZdTc1Qjg3NWFNdmh1UHQ5?=
 =?utf-8?B?SmxRVUVoMk42dDVIdzF1d21zaFpCeGd5M1RTenE2Y1lUUTdaTVlyYTZGTHNh?=
 =?utf-8?B?aU1JUGVIbUUwSTIyREw5QTJITG5OOCt1M2ZjbHdIUUJSSUVwWW05Qko5V2ZP?=
 =?utf-8?B?WC9GRTY4UU95YWZmaDhxR0FDNnQ1ZFpZKzFDY2hmelJyajdnYm1CZms0Ym1u?=
 =?utf-8?B?S3FwbzlJY2s1R0kzMjBHTlZKOEhUTzF4aEpjNkUvaUl6ZmFTU2NGbXZpRGEw?=
 =?utf-8?B?Y0F1KzNWdFQzQnMyZmt4VXhNWlN6VzFTSkNtaHA0UjVCR2RIVzR3dCtEMWlW?=
 =?utf-8?B?RUpQV08zZFBLOUd6b1Y1K0gwc3krRVdQUXJrS3NZd1J0VDZ6bDcwQ2g5Tlhk?=
 =?utf-8?B?bENycXZEYmx3YW9zZnRjUWJxTEI1TzhIQ2tVdHVWL0N2TUI2c3ZnYWNObDZv?=
 =?utf-8?B?Z05pMjZFL3BIOE1HZllUU21kaHpVTlZ2WDVXM2tPRFY5NnR4MkJhbzdYU3A3?=
 =?utf-8?B?WnI3MXltRmpsSWlkaHdNaWZxYm1NOXFpOVh3YmNZQXZOeDgwTkloT2JhL0Vz?=
 =?utf-8?B?L3VIV1lkMUR0b1liLzYrWGFJeitGRXp0QytuZHA1VUtDdW5HNVh0Mnc1U0lF?=
 =?utf-8?B?SEEvZmRWb3hYMFFRNkpHenR3V0MwZlltY1llWU5ST1FSY0ZvWXFuSko5Ui9E?=
 =?utf-8?B?QWsrYVNIOXdDamRLZDdPWFI3UGExZE9VVW9OcmJIQ0p5Q0l2RlhIK0k3c25M?=
 =?utf-8?B?K1lQaHRselROdklwb2Jjdko5NkIrT2ZMWjBIUkxKangwRUwzSHN4ckU3amRN?=
 =?utf-8?B?SlhEU0d3aWE5ZjhvcWkxU3ZFUVFrZnBDanZPSGl4WlpDYVJyc2ExTjh6ZjV2?=
 =?utf-8?B?YjZMQ3Q0ajcvSU9EVE5BNmJwZ3VrTUkvbHFwL2dtbmhRbVFyMEJQTVlqZEx0?=
 =?utf-8?B?Z282RHczVUd5R2ZmZHlvRGhadHk2a0dNMW94MHVjbGlBRWZaYUlkMXcrYXhT?=
 =?utf-8?B?MWovYWdWZXdmREhxUG9HN3Vxd1Z6bnBxUEt0RnVWUm1JTkY3dGhncW15WE94?=
 =?utf-8?B?LzVlU3E1bTdib3gyWUFZQTJQYStOUjVTd1pYTU1vcUpLdy9kYmNPenJnN2Rw?=
 =?utf-8?B?Tmg1c1R1OGFDb1RoekNEYWxpWUxlY0VWWlJoamI4NkliS25aOEw1OVV4eFBR?=
 =?utf-8?B?a0E1RG05bGNoajdGdjhmeFA0UzRzY1BKd3p4VjV4eTZNMStYMDZhY3NiTHdV?=
 =?utf-8?B?ZVM5N2pVbWFSWDdlc3BvRjBCUmVQeU41UmI3T0ZEVjNyemErOG5aa24xcGow?=
 =?utf-8?B?V3EwMDVtNHhNd2lDOE1kYVdsbm9GcEd4RkltZWRPbjZVQktzejNEQXJxSE5E?=
 =?utf-8?B?eHAxYTNkM1pvb0FLK21YcUpuMGt3emd2OTh0TS9JNEgzNWZEY1FrY2dIUDlJ?=
 =?utf-8?B?RHZCaHJiTVg5emNuRFB1UlJQaG1VdVlmRlZqVERZRFk2MnNaWFRnSU13NTM2?=
 =?utf-8?B?ZjVUUXlGV01xVG5tTFNjKzRVQzBRWS91aXYrb2pEQWNsQUFwelAxSG4yaVlx?=
 =?utf-8?B?cjVYOExnaFVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUZFTjNRRERyUU1Cb1k1elBSRFFkb01VejN4cVRPR0FWMnR2OGZLcFEyL2dv?=
 =?utf-8?B?b0t3UVljK1VOSlp1R20rQzZ5VVhmS0FOdUkyRkIxN0JQajhnVHZ0d0ZUaDJi?=
 =?utf-8?B?MGc4QWtRRmpiTXpmZVdDR0xsdkhhVUlhOWprblpEMUR4SW9VS0gwemVoRVlT?=
 =?utf-8?B?dHpPQUJ2TTdKZ2tSa01Cb2IrbTBnN2xNM3JLaXhxeXM2RThzd2dmYk9SdGx3?=
 =?utf-8?B?TThrZjNnTzJabHQxQ2pucVFDNWNiWDRGZXJLVThxeFhJYjZEZUd2dFlvZlBh?=
 =?utf-8?B?NHphRmI4blNzOWxhZEs0QTNWbWJyYzg4NXVDejhiaTAwb2x6YkhiTzdCbGIv?=
 =?utf-8?B?OGFyalgzQnJ2d2dMSzJxVVJPeXA0bFgzdXVqNXdoVDh4OTVYOVcySmhGeHBB?=
 =?utf-8?B?SXF2Z1pGa05ROTNQK05IUk9zSzVuNGZJUGlYTXFNTklKeFlNVnY3NWpUQmJY?=
 =?utf-8?B?UFJCcXdtenF2cHhHaGdqOXdpdzlxdSt5SWJ0UUE0SkhCdHlveHNTdzVUbElo?=
 =?utf-8?B?MGsvVW0xUzloNHFFSndJVjJ6K0NIbFhGTnJRejh2VEI5b2dEaVUyaW1KNWMr?=
 =?utf-8?B?SVFYcjNsSUJqNUp2U29yT2UvU2k1aTVadjNiTXg5RGF3MWlXQmFWaEtPOFE3?=
 =?utf-8?B?a1NPVElsZkd3MFd4YXFMTE92U0hyY0h4VlVVWm0rczRadlNwWXdETGxzTUQ4?=
 =?utf-8?B?S2QxbGN4YytwcGV5NjBuaDBNUWEvczVndXVMSTBPbXM2b1JtY2VBeUhER0g0?=
 =?utf-8?B?SmNaVjZzM3lvakEyYnN5ZVFHMkJIcWRqNWxkY3BnMno0TzBraTNyRkVPbEFI?=
 =?utf-8?B?SkNHZzg5UkVxWlV6SE1hNTVsSzhQMXVXL2pmRTV6OEdMeU9lWGNqOG16ODFO?=
 =?utf-8?B?eVZ4Tnhpa1kxemhUc3FtS0ZTa0N0OEVXZmFZdUEzZUZNenZaNVZJRXgyVmxl?=
 =?utf-8?B?ZURUdFp1ZmZKbGE0MUJHMG1RcnBML2tYdnhhSGFKN0IyY1lkUk9kdTdzaEk3?=
 =?utf-8?B?a3oxTlJzRlgzZHd3VEdSYTZhbFZ6WjN4OHFEMUpiclZzeUg0blhTaS92R0k1?=
 =?utf-8?B?YVExVE9sUjYwNXNmVDVIcENPNXpOQ3Fsb3pPSkh6S0JweUd3bDhkdnQ1TS8x?=
 =?utf-8?B?QXRFOTZhOVNBWkZnWnlXSGszUjZmdGlBZjdzallVazl2bXFGUm1BbWRQMGVo?=
 =?utf-8?B?anRwd25LbFNrNUc0RDREVnJ2N0t2bzZmQlhsWVpoK0pSUGZicjBMTWJrOHYv?=
 =?utf-8?B?b2xkeGZsOGRpVVBqQys5YW5yTkdWalZWeUthNmZzQW1zbVVrTnhqbXpkeVAz?=
 =?utf-8?B?L0NTdkc4aVpBT1ZvT2V4WkxuU0hiZk5YZFVaVWZpVjFBcnNLbWhhSVFTcElI?=
 =?utf-8?B?YWZ5dDFjOE9kWFZJMW1KN0RSUDVBSmV5ZkxudUNTYjlycEV1Q1dlQ1lKRVRT?=
 =?utf-8?B?bE1MTzVncnVMbFJyQ1RmK2Y5TWgvZkg5dnExMEFkdGNHSkpGQWFxVi9mV21M?=
 =?utf-8?B?UWMwUkU4VXZib0phMVJ5RlNyUnVCQkJiSUU5NVZod1pZOENZbFJESnF4SUFz?=
 =?utf-8?B?OEdTV0F0M0V3Y0RoWFg1RFIyTTFyQjV4ZzU2a2xYUTVVcHR4WjNFeTh5ZS9K?=
 =?utf-8?B?ZFY2TVVmSkZmcVk1Rm5Rc3V4MkM3NHNGM1R1M3lnTzYxcHdISHJnSkxLSUhX?=
 =?utf-8?B?a0JIWXMzL2g2NngrNUxOZys2T3VPZHBxajhBaG9rNVkyMk9Udlhoa3NFYzkx?=
 =?utf-8?B?QWZpUWQ2NVRXOU1Pc0c0NDBIWUthZXBBUTFsdDdrVFlsbzFtbXc4ZXJJRXBv?=
 =?utf-8?B?Ym9TUG5GNXRkWkczZmpFNXZvL3AvVDYzWVRSRUlscVFnYnVTWndlZkVoZDg1?=
 =?utf-8?B?VzFJSmVGYVQ3aDFMY3pPYTdqaFRoQnJCWk1YSVpFd0UrTG1oSzZ4VWNVbkRL?=
 =?utf-8?B?bWhSUENnN0tCam1aakZ6TlN3dzFUNkJQd244VzNZTHJtN051eVZORkRQRXdt?=
 =?utf-8?B?R1JzZmZlL1ZVZk1PS0Qzbkhwc253MFV5Q1VYVHVEc2pjemdJalF1SlhQNjZ6?=
 =?utf-8?B?OGN5TVdnZCttdU5BSUxENXJ5TzZpbTFOSTVUTWF2WFRQWHl5bEJYSWtGOHNI?=
 =?utf-8?B?eUk4TDB2V2llT2RCd2Q4eHB0V1pDYkhLaU44TnV1ZHZiTlUvY3luUkcwOFM0?=
 =?utf-8?Q?Jp1TfE7Z44VmWf9yHxBhm3vmwkYZxiUZhCoaAjgk3Tn5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b594d7-1a4d-4e97-68ad-08de14f37ae7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 00:55:10.7573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Byqcj+RAPSauts+mGjVJjnSsaMBO2gLELs4QeM70sMbrJbYVgDyxGI1OwN98WXBpRMRIqHTHQsKHF4NF9vTRMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7806
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

On Thu Oct 23, 2025 at 1:19 AM JST, Danilo Krummrich wrote:
> On 10/22/25 12:50 PM, Alexandre Courbot wrote:
>> These trivial patches fix a few issues reported by Edwin in [1].
>>=20
>> [1] https://lore.kernel.org/rust-for-linux/F3853912-2C1C-4F9B-89B0-31686=
89F35B3@nvidia.com/
>>=20
>> To: Danilo Krummrich <dakr@kernel.org>
>> To: Alice Ryhl <aliceryhl@google.com>
>> To: Edwin Peer <epeer@nvidia.com>
>> Cc: John Hubbard <jhubbard@nvidia.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Joel Fernandes <joelagnelf@nvidia.com>
>> Cc: Timur Tabi <ttabi@nvidia.com>
>> Cc: nouveau@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: rust-for-linux@vger.kernel.org
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Pushed to drm-rust-next, thanks for the reviews!
