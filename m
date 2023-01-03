Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AE865CDFF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 09:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1346010E0E5;
	Wed,  4 Jan 2023 08:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 892 seconds by postgrey-1.36 at gabe;
 Tue, 03 Jan 2023 18:58:25 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF14410E4A0;
 Tue,  3 Jan 2023 18:58:25 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303Ie337020041; Tue, 3 Jan 2023 18:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=PgulsybQyLqZ6rBO0LUQE8flxwmMVm/rIPtX36/HiHE=;
 b=mSOg/vjwkBY1J72iPshwIJ9ETlaLAfEOUTPOwJqTeKfSPncL5CyQiFKig94BynZ5l4iC
 Pj4fYaGZWT/PtAxV4jN7FSqz9i5yvL0gannZ2+Uh9ddeEUnuiSdJBs49Pi34R5SCq62P
 oXOWDR+M1dKiVRo3VxqgtV24WhFZQndOfFe5AFLG9qHWi8R6Vu2xQrKZLHg48lI2QcJ5
 BbD1hYnRtH/Z5DwnQ/PSbd+r+cGh6LrbHTnzXW2qcDi2Wegp+lpKF0xeALGlt2loTOqq
 2ktkm8m4GX0a7ouQXDoqiKM41MqLBAV+VSoC6Nc/xQQjwKg8fVooSnMhiThpEaL6WHp2 gA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtc29suah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 18:43:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BW1gtwLA7ehrOrviV6hNlaMETow3qaA5v9vJwWN+xjY+A9oI8UMiq4EnbK4SOy0jMl24gg7Cn/Gl/1dCjOtrMYPz6+GvY/CmTHwNA5KOrIBebrnc7Y4I2r8qpMbOir2eYa52pbgg0HO+mh5DoitDrYf9R8ygI1v8j+wLtt5ODso5ARwKe8/xF56ikNBWx7fswYJsZBPtzUMO6QYE3x13ZgUHSkBTkd3H792q32/01KqMMWSXN2uA1QREoch0Etgj3/He9yfpfWsQG/YoOZJrGSGjZMCNHpigQbiNEyAaJJXyKmUcpR5d7G8FmIcpydbC0dytAA0noKQXxtNozyuVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgulsybQyLqZ6rBO0LUQE8flxwmMVm/rIPtX36/HiHE=;
 b=mUBY9WDE9fjQrcGjtVJdfRJHEGFuFrp1VFAvOnYTuZ/HZpALrI5ug2aCZRBGrk4U6h1ZMxzJzdzuF33pxSisdARoFAQg8n7W7Q1kYs/xz40TwFhFFfoz6rpLgwowX5hEZk00VKleYvgVLWW2QXx06QFjTAJAUuOKeOKJFEN5rJ3VW65EZ1GHgoQkif2gM0r5qTzcYGfsR1PIQFHHrguvE5eezH9EbUXbIl39YFNl63YOJYpO4+BuP7V63flD7Jy1Ep0d235Onm41afcD1xj07gb+f0Tm4Rt8/keyP7d/JUonggLqvb59uIrkzzeEtuv051cgWJi9KVqR2/FkSWG3JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by DS0PR11MB6352.namprd11.prod.outlook.com (2603:10b6:8:cb::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 18:43:24 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::52f4:f398:b983:2380]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::52f4:f398:b983:2380%7]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 18:43:24 +0000
From: Dragos-Marian Panait <dragos.panait@windriver.com>
To: stable@vger.kernel.org
Subject: [PATCH 4.19 1/1] drm/amdkfd: Check for null pointer after calling
 kmemdup
Date: Tue,  3 Jan 2023 20:43:08 +0200
Message-Id: <20230103184308.511448-2-dragos.panait@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103184308.511448-1-dragos.panait@windriver.com>
References: <20230103184308.511448-1-dragos.panait@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0295.eurprd07.prod.outlook.com
 (2603:10a6:800:130::23) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|DS0PR11MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: 16012a6c-f082-4e0d-0b7f-08daedba6508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wUjBpd7SIy66owY+843eXFWu4JeAv1MBxqywg26ocMbIQX/3CF9up5eH4ViaAkiyj+4N/isB6fIn+Sw7sG1JWSozL+n+4xABO4FJFkgelPCQsypP3kcvF8R4vnopMLB1M2o0E07Qbzt+/zWJxAtheZyaLgkAFKzgSZsRZHF1kIRs1996DKBKPd40vnQ3CAfizfB6757ZVmtpo0iH/3eL2N/cgTKPSRP/NDTrjez1+dtxTRb3CrX4Y81IMuOREpWYEkyyIfwtB5ybOyRHksGa1kNCwDEcc8l5lgsLL5eXdrYQUsn0Tr3sVwJczAfv7RRHCuvPverRuXef299xneXYP38NINaw/EegoPzoRJ3hpZgPLaGW586X2ufoRyKNB4s6agGrhK83J/A6Kipi2lF52DMpgxqGeuxsEbWOiFEZFZA3ProqgyJbkK64aVS79ND9moLy/kzZOrw2AKSGaMauwMKqy2ZpfgglPCK5JEwH8NDtLSE9uV3BEt60wG3+KI5spXzd4pdAqGcshUKZLn0weCp74pGPA39FGDHZyhf7I1Ui58rTMPaRfO2DjF4jta1wx7aW68VgD2biiuwz/KexIwBDJMJz5B1qOGdgj8QVncNk3Cou1GKOzJplgEK4ZNTRMNd6RwGyCLMocHmWLp51Txq+YWfZDJS5fRzX1sJHr+4qqsF4mrTAtFXqXPMs/rkrHUf8Xsg2x1qwm/BUojHA7EqG8N7UHGnNgINxeVsB5WA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(39850400004)(396003)(376002)(451199015)(66556008)(66476007)(4326008)(66946007)(8676002)(7416002)(41300700001)(6916009)(54906003)(5660300002)(8936002)(2906002)(316002)(36756003)(52116002)(6506007)(6666004)(478600001)(186003)(1076003)(26005)(83380400001)(2616005)(6512007)(6486002)(86362001)(38350700002)(38100700002)(22166006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X7R+/ZdPD37gsHxvCSOmK4QbantXGs9FHVqIoYB/GlJpJXLl8E+WWUBWIzaa?=
 =?us-ascii?Q?cE8b+DWqc587zJ/dbJJphemlT0z7tHz6UcPD7A1XD7R+u1co3I5TYqVvQ7Rf?=
 =?us-ascii?Q?zqxDcVSagEcuYvuW4RJ1kS6J0bJr+xMGxWANY6y9G6fRegkBvlKbcmhY+8BM?=
 =?us-ascii?Q?axBri/qizTCW4NgqpOocmu9SGQfrB3LTL3f6+sB1KUL9Nm2tESTlaG7fQrGw?=
 =?us-ascii?Q?E1vHs5+zaKWSBykEgOziWOB5DVKA8iQQm3nt4qzAKd2uzIvopoYI9wC2ZD4B?=
 =?us-ascii?Q?qNFikS/xhA3b/G9hszjOKMT9Z7D6le6eZJMRrvEZgqe2D23cxdsCGiCGR2S2?=
 =?us-ascii?Q?DEE56Gl5pZdvun6uY/FypgQUa9653vNZ3gFMgYJ07aQwB94rmSHVhSgzN+nq?=
 =?us-ascii?Q?otV9Visdp4qHL7feCVmXnKzKH5wlqauI/xw5vN17VD+iWE373jJA1d7xFGOU?=
 =?us-ascii?Q?k8K4/Q7J4sVPI9T0npIpYptJ6UPnlQeJvBXDJVdHt3fXzm/qH5vJM8Xwb4ak?=
 =?us-ascii?Q?28MrRieEWNEKEbBXXRJTLnRaExvEuMRJQCCqB3pSVShqN0MpFur/AGTTAcuK?=
 =?us-ascii?Q?p0OAG2/BGqHnTsDtjkLMAX1ZBywDy1xoVb0Y1O0GLxkPpPJ5j3v+qB9m/hXc?=
 =?us-ascii?Q?j3lgdRNh8eUIiz8KZrxWs5b8MAqaDk7+6gshXktK0/LQKybyS8A8nesHhziw?=
 =?us-ascii?Q?o3J2hJX/kYWe3UL7iUCNJCO+lwfS2v6EhclhSi/BEqx4WXUa+WVod/9JQKMb?=
 =?us-ascii?Q?elGuC4Er5tE4Ofsnqn0fkwYJ6fJhHOq75wuoW5bekHzs6EenLwvgLgnz6gab?=
 =?us-ascii?Q?boOkFvDwqXIy3DbMmEAZ+R3G7G3WTpAn96kJmVvE2YGuzXXpRCXSbIUivX0i?=
 =?us-ascii?Q?r4GKlWAsKVB2rO095PRhkBpWVzAYEadLn5kSrHn+Y828nIpalNwqhnEzvYsV?=
 =?us-ascii?Q?xlycLg7wwDiIlP+cwK8rPECdAwbr5zyfrbIaeS42DveXUrfJaTS3KpJp4BY6?=
 =?us-ascii?Q?PagtydzAgJEMzEXGRxXW7noiLUPCP4CKhRtnVnbU9Tjh2fuN9XPjLOYr+Ezc?=
 =?us-ascii?Q?itXk3eUYNrfEYFUBTw76Hcec3reJN1C9YMSNqgJqrs/E4F20BVYmilBbbVDa?=
 =?us-ascii?Q?ac363F8MP1ijWfKO4EF3QwrK/ajKavT8mmD1laETExumEYJoc942J4XxXNln?=
 =?us-ascii?Q?EHSZNoqmD6Dxt4w8Dz8ujWefpiRj3YqhQPEDoqCCdNXST0w7vDorM04M5c1v?=
 =?us-ascii?Q?+EYFpjucTP+vJpaVGIC92RBJjjj8GRHwQe7Vnc5iPLn4X7LF8437YB5gfG4v?=
 =?us-ascii?Q?TeTHfxeLvtzyi0PBJV4oqvwCILqyz9uCLhKWc0ohdAFUn80+LTDkQp2ZoVAa?=
 =?us-ascii?Q?Z/1nyHHS/2eq8mv9h8IDbT0s0n+sg5gAZHaAb3ZasQFHco1A/oAtpk74JoY4?=
 =?us-ascii?Q?/dZx0zLiBbMp0P3EeQF466hAQaW2Qp0qMH7tyYdWHC5iTjDucdMwhJKEpnrJ?=
 =?us-ascii?Q?dpnU9cGHGMIvCmm7G4bGR/sNF/3GYGUKaIQNfMO/cyiIaQKfTgm1XOzEMRaN?=
 =?us-ascii?Q?cnizpEYfj4M3P1ANrU8d5ZlI+b3npNcmti3FCuIvV+QymbQgDb2p88Si6Ayp?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16012a6c-f082-4e0d-0b7f-08daedba6508
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 18:43:24.4364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Per3bNMaCOSwctXzfSWcCH60y7ZmkAt/IUaqq3hB0+8ek6+okzLvfHabtdZtBjrI+yVmVao4zp1cZEx3qPHx796WXqkTUl+FjsU38LUCv5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6352
X-Proofpoint-GUID: EgKYiHM-CWYZI2DibX_SiYPAux0NlKbM
X-Proofpoint-ORIG-GUID: EgKYiHM-CWYZI2DibX_SiYPAux0NlKbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_07,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301030160
X-Mailman-Approved-At: Wed, 04 Jan 2023 08:05:38 +0000
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
Cc: David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiasheng Jiang <jiasheng@iscas.ac.cn>

[ Upstream commit abfaf0eee97925905e742aa3b0b72e04a918fa9e ]

As the possible failure of the allocation, kmemdup() may return NULL
pointer.
Therefore, it should be better to check the 'props2' in order to prevent
the dereference of NULL pointer.

Fixes: 3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index e2780643f4c3..b05ca3e639b1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -397,6 +397,9 @@ static int kfd_parse_subtype_iolink(struct crat_subtype_iolink *iolink,
 			return -ENODEV;
 		/* same everything but the other direction */
 		props2 = kmemdup(props, sizeof(*props2), GFP_KERNEL);
+		if (!props2)
+			return -ENOMEM;
+
 		props2->node_from = id_to;
 		props2->node_to = id_from;
 		props2->kobj = NULL;
-- 
2.38.1

