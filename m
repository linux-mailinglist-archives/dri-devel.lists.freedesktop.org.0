Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB2WDlWpp2lIjAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 04:39:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9893B1FA77A
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 04:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5125010E947;
	Wed,  4 Mar 2026 03:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.b="XqYn4spx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1246 seconds by postgrey-1.36 at gabe;
 Wed, 04 Mar 2026 03:38:56 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAF510E944
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 03:38:56 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6242ECDA3718732; Wed, 4 Mar 2026 03:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=cc:content-transfer-encoding:content-type:date:from
 :message-id:mime-version:subject:to; s=PPS06212021; bh=74SpbJ/kj
 Vr+1llA2LTt3bsg9hWgE7KmrOS6kzapJuY=; b=XqYn4spx8vJOP8QLcZUEXyaE2
 tkEJcAYocP+SHOaeG7LfmdkcO7rurAkhpeGoYn/qTTL7QUXL0vwBvWW4aOCBsMIk
 f1+FYBr6qB9j7beXrf66tT+3GCtP8YFmc2JsmHVl6ATZ7O+ZBBwha9PlGW3E4O16
 QqdxihLxgKR9AvoEukTIRG0rRkpRhkM4BeC5iqNL8bjvtBjYMkYYzQANsWFEtA2Y
 hsJbzhQ99Smoxp9EBY7v+xPGvpHDo/NOxTajsdPeE7mjsqcQTWHUTZ0kaYN252zL
 QDcuVp4xXMycOX0TVcnRSqQwx5aeR8RGQUq3pz3oUkLiEwbXhMsx8wSIyNZCA==
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013061.outbound.protection.outlook.com
 [40.93.201.61])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4mj72-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2026 03:17:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ga8mR+cJlZ+u+xggw98nkB6EfMQLpd7psyPM2M/oQOlFKCRiyXP4na3frnXLPkl9XvCuuPooxHNHRhJcEHyxEWhVPrvcJNxRlDZPlUzM5RIozYj7N4j5OGxkykvLLysPUHEXsf59mXJ8ULdcwFxEZiM9MVby2WGj67+Y1iRrw5CTtAsWw2kB/6zpPn/pjbMPcClMR5p4ZUoVSQyoTJJ2cCjf8WkAM5iA+rlJlocU/rr7jKjSyAWAp5kfr/wjPiOgEL+54xNiQ933v5YUvw3NiT3HoARi94y/KaGNe+hVmRl9mVYF84hU5zAmNeKKgDopV9zIKiwhX81vlGLvlherGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74SpbJ/kjVr+1llA2LTt3bsg9hWgE7KmrOS6kzapJuY=;
 b=cXxZ2YQS45DeIM2XMQC9PtQMDIX8Jw3wtTrmayajtJeFntnjH0/l6PmSRj0WbgJOEumwFTpxJWEczKxwmsOyNNjNWoom6KPtdRRxH0rK2AL+l2ix1XvgjW9Z5dl7K8nhu1WEIbgU0ZPdXCvXCUZBTaH3UWci1fIk1zJ8p4Ns8yS2D6l7LNwOxrNV2QP6BJjfE8LGWIL6PEawPSo55EduHiTirTUoeETW+Rp3yxaZhXxJfS9ywRF26A5e19GsDqnUDyhPbSQVohXwpMFePc3Jlav4qEKBI2rSkx/ld0AoK66YtATWWDqVmbhEaBMQ0R4Yzjo9pT0FsfG4WWeN1wxv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH7PR11MB6548.namprd11.prod.outlook.com
 (2603:10b6:510:210::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 03:17:55 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 03:17:55 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: mwen@igalia.com, mcanal@igalia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Xiaolei.Wang@windriver.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/v3d: Using spin_lock_irqsave instead of spin_lock in the
 RT kernel
Date: Wed,  4 Mar 2026 11:17:24 +0800
Message-ID: <20260304031724.246404-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0143.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH7PR11MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e0aae9-d2db-42b1-4b18-08de799ca0ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: Ku8ZH0Oo7z/Z4E2uxsMd/KZFAFcR+QwLZKXKOQwARPXSZRddSRwIvvn2VM2KeXplGDyKPNZwsatIkCdkX+nfkzfKESq5CaSNAwDKlpm8WqBnhZHPuQY6Y5reB8OvzCMvncxYjiylPW7ai9ieeb+QsaM1yW3i5U1JDwl3Z1tlUij5T6f8e/wMVrcyTtg5SSq50v1xYNb0w88FLqKTsR1tmT/2ZnGcwXYsHB7qpFJl8t56crUW5w5iBZLSJN6rNralrHDrtLPGIFMS54CySs1xpjl0k4LEQ69la7ro+VqG+IrxFXHkzJJ+hGJAtDV51530n1T5xL0iWS0KOFWztV1TdfzYoG56pX1N/Cg+//mMP5H3cicOuNlM+GY6yc7if4NgmwufD/CMqeclBHKzL3+kCjtHAnbuj/VURpfe3OHR0hQOkB6CWOcDVuss/R3JK4dMghjbQYOMPX+G/t7jUNfwjcPZ9pUxlxadsdalmRrUa8s1gSB18NUZPL0Fayk2v5XRjBO4Qo04T1S/J8NyoHTOYyikXlXJJ3LfGjtY5XN720eDOmqTQYT78gzYQEVlLXk80ca2LW0kpoG40oQJPcU8f0uJbUZZme0GMLlkEQcS/doCeLDSJ2rJ8652NT9FvY01Yv7rPk4ABG2gT4Za2ZLxlrFgr/mXdZcUbPyaEwPvjOuCxX1xtBI1y7KV/b7bfxFpEu3T6eXhRz5iKlI/8kT2ijzdPuRzoYL0iFGmpfgvowwFbhfK2BvyRkckUQ7b4LC78Wr+73aE/EkbBCDc3V3YHbUxyarh+9OpKKqdC1gehuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFD667CEBB6.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SH868bWpntBhA48RjlnrGac9NbQpCkO9Fvm84os/cbsqwn1e913QFXhYBJPD?=
 =?us-ascii?Q?/IrBrhT9rolBD38n2otjoS/CBUwQN+wWocVtTm24P3VgN9lSCkeuh7gITyjg?=
 =?us-ascii?Q?4VkDCSMQfpAuO8MGrqBu0l4V25GHxpzd/gG9IewPFuU65JahqEjHjRjKocNP?=
 =?us-ascii?Q?Zqt8x3eD2g0pf/abm8pGOdiw7Zt0Lecf1mkwzxDoEsApH7Ce65yygb16kGZ8?=
 =?us-ascii?Q?fyz7QEGutSeTjkAK9YoYYzwA35HoldzXYOdP0VXM/+WK54wd+FlCH/w8EqMR?=
 =?us-ascii?Q?H5QiF7kVsdTUopSD96FEkf0SOTv3bzg0wojcHleX7GGSCL5dOEs54Fzc8J/I?=
 =?us-ascii?Q?2eDW4Y4013On/a9qcjxmiD7g7pwNvAOKpOKEouAcgVlj2CL2xwz5lBpOLAmN?=
 =?us-ascii?Q?lKfrM4lJab6r7izsjV5KWZtXbEbq5caV6p75LF0+coe2sPoPpPOdqaUs4Sgk?=
 =?us-ascii?Q?RzuLVPd5LZHEAwgx6nXO5SGuswYm+gHP+oqiSDL24Yk1vdk+ExmOEqmfDtJj?=
 =?us-ascii?Q?EX4YNxQ4n3K5LAPTRoIgZfOsHzg8ISaJJ6PWRa0hQLI9+O88YwBCA5dM/k+n?=
 =?us-ascii?Q?ID2fgtjH8Z/l3mfAfUZnPUhhCv+FNkbnOkTi1NhvBK0+bXzySGkt8VtW7ChM?=
 =?us-ascii?Q?ewabvzihR2xfA1LKBSBlj5d8RcnAkqbf6VTzBjOWkHUK0aE5lsCWMJa+3zVV?=
 =?us-ascii?Q?h7RRWVjE9D7U77NZDLg0aZX+BfP6jMHCoIv2H+RpgrHJzLsBJ7Qrbo4qIkOY?=
 =?us-ascii?Q?ltRqbA+kFfsMFhYrODHv0MP1JaVA1yTGalAbe+GD/ne/hH1Fn3PxfsfXAyiW?=
 =?us-ascii?Q?2Br/F+6B99zU1VWdP9SpSvzH0Qr5VUxwpBBKVYoiyWSPg5VLFqJ9S3rz5B8t?=
 =?us-ascii?Q?s1g/J6H8dZnnmtCj063ODFvHDXMyuN/zJ/NHYCNmT2r36wuTOgZiEvlc3+Mu?=
 =?us-ascii?Q?/OYujjx6BvgtonHS0/4F/sEmTF3MJDTp+3JqE6ctI0Nz50lXZiUx4jAbLmzm?=
 =?us-ascii?Q?PjikgkqtVxLM+pitwB4+pM2VyPjgrnzHBnUVk8hl5XIG0x2+vapHYAUkJWfn?=
 =?us-ascii?Q?wBdL/T43I7B8kLorDGKZGMR3hbEY/fdMrO8edAx5OiOS8xmbf5AsVSXyP3gL?=
 =?us-ascii?Q?2kUXeskKF9wN0SQ1977NpVUANelW0vNDOhLlAJ1aYmFlEJ8KpLDp51yr3vE0?=
 =?us-ascii?Q?ORVc+FqznHDzmxTBaMrvCLqApZ+8PPrIt4kvk0luH/KS15/xTWdz7qkG5k2a?=
 =?us-ascii?Q?khYf5GWJsv9M5SeHaWwy/yaa8T/nhjwmGcmr5Y+khZ+BO53T9mbQHwO3Ip4c?=
 =?us-ascii?Q?I0XOdGHYAJFAypf8saKdHtHMD4Pu1Tx8ifhN7/uGdpyW3i53T8ux9HF38fWD?=
 =?us-ascii?Q?7hpy34N11A4JqE3p0DRbHyHQKFpfJVoA9V16YU6lbE0+2KGk1/9sjgd0TZgS?=
 =?us-ascii?Q?lYryY3VK3bgDNqqOibKj8/ztWSCIOWmIRfDmJGPCKnp3xtBXfEwH1re3+Abz?=
 =?us-ascii?Q?q+sokRlCtKShtGruO2cpO0J1ftmUKBJbw/OCiLgOK1ajLlcX+lMF4vl6sUVI?=
 =?us-ascii?Q?YV2usTgk8dHZjm7Yuo6UPAsFt+Kyr15xpAUr7E6FQdlipxx3BZ5M+4PNN/6q?=
 =?us-ascii?Q?0tLSSQC10Xh++aBsjMHx4klk4O+Zh7DQl3kWKCW1G3yGcLys1WL+tOzYYfkd?=
 =?us-ascii?Q?BiYUcgyyx5bmslBi3pmU0qr3YGxMgoF+b1GkQf2iD5QOQA0psgggVK3k3cT4?=
 =?us-ascii?Q?2tWINATDdbPqm9QkbjBB0L+UUmYVGa0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e0aae9-d2db-42b1-4b18-08de799ca0ab
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 03:17:55.3172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8MFMGV2/248+j8AOl/wjj53dnfdJOGWEC4tp9UWgOkcpYpZnNQJKUynoSz7vmpQHgIduN5tK0yyDDD5Kto9b0MUV3HD+rHY+1VDZihPBT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a7a466 cx=c_pps
 a=fvoc8Rb8ruZSznP819E46A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=eXuRnhFgML2vp_N2Z1MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TOqNYIsHLrJZZ2nH2bl2Sk_hEy1dyLKH
X-Proofpoint-ORIG-GUID: TOqNYIsHLrJZZ2nH2bl2Sk_hEy1dyLKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAyNSBTYWx0ZWRfX28O9ySgHnnxu
 YvKRdF2G2mzU18lMMMEtXUX4iL1URT/HpkGJO9UJobart5CShb14A8DoHGU8lJnyBYCJb6iErOC
 hLu3Jvw2g8kzWNFkydKWm23OvVZ9l1I1L+UAEvvfTKgknAhcRDPlr0t6yXY3gFeIsOcdWZbOMfS
 fWVs35DlXvC0HvFseuNb2AAWZm1kqGRJXwphDZUtSHFaiUL/qpQJsUXVoYfJtDpIa4kt/SCnB7V
 py/LRo5udgnXrBMwVxW0Ad3bq1d3JgD0KLKObwJMlHhHScHeSJBcH9krhl0Gfv0s3VTdFBXbfGR
 0oNJBuw8WlfNn633NooqIt7SdV4A6yNbbMb3SWFQ+SR/9Gl7PKL6AKnYaOJyd6DInR7nwPKNp+e
 XomObqwvTr3H3ZsR1+DwEYQdR/dv0Y5RqrcI92L3SYcpOVGAJBv5jxiwGtW0Lgon5lhctJiJO4d
 KNQpo53uDNNj3M61uhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040025
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
X-Rspamd-Queue-Id: 9893B1FA77A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:mcanal@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Xiaolei.Wang@windriver.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FREEMAIL_TO(0.00)[igalia.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,windriver.com];
	FORGED_SENDER(0.00)[xiaolei.wang@windriver.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,windriver.com:dkim,windriver.com:email,windriver.com:mid]
X-Rspamd-Action: no action

Disabling interrupts before calling 'spin_lock()' is unnecessary;
its implementation is only for satisfying lockdep's requirements.
Since preemption is disabled by default when calling 'spin_lock()'
in the standard kernel, both 'local_irq_save()' and 'preempt_disable()'
become redundant. Therefore, we can replace 'spin_lock()' with
'spin_lock_irqsave()' to ensure compatibility between the standard
kernel and the rt kernel. Avoid the following warning:

Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
Call trace:
dump_backtrace.part.0+0xe0/0x100
show_stack+0x20/0x40
dump_stack_lvl+0x60/0x80 dump_stack+0x18/0x28
__might_resched+0x134/0x168
rt_spin_lock+0x5c/0xe0
v3d_job_update_stats+0x64/0x1d0 [v3d]
v3d_irq+0xf0/0x410 [v3d]
irq_forced_thread_fn+0x44/0xd8
irq_thread+0x1ac/0x2d8
kthread+0x124/0x138
ret_from_fork+0x10/0x20

Fixes: fa6a20c87470 ("drm/v3d: Address race-condition between per-fd GPU stats and fd release")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 6dc871fc9a62..5eaacb1d1480 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -203,24 +203,13 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue q)
 	u64 now = local_clock();
 	unsigned long flags;
 
-	/* See comment in v3d_job_start_stats() */
-	if (IS_ENABLED(CONFIG_LOCKDEP))
-		local_irq_save(flags);
-	else
-		preempt_disable();
-
 	/* Don't update the local stats if the file context has already closed */
-	spin_lock(&queue->queue_lock);
+	spin_lock_irqsave(&queue->queue_lock, flags);
 	if (job->file_priv)
 		v3d_stats_update(&job->file_priv->stats[q], now);
-	spin_unlock(&queue->queue_lock);
+	spin_unlock_irqrestore(&queue->queue_lock, flags);
 
 	v3d_stats_update(global_stats, now);
-
-	if (IS_ENABLED(CONFIG_LOCKDEP))
-		local_irq_restore(flags);
-	else
-		preempt_enable();
 }
 
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
-- 
2.43.0

