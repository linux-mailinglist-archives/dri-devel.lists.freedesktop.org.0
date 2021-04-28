Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A1C36DB0D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFC86EB87;
	Wed, 28 Apr 2021 15:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F436EB63;
 Wed, 28 Apr 2021 15:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hapSiOwxzz+LtNiTu8ItVX0d5xPdtMc3sX8fqoTNlSUPNssMoAvi5iDkdVW3qh5ryWZ+/XccC93zSYKky+qEZgHE7K83DTFrm93MNJmHLqaPfoL3JLzbSrzPzT9CIBbJPLQJbS4qATuUGkm12p5ylpHHlbIPuwMtfWBBDEtiBgWlfLwfzRI0mjK3x3v2VXp42GVqXkHQ5e+JJAK7X97wm1x3Hx7CyysE3mY9EwTjGKZceJBzUcQFEUker1qERPbBxEvdOIj5Tkgq/Ckn5JteasPfMRfinJYPb5AtUIUxz1uCjxuyau81SAVGOdW/FbU16xzEfJXmFbfOl1P4JcNzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE5M3YUtiK6EqFdlfOjelVGMYBPtUfHpk9ujawMofIk=;
 b=BDR8PqOMI07BEZoNnGKa/SVvv1szQkjgUrjnf+A7ZjycpOuZ8vqNq+6D7QSQCm0RrVbdMTAiEHiiAEzn6vPD1C3CL6tqVi5VIzAJ35P/RKO0GU/iUl+pI1ay99zyDWRF6f85fAibKrrqFQV9plTDDecJSq0wpMNMA0h1c6gg9jQjstgYRsLwuKvN3UE3vhhLMr814KzD2zy5me2LRzF0vyY+GZFLAf/gEtbg+h52e9lNsYcS1bibMzKhXzxXwyAQnr2P06mN7qA+3KQxiJWHENYG667Dob2nkBFj9DJf9X641IgCQ0p0k4X+yW/0A/ogvbOTBnW0mo+h4OLEITy5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE5M3YUtiK6EqFdlfOjelVGMYBPtUfHpk9ujawMofIk=;
 b=Sdt/0rkPxS+BN19QRGP2XprIY2rDCeFORmfmSy/0ZBemnsgrfOEK8mSyNjoSS+nLFEoRK/We3xNMBuPB/QEF/w/YoxK03ztyFAvH98aq0+9f+OIh9a4fJpPu3w+zxQBS/yVKop24gDvmcuzQEgl/i5g9fjYJhNYAohZ0Rom7Pfc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:56 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:56 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 13/27] drm/amdgpu: When filizing the fence driver. stop
 scheduler first.
Date: Wed, 28 Apr 2021 11:11:53 -0400
Message-Id: <20210428151207.1212258-14-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30d0a7fa-5760-4642-efa3-08d90a5819d9
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4462A32BE35255B90601ADBAEA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24AAkvZYn+yUSmlHjwzA/j8QtAIkDY5ZOKO8ZRfJ+2hZZA/p2nut7tLU5HTyrq3sUfGfmDdReQylSgCEaPL3i92AxyacYKevOH07MQnCufPAmI+lrzwOa9aIXVTxIy68lQyHhhnAU8sO/Jm20UE0hx8I+pDKkw8aDkjmnLupgfM3T6WavzZeg+IcrKKxYA4cRK2E4kNyy1YjpKuvKcJkIhXj5HDY+maI9qbt0LIF6XYU7KwSF79iyzzSWi0F0pShRuePQnUdqM7Um65bkFTapUtgx92wk2C/7/okgNPz8bgYemVVxfwywLmIYgk5xPzwrXeWZxH3YgGQzfZfWLU90OXPZlnO0VstI5Kznl+BK05ONbfRUpNNwNJEB//q/yEw893hk5oxY2RjxBk//pPB9E3XTFKheQdmMRDHUu15imc1LpSQi7TfjAZOaFEEXZDq4zzWi/KoHxokLqa5yNxS6nQNP4X3UAA6rKdHV4FSJAZaHwzJIEuzoogSkSyRrm5SdYi977+JCbdjcU/Sv4oRj+3DbxOdEhu3JpAN4D+cChP0Jv7ZPre85m+PITXiz3YIxIxBRz5Ta2/HJNDjbaicuK5N1u99XiyOMahVtS1UZbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(478600001)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xmb0RIl8Hi1CPG1jVs2sX1LlbS3EVKWfOiJ1CuA4wI5kymeGYMUmxjnhwBZZ?=
 =?us-ascii?Q?n+rSI3lZNXzYaiJ6avhKlELRcBMJIqQ0I2OWGtw8EBcavbaDShiM/aCuywUp?=
 =?us-ascii?Q?QieRh4XmbfuqsUlRIioUIuj85OAbiVP4pMNzBc5s4/v45+SskOcYFFZilAgi?=
 =?us-ascii?Q?GiMvOUVcXv2U23ouzkNmoedZ0w4U+3LEe+Oir8lUYLU5BL4N2StjUF7ILujz?=
 =?us-ascii?Q?oph+F16DIJhpLnlvnwew6DyBC+Szg9FqkVSw2Fk2KTl75TtaxdDraD4r7x+V?=
 =?us-ascii?Q?V54KHSi8qdP6z3ExJZ/Uyb0U2qJTiwG4I2EhQ16RUqXON1fnJJUSa8CS9dH3?=
 =?us-ascii?Q?h1qR77OCH0fg8IbY6QkUzEoMKCODvlW6EcgIic9toMegVK5kT7+7sUFfMseL?=
 =?us-ascii?Q?n5KotzoeWZNd+sgRp58SEaZC8PeTQyEANhxzWS6G4r+fbfEIyz+a/Agq+E2J?=
 =?us-ascii?Q?0046s/VtYOArUe0PZjOl40EskPwTyjdKNDgo/q6VRlshhRshObMQn/Ib/C76?=
 =?us-ascii?Q?sJGfgpe/8b1JRPxcFqXTMtrALK04JzZWLy3zffnhHSOh2XRlmp0i/waLnbGL?=
 =?us-ascii?Q?XYuCXU3JfDbCnX18jgfq8yMq22J/fcRSEB/xd+k9YQwCtkNVL3hRnGca7xBk?=
 =?us-ascii?Q?nJR99K/vyVbe8XL4I1yp7QgjZFRLVJrnF8mmwZsQpMG9DLuQztjZ6cwbjUZ7?=
 =?us-ascii?Q?w1P6zO+NfCEyzSIKm2psZeEnXJqjbLscpCMmarpVf0CU1+AmmO1mWMs8B3/a?=
 =?us-ascii?Q?C4NX3FAURuD3ou6yW5QWXY03Ec3YZRbbFcThMP93wdvWZi7ukOrUlc+/dMWd?=
 =?us-ascii?Q?PAkHhT0xPGW1V9XuMfDM/KJg0mXJH27gMPHPbEIO9wSeUki4i9k4oFC3tTyD?=
 =?us-ascii?Q?VCb/UcAgp4akxFVKp145dwKd48rVA9rsBMtAZ6EYSbthmvnrMDpmnby3sXyD?=
 =?us-ascii?Q?BBoAEKR4iLkk/EJ68xXwOCpplrmHiL/0til5UwBo9eghlP0q1o8Qpk5guFGS?=
 =?us-ascii?Q?cAbUjnChEJiHIFWZAjWof0ohylLN8sFBzkj9OOxgXYL6Sp8TJD10CSkR2TkR?=
 =?us-ascii?Q?pnKL9pqZxGfJiNxMsdIxqB8lVXboIJNT8rKvR+vpHWUfBETPdoW8NyifC/a9?=
 =?us-ascii?Q?67F2nSTerFOPOpfm/1+fFYB3lgAIwe+N6MSc0kZChIDt4RXAiykhbOUSaImm?=
 =?us-ascii?Q?1WkOr+W13xup+mvsJUMk1mdEHVE/HFkgjKMesUj5jeiEI6Yi14Y/TByUVuXJ?=
 =?us-ascii?Q?ibJL+sCJ4uBL0UeeH2nB0gDCXKu/cVO0abOVGGqivChUktVfnbSpzRaA4SGs?=
 =?us-ascii?Q?9uchyzcGOMEIAl6nf5AxFUy8ub8wu7ylFABfYIY9a8KA3ZT45r1F5BxA2Wsl?=
 =?us-ascii?Q?4RBSguVGRlYSj7lUnYdqx9ti71Xz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d0a7fa-5760-4642-efa3-08d90a5819d9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:55.8937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRQhDbn70CGOlUOUVgxhvkNuN/LqQeBzRAe6uBPyol306BaBH95PxlVtX1v2KHtAgOJE1Oi2Ju4B66sAZtfLxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No point calling amdgpu_fence_wait_empty before stopping the
SW scheduler otherwise there is always a chance another job sneaked
in after the wait.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 34d51e962799..fd9282637549 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -533,6 +533,12 @@ void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
 
 		if (!ring || !ring->fence_drv.initialized)
 			continue;
+
+		/* Stop any new job submissions from sched before flushing the ring */
+		/* TODO Handle amdgpu_job_submit_direct and amdgpu_amdkfd_submit_ib */
+		if (!ring->no_scheduler)
+			drm_sched_fini(&ring->sched);
+
 		r = amdgpu_fence_wait_empty(ring);
 		if (r) {
 			/* no need to trigger GPU reset as we are unloading */
@@ -541,8 +547,7 @@ void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
 		if (ring->fence_drv.irq_src)
 			amdgpu_irq_put(adev, ring->fence_drv.irq_src,
 				       ring->fence_drv.irq_type);
-		if (!ring->no_scheduler)
-			drm_sched_fini(&ring->sched);
+
 		del_timer_sync(&ring->fence_drv.fallback_timer);
 	}
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
