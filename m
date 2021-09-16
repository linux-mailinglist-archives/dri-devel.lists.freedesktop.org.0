Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9FE40DB5F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58D86EDC5;
	Thu, 16 Sep 2021 13:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3AA6EDCA;
 Thu, 16 Sep 2021 13:35:58 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GDIZqb004537; 
 Thu, 16 Sep 2021 13:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=KdGBjo/df6iKvlQHpfavgWbFwB3X33QHA+9PgqVHcfTMMlc8F/5Lwu0FYcGXx0R2N40e
 9pIj/ox4yz4+Bf8T0XehDRJrc5Cy9cJFurdQ9pWjJEDw7kjvv1VLIroaHoxGnXtXubHk
 ZvWqCERajsSzn+aOYx8eS3vUQuo4WB7SmEtMYMpMAEV5/sbtoBS5uaeepW1m85TzXZ5O
 V+Q9C4A3lpJobEL+N1z0oCnbN0mvJYG3AgKaXtTdue58pT8ixNaBVZnsr/sQppcBb2rP
 1XRBmGjt6BblRABJ2M2EIX08Cb2Wqes5MhOX07DdAIT4IoY4etNtHH3UdgWlrISh9CCM Mw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=pAJ0kRclGanaph+hjJNgQ3RFSwTw1KAI/BaW8Tci06zB4wWNt/tiNJpGGF3Rk5qVyAf1
 /qVBEMFFTzjTkjaaBMH4LvzIDzmMV7c5smVvG6k2K8qpUcM5wySBoRGnNkOCwXvR6UN3
 4ea20BlODljQMBEd7s6+/YJ9gm09Hpj8qQXGirTiVYhzJFswXbm4nyt4Uc2qA7tn2752
 aVMi5Ai7cHLe0wzk5J4nqDK7fvAdtpm2iJUEwb6TNIucoDYNFtdEqzoatflJX94XohKq
 +1HD8Q9CTxFgyuHJNXFrKYhR1VTizJUYCXrrPs7PrDewcDBLjvQFG71wHgYpLHXTTwQW Mw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b3jy7kfxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:35:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18GDUWSw156927;
 Thu, 16 Sep 2021 13:35:48 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
 by aserp3020.oracle.com with ESMTP id 3b0m99bqm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:35:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtpRQ8vc1fota2Z71AIchlRVWWjaygYG2DVxU5kTz+2Af4WcZmTkFDWWfdRbhbweof74VjV7S9WJbFZIflnloYh708qIBXHq2DN5OvFuNqo2kVw85u6PCXbBzQVFKObB7bMdLX/RMlScPO1i3ZV6qKnFt3fSI6CXXvYIpsnSa7XtcENf/cH7KdW+JlGphgYHjuTd9w/Y9IfVV8QoebVpQhS9fZg0zgeTezXRkcA8d1Pk/cE1B0Raq5XTkemC3sjXcdBUb/WEBm/Woj8LbfaGDRWa2mLCoKhIG9tcegQ6lbPm/mx3Fn4uDYus60jeW6kce6eyiFTnUzo7UckRzx7odQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=OcjgsgBlRMW1mH/9jG0123NMhUwiwgjWXHXFvBVZ2G4ijXVDqu6jUtwGv/8vK6M+LyNSEAxnTmRsaAObJhvnM4HSrJ5RDD8BMUAAz08y2CR8kWd9rYr2GVyPwtjVNrZkv4fLjWyWq1MGVgh8tGzEKmSFBORKnCumLU5qVB68gIfnlGhVHyXPN8g/InGI5livzqwY15PIc2kQ2YjpLnSrMU61+kseRTeOZMab5B1xd6qfs2nCLx5+glWKGvrkj9hGKMHyW6hLO9ym4s0jkMkQCtNNRKlRvrPQ251lWXofnJ3/4hm/KBVrhXnUVbt8FlQjat3OEz/cjjEYAzhNwA5qcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=z8NvJuJyA8yh2srUo4DqIvXk10lldHXdEfMJLv3At93Kfl76rZe6V6iWp84Mu2j6XDadIO8qZ1j9G0EtYtfpo+h4DLt2FXn6ngOQSA6TDypUdC+EztQnrJZIbilOR738oKb3FwRk/KLwZC5S667xqO+ucibwyCc0bvnq6bXQ7Lw=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by CO6PR10MB5553.namprd10.prod.outlook.com (2603:10b6:303:140::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 13:35:47 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 13:35:47 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND v3 1/3] lib,
 stackdepot: check stackdepot handle before accessing slabs.
Date: Thu, 16 Sep 2021 23:35:33 +1000
Message-Id: <20210916133535.3592491-2-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916133535.3592491-1-imran.f.khan@oracle.com>
References: <20210916133535.3592491-1-imran.f.khan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0008.ausprd01.prod.outlook.com (2603:10c6:10::20)
 To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SYBPR01CA0008.ausprd01.prod.outlook.com (2603:10c6:10::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Thu, 16 Sep 2021 13:35:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddff57d1-2431-4e74-12a6-08d97916e3c7
X-MS-TrafficTypeDiagnostic: CO6PR10MB5553:
X-Microsoft-Antispam-PRVS: <CO6PR10MB5553791D8A638C3D3CD79EE4B0DC9@CO6PR10MB5553.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hUPwRxppciOXfYl4OSnKZa1mSeI68GtAzNLbymWw+KJsq13vVxHjeM9prHms13Vw+xaHWFlaA01CGyntlJmeI5XOQ+Gs2K+YNfD7TocFoUQqCaD/Ga8elXtGHAg+HWMlH0vEAe7QJbZL7nCQF9AxeT9u3WFN3ZClL+HOMA19Qq2wg7qvfLK9vhwDMFB6TWFXIpwdC2LZSGpPlaDiNR7cJ66Fhvo2dA3ETsD4SNtse1xZYcE165kYRr3SnDuMN2BmAutNjBJGsvJnblM3Ym+HH+ZIaqm+4qCWqwEPtyW7p0Hbyub9t23e8T7HfYksTQUkx+eMw9d08KMTFluubKzigfMRLeLfk6gaipU7lV0dEwxMmb/mcZwxS4UCfE5h/scWUdLbJFe3sHoKi9w8oMPMO1RJMbMJPhwqoBW0k9eVEk0FUMfs/Hv+hpkHzKdvY1BZpYqs1YSTWgpD+dpb1YzQBGkUXlDy4JGvdtUCGSr6pzTNhAAAKPWdiaM7H/5qsxGmoN2hS5hcdBS6Ui1tkpKj+vsb9hoxG1I/Us/6jIkQe7/VwlyAW7XPf+xSvw5vqWbgMZQAik0aNR718CwJSqamksBMmMympUy2375Fye3xDEEeD42jNjhfLfOszWdLT5TEpnQONYeARfM5C8xMyzAf9ntLjO5uU5y7WXhFOICK4BABvnENAPyI76wsxgC93+3/7Wqf/g8Fp+i7tN408pc80odjcMwxS1tRvOi+fPzjK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(39860400002)(136003)(396003)(346002)(4326008)(316002)(36756003)(26005)(5660300002)(956004)(8936002)(7416002)(66946007)(52116002)(2616005)(38350700002)(6512007)(6666004)(38100700002)(66556008)(66476007)(103116003)(921005)(8676002)(86362001)(6486002)(478600001)(6506007)(2906002)(186003)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wrdvudNLl22+ac2H6GB3SHXGypOMQD5FabrvuGTAosqJfrskdyccqIO+FVfc?=
 =?us-ascii?Q?UBrgtYSWdZcAyO0s0SL6eQuNR0g+nG0ed/9vVTS3V0z5VGZ16YPidXC+Vo0a?=
 =?us-ascii?Q?RR+FSR6uZH0tnm57MTPBl2tbBBHL2FKMtC7nCFDw+SbJyo85XVTl9IhI4N+x?=
 =?us-ascii?Q?iGaSKIgQlG7I+b08aPjRZM1XK+hfll5aTNO3hJUS7PyPjXQEcwNNQd4xeOV7?=
 =?us-ascii?Q?ujhGvvLDe2usJJn3dp2+tOh/HD9lSlTNsixTJP0lbxNxTAfnEt9UfrAoTiJz?=
 =?us-ascii?Q?ac8DZA36Z2T1ZyQeS01pWPriyyzo+flIkWHdT906I/lDI+EERwxSZlBeLcEL?=
 =?us-ascii?Q?WQ8TY5fvituC5o0k95myvM7fYNo8y+LBKypxR/COM/QEwo7H0x6tIzpaUE6J?=
 =?us-ascii?Q?NUyz4TBqZAmQKCoP4F0wE68kjad62EsVigPxiJjFi6Uzkmc/ZY8izWshxHy+?=
 =?us-ascii?Q?V3muWENAj2E1UBNKt4CkgArlgxRHr9IjcEtqfVZG5EVuw46ECXzbfDL846si?=
 =?us-ascii?Q?WLKQW1RAA9aoF3uuI5cd4KQbynW32OXwg8WLYfwyYdaoRzK2kS7wQy3RYTkn?=
 =?us-ascii?Q?82fjImvfH5Tk/TfzzPsd5gxC5XW1VrYoPi+FN0b4OnZ+GXwXP+b6FuZSCHBF?=
 =?us-ascii?Q?VFjAoNHBGSMNvuoLCreb7KNfdkuCCDA94XpL/kQ3+f1vKolTLDAmyYcf3BoZ?=
 =?us-ascii?Q?uH8kgwVkiFHb+7JgEptWL7sOKb8ZMuBnJQiC+654QdcWWJTNXnjYVhKfWrmT?=
 =?us-ascii?Q?HLorGB1AzqjGkiJO5ZzIKQdQovudq5Gl8K2BIzjYrPo4u4Wm87sN//0lBhLd?=
 =?us-ascii?Q?KAv+lPN8qzSPtj9qVB8TiZ0kzR3AVZIKOtjfpmfpzw6O00d8CTNrExCEvwzw?=
 =?us-ascii?Q?BYT4BUsddeNxTP2gVdMlL6ZSUizX7O4lyuY0u2rT4GRrGtakJkQywLuPcwRY?=
 =?us-ascii?Q?Yo61U9LUpLQHpZnsG77m328iedvF4eRZEXetgmBHnR4ePFgo0UEwbKpX/mJf?=
 =?us-ascii?Q?ua2CU1zjqutESLuedUzdO4ZYRF9q37qWMmaDYfaMfQXQcPJ6+qaLLFDMUZXt?=
 =?us-ascii?Q?Ak+Ffq9O8xi5Y67dZdn2u2vrGw9CX4bS/iteGYRZY0O+JVzvXG9jcqhJ0RYM?=
 =?us-ascii?Q?fci2bdt1SAly3KuyuQuxhllc1s6b8VaDwoeqCfR42wUj5zMkFVLG9ngf+oUe?=
 =?us-ascii?Q?z+9yzsXMZlwiqm8LBterA7F/fDm+SIyDiLi7RQTsM46jVh+z8R+hKMdFbrUe?=
 =?us-ascii?Q?5vCVAz4DTPgQgw+iRDLq3NdWbl63cZBZWDeSkwKdwbZH4/jdEZSDXjH95GxH?=
 =?us-ascii?Q?jLPZWjguD14UZ8Y2ffOp9laW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddff57d1-2431-4e74-12a6-08d97916e3c7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:35:47.0557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vy0GT21oIPZsB50L47U3t0v1l7L4Gph8UC3KVmwW5nXjErstNHUxqdmroWVZ+WgfzV/EVOTHb0rDNYVa08FVDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5553
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10109
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109160086
X-Proofpoint-GUID: 3r-gevJr2KQdOdpNGk70154A6UhEbidF
X-Proofpoint-ORIG-GUID: 3r-gevJr2KQdOdpNGk70154A6UhEbidF
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

stack_depot_save allocates slabs that will be used for storing
objects in future.If this slab allocation fails we may get to
a situation where space allocation for a new stack_record fails,
causing stack_depot_save to return 0 as handle.
If user of this handle ends up invoking stack_depot_fetch with
this handle value, current implementation of stack_depot_fetch
will end up using slab from wrong index.
To avoid this check handle value at the beginning.

Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
Suggested-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Vlastimil Babka <vbabka@suse.cz>
---
 lib/stackdepot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 0a2e417f83cb..67439c082490 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -232,6 +232,9 @@ unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 	struct stack_record *stack;
 
 	*entries = NULL;
+	if (!handle)
+		return 0;
+
 	if (parts.slabindex > depot_index) {
 		WARN(1, "slab index %d out of bounds (%d) for stack id %08x\n",
 			parts.slabindex, depot_index, handle);
-- 
2.30.2

