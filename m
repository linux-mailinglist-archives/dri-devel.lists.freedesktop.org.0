Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FEF7FDBA1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E792610E60E;
	Wed, 29 Nov 2023 15:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C77E10E616
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 15:37:58 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AT8LshI017229; Wed, 29 Nov 2023 15:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=Uq97Nb36DTRat9pQJC1Rc
 /jGgOz6aZ5vOUzPnebwjAs=; b=Y3WtAedzksknfG0ZJE0A1VZVmTWttyouJoa7N
 7ndEeuK9TExOo7O5c6XPrL0e8LPWriG0AK/y7s1bVUOCryGGSQaLWOcbv6q1pn+e
 00gF0tZ1UvZEa2KIzfQuACjFPTG6kB030mRIkBtHPpi/qYwMw9xS3F/NcXpjbq+Y
 3+xZi/fSzjCNAzwFMiTxASMTVbZhK1i8yuTSo2nGP9DF1aFnwLItAK7ATdEpUu3u
 ZThud50FaubZ4TDn0lU0BkaCUzuKFXUEJzdd5SHPYa3LiOJ252Vh4msL7eShJCb8
 Szd9cIV4QZgV5DRAoQDwYqapOD1iIDY/af+mZDoBl5NbXyZVQ==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3unvcq8fge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Nov 2023 15:37:45 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 15:37:45 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 29 Nov 2023 15:37:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/MeLLQ4iOfZKmOJJH//ET3iWt1GzWR8u9stm5YCzO3M1xeZHWcJ8/5CiUpC+2Ev81SQ/lXwNC5EYhe995hvpS6FjjJ4B7dpGFOSuW8R42WZ+uFSDVjJrjvUkvsToZuxjRT65w0Y/1pWF7Np2NL+Gtr1p0b+Q0imtxaqVUjJaVKO9KuYkKKlOcIoIkILaIK4VikFaW1hdyszJi5lSULPLqF2Tsm+9bTE1Kt7sQ3ar/QV2CVOGeG95O0Cg0Wlno724HQJ1HApELg8oT4zUaSGIXir8VYF9FXVmKzdggQ7JcZekr8FHqNRFlw7LEd10xNzHeNWHe6v5QXVlRRjOt5E7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uq97Nb36DTRat9pQJC1Rc/jGgOz6aZ5vOUzPnebwjAs=;
 b=HDeWUl01MhD03tF7ALY5Ep/6CFaGib60gujcuVz95gjH0bHthUVmVpy3qvjP37GDKp0S6iIPerYRLgEAaxDfBOIuBHGiQFBtpzf905I/EFno08gMJnG4h769FIZrgQBCuhph6J2zRpH5VXnOLVaMOMPJL2BGaKdkan3+E8hUWWv5olKoqCnTKxiyDQ/zpZFZNxiewhIIo+uo+JLQj0trLBFXVH7+pCAgahyylWnouAuyw+2AjMK1yXnS1kdJY0d6En0Z9n9WjfvDzl9O3Q4pyF2xLWmOkMw9mQ6fXXxGu1JVsdcIK53nFTnHfN0nPFQIX288z0OFZ7TR0wfTGPknLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq97Nb36DTRat9pQJC1Rc/jGgOz6aZ5vOUzPnebwjAs=;
 b=MiOh7jo5/HpcJzEe713HtM07G50EXgqtaxApvnOp8Yq90x1CG8AdEZOL95gNB27GS54oH52MDgXVUxkvHx5kXTjAVrnqxZxqdtMXiSoAYbJUoGBaKK2x8KBiXenbFGU0pTadYvaBYyiDkNb//QQsS9mhq+Q0o9jjdPYAkbXRSbU=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO6P265MB5951.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 15:37:43 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 15:37:43 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] drm/imagination: Fixed warning due to implicit cast to
 bool
Date: Wed, 29 Nov 2023 15:36:59 +0000
Message-Id: <20231129153703.162642-1-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0541.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::12) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO6P265MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a3a702-d468-422f-2481-08dbf0f12104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XqD+Qj8A6ERLha2WcYaRbOfH1WGb5Wl5rSHLFoVelXhPvjr9ZoynjE6GoMB3r9JjAYcaZ6C/bKaeC/e2OEBABsCSlERgeebXRGUIHgPJfP4H7a1iaRnnBtrnMfvIYFSpB9sogZanWNqx2H+PUowLQg7cuHJ9T8cz2cm2u9HC+vf9YahCDI5NuRlvJ7yNv8FlO/mWEoyoZp0bZwO1LiP3SqLztUehMWDefiw3iucFMM8sEQQtM7X3KAPczdoEGX4toAYw2BN/G2bij8BgJlyy/OdDntPff1f9e0W05KYujU/Fguu1RE8iy/DJ7M65N8CBFz5+lrPzc6HfUz2EonvMzSx5Tpgf8lZZDfwbLvcEpPWSSJJ+H1PLh79KtCjP0p9InopYTXaz8gZ8O1pXrn748pEci2MMq0NUkogn+F3HYq7Am27rrdNrE5AaLErxQgOm+4NhlEwx1VaAQSGv5rj9EbaBxy6vlcchaB5Ob57sfYKTw914EOTZnH53BDnpIPCm7iBN745uFyEXTmJcsmHGhAbbRlFm2Rp3Fs9b1sez/7+TkWJqSQkcBraGsaz4hbiqvPPPcXleX/E++6bRBpfhpgKOYr6UJ2NBNrb6Z0gKPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2616005)(1076003)(26005)(8936002)(8676002)(4326008)(6486002)(478600001)(44832011)(86362001)(966005)(66946007)(66476007)(66556008)(38100700002)(83380400001)(316002)(5660300002)(6506007)(6666004)(6512007)(38350700005)(41300700001)(2906002)(36756003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7gWrdpXnY9QgCnYRAQ6a3TaN3/JiEzxLoC3a/NR0QFefya93MOKempgPylhG?=
 =?us-ascii?Q?6qR+4lxP3zs1QOEYcem9pPw73HY9aK40hCVOjQMaFxVrNiDZQoPLP+aXo6gQ?=
 =?us-ascii?Q?0D4Jx3h85ML9Vmlb7WgrynVqFY+r402mxx4f0CVcMxtclgdTnRb8qY7TQHai?=
 =?us-ascii?Q?/Jat3CT7+Y4gzyxEod27VY+fWA/DjrAO2bw15oc8q6NLRq72MrwSu6pxFnn3?=
 =?us-ascii?Q?X4oAKJ9lvnnzswwOsRQeO3x3oqWyksgNFpM2OOHPlDS4Zg/aMLlsy/wrzlMu?=
 =?us-ascii?Q?9aT8whAIXwlabb3h6pu1LZbc1QwKxIHqwzb8p8FBgAwA9Je19sNLIp3AiYVs?=
 =?us-ascii?Q?EHJn4XmURiqTTVyJ059t7XzB1XtxAuTFtaniqREVsMjYE4cKNXJ1mbVJ1fzf?=
 =?us-ascii?Q?qQ4lL0jNq3Jp5ASYh1UqsFWBWOpFZu9dhZHTZkKwPXNClMrbbUZAmtLSXwLE?=
 =?us-ascii?Q?R6oY6vqeTUqiozwtrw1UYNihHTrht8eu7RmOougoNXh3w6kMkIjfoLspNEMT?=
 =?us-ascii?Q?6wrjgsdefuDyLY3BMwhSzNP3zZTQFcfCxOLScNervkxV/kgODhS/navXeTu7?=
 =?us-ascii?Q?aVwC+MrlEkwFzTsHXnJ2wT2w1mlZfJ7Q7zS4STXXZpUxd8FB+i6GQ6Yf2LFC?=
 =?us-ascii?Q?wy3YNcifHoZybOdkYfguQKsoIKwqchiE1RPARM4rvKZF2z40cPRohh1ozZMk?=
 =?us-ascii?Q?SmA0hO4mRGDJ76Phnc3RSAoUaQhzCplPaSuyJWrjoNq3Qb0tSlpqPeWmp/YC?=
 =?us-ascii?Q?My6rx6PLT7YqDZyc+zgW7wxNzGTHnBFDLHfz63oBetk0c84ArrsnI8Z2jyBe?=
 =?us-ascii?Q?8tglp8PLjT1mlRw02YxnR3NvLgT+EznNc7D2Hx6d9nUrWCc7TyVz29aZC/FS?=
 =?us-ascii?Q?MOA4ldQ54b1UTF6LYr5jQz5gp8I65QvvP9y1xd8HXVE17o5XxGjQeLHV12aK?=
 =?us-ascii?Q?nicMdxhSlL3p22lgOb6HXoMxGx1ZcUlzctweXRaJKIsvd5xSqL/5y8HB93UD?=
 =?us-ascii?Q?cYYtx5d5Pde2ceEXt1nTZScSasZ9W/eCdkPTzRUGPJmY3eK0du/Z5mDzcjiS?=
 =?us-ascii?Q?T2oKEJLZcuC3hhhrq7U+7DSh0AuhMWlrfNIYb6J51V7bZn/lChaXiYx2u8DK?=
 =?us-ascii?Q?zBYC75s5IwaNKoHgax4pjC/WU0YHup9m6fClaMWPSfkvNpCXtlF1Cd7QoTYx?=
 =?us-ascii?Q?eZXYv6NE61wrlcNEfMNIFmni1CLeuwB0fRH7VVG9DiSRP5rRj2t3G15oSf4j?=
 =?us-ascii?Q?JlGkiW0lpwUiDhYPnXxNv1oF1Bvo50xo3XyWykx3KwT+9NRYDKOZHi/kjtjF?=
 =?us-ascii?Q?ICwft8FiuawVtNK7yt3Z9EhjMqnwRhFmRiA6fd8r3vet1vgPDwvjO+tFFWYq?=
 =?us-ascii?Q?6vmJdx0tEd4ma5WcEi/cem1WB72WiBpE2pRXmBqVhj1XcesQmX0e9uT3f5iW?=
 =?us-ascii?Q?tcfTFHaH+0EAEjV+z3QM0nqpDsw6Ey2bLaZui9De9Fee4WZd7G19vLqtdnDs?=
 =?us-ascii?Q?dShEQLGsDYv6ZubBRsnaGTuZQ4um/7Gg27Xjqa3U+dItMD03wzfbZ4EGdCvJ?=
 =?us-ascii?Q?bWQb+Swa8/D6gO/+kCBwtD78lMo8gTqdou1EB+/wlDq1y53neyI24xfBDSGn?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a3a702-d468-422f-2481-08dbf0f12104
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:37:43.6036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnEgOIqWovKG7tDIMUmqfLDJStUXNd2k0pV4hOOVSLQWq2NnZ6OL/hp8+N0j7bO4+qW2xBItapPfhbTfbC6fsOgnK4XTU5bkKCGqxKVfnzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5951
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: kgNLhVG93MXvx-Bi5FvEkGBt16PFNhDe
X-Proofpoint-ORIG-GUID: kgNLhVG93MXvx-Bi5FvEkGBt16PFNhDe
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
Cc: mripard@kernel.org, matt.coster@imgtec.com, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311241752.3iLyyFcA-lkp@intel.com/
Fixes: 1ff76f7a5b45 ("drm/imagination: Add GPU ID parsing and firmware loading")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device_info.c b/drivers/gpu/drm/imagination/pvr_device_info.c
index 11e6bef52ecd..d3301cde7d11 100644
--- a/drivers/gpu/drm/imagination/pvr_device_info.c
+++ b/drivers/gpu/drm/imagination/pvr_device_info.c
@@ -227,7 +227,8 @@ int pvr_device_info_set_features(struct pvr_device *pvr_dev, const u64 *features
 	/* Verify no unsupported values in the bitmask. */
 	if (features_size > mapping_max_size) {
 		drm_warn(from_pvr_device(pvr_dev), "Unsupported features in firmware image");
-	} else if (features_size == mapping_max_size && (mapping_max & 63)) {
+	} else if (features_size == mapping_max_size &&
+		   ((mapping_max & 63) != 0)) {
 		u64 invalid_mask = ~0ull << (mapping_max & 63);
 
 		if (features[features_size - 1] & invalid_mask)
-- 
2.25.1

