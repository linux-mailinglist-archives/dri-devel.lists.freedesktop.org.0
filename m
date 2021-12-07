Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C691846B67B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 09:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966BEAB9AF;
	Tue,  7 Dec 2021 08:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBB0AB9AF;
 Tue,  7 Dec 2021 08:56:12 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7542iU007619; 
 Tue, 7 Dec 2021 08:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=R6PmhxLsc39IEf+ckXJcs9cyk+07tpq6lWw0ujsHVA4=;
 b=OY26Ctv+6wd+CM7uzZuHIRJwfQHFE3Hx9WIiL6WnPFr+eRp2c4eEcS0gnMtyUsKHxn/5
 J6RWLtEb1HQerbgr7RFr0vMvZV3bs9obMzRt3QI5Kh2iNZbZ6w1Xe3VEgU9nBtJ9E4J0
 qda245CdixwQhKN1uJZ+Q894UZkBeGuLhrDsrAdsOA5mtp8j9WZaRNkKQ0afWkoEEV6E
 30Fr5gd1wo4S0RPm6TPv3UosoQKYEERlQp1FSGusV0CPwWxsERxk7rShSQUah7CYEd7C
 g0qdLvUDBY1SOAp7ln/RKpdEFQPvHuylLcCID9s4pQ3j5qrcOMcoXZOEtSTFIY61ZVzP tA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csd2ycfru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 08:56:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B78kd3K019609;
 Tue, 7 Dec 2021 08:55:59 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by userp3020.oracle.com with ESMTP id 3cr1snn3uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 08:55:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obej9hQ+HenqrrRXJVWtJ0XMWfelxcyrHKBs1QoUVPGCDcC+JvAf/klu251ldxA1ZitEbvazKAhzntySHwpiwyBYlLRJ7xkcFHHQd4abBAN3EoT5s6DvS9PfadkeUp+yb7CE/offGrL/08Y0lz9X0ji07ovwqDCuw7g4akA5USFRV9TODV/FjghbH+95ebRXQgLGW//MbO5EpDu34HX0NSO7KH2mIEWXH8/hr+0VgDVe7Ji42hvsTPW3uK7bBb6wV6s2cyxPwprGzf/9BI8bAt8Zv7HzPpEqmCuqn4K6OB30CRgyp9sslXP8iu+om9awM+rx+rNsPrXS7IB1eS/lSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6PmhxLsc39IEf+ckXJcs9cyk+07tpq6lWw0ujsHVA4=;
 b=b7JgAIoASYrPl07SwwS1u43/YrZsqc2uLvT0v/TIp0t6YD6UBEeLrBH3ppE8Wse5kHtLDb3XPVs88pwlHxVwpISgbACm6UI4FFSm1H1Bb/qXpC7XurzhkcLGJNhO+8EdrPaQII5axye7kBZV2t31Mtnr4wu2moDZt7hi9EtpHbpSduLMo5E9ukiCWGcyuWYzV156Sh7ziK0kR1NsIZkFO7RYzYKFhPidA4fVFSE41h1N+YBBtBHg9Its1y485T1hNmT8uQgJJtQCw/yL1cNnpNpIR2+zMCgtmb/pZOdecIgksehltFpd4Oi+m5YB/nAp6ID9SQBARgr7hQS31TIiig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6PmhxLsc39IEf+ckXJcs9cyk+07tpq6lWw0ujsHVA4=;
 b=CQGHojFseqOD6WArT8BOQu0E4IESELRTtIls6p6dv1SyMQoN1I1SctXDjlduOIyrIRgHC4xmUriEiK0vAMZJ2BXJyO2UBoajMGVaccb0Tcq5W6y26Qny4pQSYtR4LwzzT1CJrO4LQtyPvhG725iPmJ4fAX9N1qoFD/ijjAHiS1g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4724.namprd10.prod.outlook.com
 (2603:10b6:303:96::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 7 Dec
 2021 08:55:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 08:55:57 +0000
Date: Tue, 7 Dec 2021 11:55:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
Message-ID: <20211207085521.GF1978@kadam>
References: <20211130095255.26710-1-tzimmermann@suse.de>
 <20211206104233.GD1978@kadam>
 <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
 <20211206144007.GE1978@kadam>
 <53405618-2e3d-c15b-d971-be2543c116f7@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53405618-2e3d-c15b-d971-be2543c116f7@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by
 JN2P275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Tue, 7 Dec 2021 08:55:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 331cc6ab-b970-420a-7f6b-08d9b95f624f
X-MS-TrafficTypeDiagnostic: CO1PR10MB4724:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4724C5C490ED6E4DAC600FE08E6E9@CO1PR10MB4724.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:397;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J6fFS7TIDUUOG/3f6caxy4F8zR4M7NAkdyDZAd6RQw1btWMeL0D6VwGMEKevYGAerLBIUZ7YoPRQyzANufCu3Cr60kc10Mv6+UjoAYm0acIHgca1XJMqohssoG1Sujz6eclcLulmJQKsbNXofEnOr2eFaU8sB4oVnI4efL03LX6I3B8FxmIVRBgqh2DRYIQuejgzSVdUZFe/GBMhZY2K/FNzItZkig/gl1/iGfwt+d0GmJ71hOEoUKGhBpSmRI747+sLZt43XJlpFHzGII4UC6xY0V90gBivys11yGW1rrtst0c7UG7wGcsG4Axa277iWPgwtFi6e+yMhLzp0wiq8uP5IicFIBgM4WAPHcaBDR4TsX6ad7yI1l+mtwXIUc+EZ5nsb2WOuoM9vdjZVqhmgM7a9oypiBkv3duaGAUiFrz+6L6fIdLCpAOujO4/wmAwNu1Nre5dBdu3NQ2A+NrJTgNxmFvkMrV1C8rpWrri9Ygc8RAOnE1xWWBgOPKWijK5IyVbqOFoyd6AYLV2ZAJ0iQkSXFXbIVWsboEi7y0YyausG6LeMB+flOB/85Qwwez8I3ywhrBdLf3OiJ2Jlp1wVvGUGS7Eb+YMXoIPgvymGKxSK4YdugMsVEjqxpx7ihyDLoq/e9yhHvHZxb94D+c0LZecCTaGAZXTY997XF6Sj7mxw+FMHIWLtFLM8/P9RfQ5eiVkoMjILF9gZPy79JjeBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66476007)(66556008)(6496006)(1076003)(52116002)(316002)(33716001)(4326008)(44832011)(86362001)(956004)(6916009)(33656002)(38100700002)(38350700002)(508600001)(5660300002)(53546011)(83380400001)(2906002)(26005)(7416002)(966005)(186003)(9576002)(9686003)(8936002)(6666004)(55016003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vKqnqrq3ll6eejAirRDYFFe1ZnKtTx4uuYEafq0VLlH1OaCTw+ClbBXiPINf?=
 =?us-ascii?Q?Gayrs7spYPKfOaqZnGu30xBFW5UYPT2kD0R9I6yQ6+CEx2lweHFqokxjrgjK?=
 =?us-ascii?Q?KXMIqacuiM1zq7E0HKUVszj9AfPnTrFnYATh/Ei7ZByNvE+VLTW9X+eogByb?=
 =?us-ascii?Q?WSE2GvqO5C9eo5S/eAQwuwlBAmWKjmDFTpaoVO5YOijLLl4llQy8YKQ1EOuY?=
 =?us-ascii?Q?Xv7hujjMq6dwqZVZhUYfRpQg8rAUbRlo9/ZdGXjHrzEpG/5ZR8kXzEjUXr3/?=
 =?us-ascii?Q?63Dna6RmUGk1aI88rWqVaprBGbWJI47q4NWqy/eMHme2QsjF4U7TNo7x7tok?=
 =?us-ascii?Q?G3b3yUbaE9UuLHJ/q8WMmPLWPDy03HrtdKwS+3cOhbxkqr3sxdanR7ay19oH?=
 =?us-ascii?Q?ZVqGZU98ophugdPhyLlt5g9+Zb7zBnOqYWM5q8nNgQND4mvDXH/MNKLrNJu0?=
 =?us-ascii?Q?u9YPr6CFgAO5YqUTJYlYJC+LdYE52FSfOHweOwGJHNbKOnvp3dLA5avroOlS?=
 =?us-ascii?Q?D7R1tj8sZY5qTqWFt+9a+jvyxJtKFly7r0h7GPOvkgd2/JrKRVj9v+oDTGs8?=
 =?us-ascii?Q?tAMt0MtXqsqHAK4+TSWufMznLIXlzaQfboUo01ONO/fHfn9ZutUvcQNvA6cr?=
 =?us-ascii?Q?lqz9RbmyNGp+3iH/augEo0bFMpV4Rt6LChezVCQR352JNwkv9IBCukX0t6ub?=
 =?us-ascii?Q?T006+QyC9Ba0WQPvUxj7GZsWiFYw/LEA5lbG26VyKPO5lmQgW+jlKauLMww8?=
 =?us-ascii?Q?a/PBmK1PVAEKFfZhGHlplfJs3VIzSELVSkdEPliopVrjfGtrGCDvE29K2ugL?=
 =?us-ascii?Q?++kezZYYe+I++kdjF2HBlXKQLNM4OW+UEhBcQ93+LVWXk0sV97SmnDbgr980?=
 =?us-ascii?Q?dJVkWFLIGTe6pM6CmpCbGSAxEj7rCnm5h8pvHm4W62mBRrx1L4K/LE+v4f9z?=
 =?us-ascii?Q?4RigqNbM4dhu7/LNUtNxpYOlnR3sjgsMq9EP1dbkIEGxc8gCt0oEms90UPHM?=
 =?us-ascii?Q?GBsWIdhvSY/+dSWDi7xvnnvZo35KrF44cp/u1ghXKIRrWCHbd4H7clLRjVpT?=
 =?us-ascii?Q?adzQtcOu3/SAqhsuH7KsrTabJ5n6kKZMbazIo7aIKkU5PAgpH+mEB3HAiH7i?=
 =?us-ascii?Q?EpzaglqdES78MUU2k36OjQC/y3sOdIYTJlUsSbbkUfWbOcuNIzBW21H+M9df?=
 =?us-ascii?Q?nENkKatwW/T//Uwms411827OSwof58nICWwsqfZZNpZbzTUhCcLyERjqA4Y9?=
 =?us-ascii?Q?IKHT/oPJy0XE7xUv+f3fzuYTcUQLBVieAUpDoY+IGlKOmWyKhuX/IyA352+u?=
 =?us-ascii?Q?2ZIa+mjtzkXTOm4E9rYwh3bavWq9zN8jWnhYIb30hIJptH9Pfx3NyLD9UoxH?=
 =?us-ascii?Q?DhAe89mjEw3PuvCQDL09knnLdQLhpZ9jFcuhYoixwnBSYXN048gWJk82KdEg?=
 =?us-ascii?Q?RMbgba2aRjP1BPaqofEWN+U3mY9nLkZnyhGD0jGX1mK9GfbPEITdKeX+rin4?=
 =?us-ascii?Q?iDsfNunyxcmJGZaxh+MG9QLPuPcMfClbt1xIYwkWfSwy1zCN+Bu2zbppIcDw?=
 =?us-ascii?Q?32ImSI13noWWzIfHzxiR1o+ce8uQVA+rNxYSFCf33l/PXrmsWx2IijGf5Ru1?=
 =?us-ascii?Q?g5MBaySE9FiHK/KYfnF4fWYcTFzg8d7q+5o5A4RXK+U20ykq+SGDJFPimjE7?=
 =?us-ascii?Q?jp2NmnLSfRV8E+4qe6u47ohPP7E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331cc6ab-b970-420a-7f6b-08d9b95f624f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 08:55:57.4323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eoo6I7H9zmbLWeKxK9PTUsa+Fez/MP+nF5AEtvukCgilAVC5mGFuko16vV2hJYR2sKpudV02n48UDn2JS3+bUXmMz5oBUPZMNjdE7A2WLQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4724
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070052
X-Proofpoint-GUID: CYVygd2SjIqeqyK3Q12pmaX_kht6YBYY
X-Proofpoint-ORIG-GUID: CYVygd2SjIqeqyK3Q12pmaX_kht6YBYY
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
Cc: emma@anholt.net, tomeu.vizoso@collabora.com, airlied@linux.ie,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, gurchetansingh@chromium.org, kraxel@redhat.com,
 yuq825@gmail.com, virtualization@lists.linux-foundation.org,
 lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I appologize.  This thread has been really frustrating.  I got mixed up
because I recently sent patches for ingenic and vc4.  Also we are
working against different trees so maybe that is part of the problem?

I'm looking at today's linux-next.  Your patch has been applied.

Yes.  You updated all the drivers.  But somehow the vc4 chunk from your
patch was dropped.  It was *NOT* dropped by Stephen Rothwell.  It got
dropped earlier.  I am including the `git format-patch -1 <hash>` output
from the commit.

regards,
dan carpenter


From 4ff22f487f8c26b99cbe1678344595734c001a39 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 30 Nov 2021 10:52:55 +0100
Subject: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object

GEM helper libraries use struct drm_driver.gem_create_object to let
drivers override GEM object allocation. On failure, the call returns
NULL.

Change the semantics to make the calls return a pointer-encoded error.
This aligns the callback with its callers. Fixes the ingenic driver,
which already returns an error pointer.

Also update the callers to handle the involved types more strictly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Steven Price <steven.price@arm.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/20211130095255.26710-1-tzimmermann@suse.de
---
 drivers/gpu/drm/drm_gem_cma_helper.c    | 17 ++++++++++-------
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 17 ++++++++++-------
 drivers/gpu/drm/drm_gem_vram_helper.c   |  4 ++--
 drivers/gpu/drm/lima/lima_gem.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  2 +-
 drivers/gpu/drm/v3d/v3d_bo.c            |  4 ++--
 drivers/gpu/drm/vgem/vgem_drv.c         |  2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c |  2 +-
 include/drm/drm_drv.h                   |  5 +++--
 9 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 5f42e44b2ab3..6f18f143dd30 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -67,18 +67,21 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
 	struct drm_gem_object *gem_obj;
 	int ret = 0;
 
-	if (drm->driver->gem_create_object)
+	if (drm->driver->gem_create_object) {
 		gem_obj = drm->driver->gem_create_object(drm, size);
-	else
-		gem_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
-	if (!gem_obj)
-		return ERR_PTR(-ENOMEM);
+		if (IS_ERR(gem_obj))
+			return ERR_CAST(gem_obj);
+		cma_obj = to_drm_gem_cma_obj(gem_obj);
+	} else {
+		cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
+		if (!cma_obj)
+			return ERR_PTR(-ENOMEM);
+		gem_obj = &cma_obj->base;
+	}
 
 	if (!gem_obj->funcs)
 		gem_obj->funcs = &drm_gem_cma_default_funcs;
 
-	cma_obj = container_of(gem_obj, struct drm_gem_cma_object, base);
-
 	if (private) {
 		drm_gem_private_object_init(drm, gem_obj, size);
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 0eeda1012364..7915047cb041 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -56,14 +56,17 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 
 	size = PAGE_ALIGN(size);
 
-	if (dev->driver->gem_create_object)
+	if (dev->driver->gem_create_object) {
 		obj = dev->driver->gem_create_object(dev, size);
-	else
-		obj = kzalloc(sizeof(*shmem), GFP_KERNEL);
-	if (!obj)
-		return ERR_PTR(-ENOMEM);
-
-	shmem = to_drm_gem_shmem_obj(obj);
+		if (IS_ERR(obj))
+			return ERR_CAST(obj);
+		shmem = to_drm_gem_shmem_obj(obj);
+	} else {
+		shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+		if (!shmem)
+			return ERR_PTR(-ENOMEM);
+		obj = &shmem->base;
+	}
 
 	if (!obj->funcs)
 		obj->funcs = &drm_gem_shmem_funcs;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index bfa386b98134..3f00192215d1 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -197,8 +197,8 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 
 	if (dev->driver->gem_create_object) {
 		gem = dev->driver->gem_create_object(dev, size);
-		if (!gem)
-			return ERR_PTR(-ENOMEM);
+		if (IS_ERR(gem))
+			return ERR_CAST(gem);
 		gbo = drm_gem_vram_of_gem(gem);
 	} else {
 		gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 2723d333c608..f9a9198ef198 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -221,7 +221,7 @@ struct drm_gem_object *lima_gem_create_object(struct drm_device *dev, size_t siz
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	mutex_init(&bo->lock);
 	INIT_LIST_HEAD(&bo->va);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 6d9bdb9180cb..ead65f5fa2bc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -223,7 +223,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 
 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
 	if (!obj)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&obj->mappings.list);
 	mutex_init(&obj->mappings.lock);
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 0d9af62f69ad..6e3113f419f4 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -70,11 +70,11 @@ struct drm_gem_object *v3d_create_object(struct drm_device *dev, size_t size)
 	struct drm_gem_object *obj;
 
 	if (size == 0)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	obj = &bo->base.base;
 
 	obj->funcs = &v3d_gem_funcs;
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index a87eafa89e9f..c5e3e5457737 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -97,7 +97,7 @@ static struct drm_gem_object *vgem_gem_create_object(struct drm_device *dev, siz
 
 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
 	if (!obj)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	/*
 	 * vgem doesn't have any begin/end cpu access ioctls, therefore must use
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 187e10da2f17..baef2c5f2aaf 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -139,7 +139,7 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 
 	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
 	if (!shmem)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	dshmem = &shmem->base.base;
 	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index da0c836fe8e1..f6159acb8856 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -291,8 +291,9 @@ struct drm_driver {
 	/**
 	 * @gem_create_object: constructor for gem objects
 	 *
-	 * Hook for allocating the GEM object struct, for use by the CMA and
-	 * SHMEM GEM helpers.
+	 * Hook for allocating the GEM object struct, for use by the CMA
+	 * and SHMEM GEM helpers. Returns a GEM object on success, or an
+	 * ERR_PTR()-encoded error code otherwise.
 	 */
 	struct drm_gem_object *(*gem_create_object)(struct drm_device *dev,
 						    size_t size);
-- 
2.20.1


