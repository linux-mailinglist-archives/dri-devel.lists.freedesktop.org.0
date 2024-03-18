Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E387F173
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 21:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1111120D9;
	Mon, 18 Mar 2024 20:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=phytec.com header.i=@phytec.com header.b="UZDROOE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2121.outbound.protection.outlook.com [40.107.237.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EEF10E0FA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 16:17:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRVsj/jFS3B4gzL21Xiw1qiKbjmjcc7WhyBdZGSmAwNReWZ1AHUech1s9AwbbINSIn9IRq66bC44RSMTQeSbkFJvDn0JnttQKFOzmrBfkX1gPt5HwxSODUtULsvB/NSpUgn4poPJJ7bfqlG0x0q4HrK9aBHibT4frDFmCHXfX23f5nBcq6KZn5pYKlK9DL+8cNqx+a+E4BSv7MTJl9frg5ERbVQLjxh/tbF8jK/Sq8DoV5euELFO2Jzk0GDIcjgWlpJITA1Vfik0FhOn4sCKTwr6EjY8c1//WO+A8cHUfJTkKRKCIGzcYoTm0ZSQPMQB/SKzEvKa+V7FR83laLTjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ42JRc1ZYJcMhGdgyZ6tCHc2Yn+0aiyyZgddRpoGrE=;
 b=ax2lcnLDvpB3WvV1OoDGpEde656gEXeVoyiPLalIq4l/xZLNAt7nfxvayEAj37Zi0rqb5DlQ4voabYdUuEdgYHuTgHTVaESURPd6T9NjJ9inJguGn75g3YXRV4hqcXpETTYD8V9NugpXroZAbMMFdyCBXPnb9hvqYpY8CCDlIroPFloTAQjkXQfC2qIgFgVh95bT4YqbqZGJaqLMt9giMrrRctU1rqFlCUkFZzRVo5fxK5YxXs7rSdHDeQxmSMiOgH9GGEG+0MnWqkGBvN8vR2yt/H9Y3bRITCZ/6mEUaNhxIqkUMDIUs8YQD1OB35SKn4XhpZp64LqaepsmFDrAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ42JRc1ZYJcMhGdgyZ6tCHc2Yn+0aiyyZgddRpoGrE=;
 b=UZDROOE8bUm9tueNI9Mi96utDu3sJ/2zMdm5EftcvvYHfhv4I/1E04yjqOuVFENWohX60bTuabxwVXUdbHiBYrX0UE4B7EtBO2HCigHI+EkM2eILxiu/yN0m3RKa7LgA5DNHsshlW9I23/n0WyHNsvjXzSa6C4r/SJcg2UNVDx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
Received: from SA1PR22MB5636.namprd22.prod.outlook.com (2603:10b6:806:3e2::15)
 by MW4PR22MB3715.namprd22.prod.outlook.com (2603:10b6:303:1be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 16:17:22 +0000
Received: from SA1PR22MB5636.namprd22.prod.outlook.com
 ([fe80::e6c9:dbd4:f002:212f]) by SA1PR22MB5636.namprd22.prod.outlook.com
 ([fe80::e6c9:dbd4:f002:212f%7]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 16:17:22 +0000
From: Nathan Morrisson <nmorrisson@phytec.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 thierry.reding@gmail.com
Cc: w.egorov@phytec.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
Subject: [PATCH 0/2] Add POWERTIP PH128800T006-ZHC01 panel
Date: Mon, 18 Mar 2024 09:17:06 -0700
Message-Id: <20240318161708.1415484-1-nmorrisson@phytec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:610:e6::14) To SA1PR22MB5636.namprd22.prod.outlook.com
 (2603:10b6:806:3e2::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR22MB5636:EE_|MW4PR22MB3715:EE_
X-MS-Office365-Filtering-Correlation-Id: abe7dc9a-73c6-42b8-7fe5-08dc4766e47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9hWc4cGSj4JP8g23Y1es3oMPZuzkc7G42ISFIUmaP4VQ0BXOO1FlHC+MVnIcV3CP8eFvIUwH7Mi+1XKz3BFGyYl2YQvUDmS6h/Kiku3Zo3hf6D3jzIb8gKUxT38dZxFXXbwKK9Zz6ipQyNHOdHgLzo52bUAb1Y2x4VuaEH6C96cgZFI2iDlhMRad1JcTwVqWK+dzbgagykQPXXVVl1NFD69m5f+WpeEKw/Mc9bfxl2pefBBom6QYiXQdV4xh8MqCxG8W4qbYNJirTx8E0XZ9Ebgx6R/8c4FoQKPaaSDEhboOZARCsHfausllF6MAoKmafCZci7SHspp99Ls1eHKTAmUS6w3bNgPVJeKGk2ZdxD75/MBS/gOo7LqCAU06+1xk/lM0rLmCk1al1pyGRY6OYPB+G0qau4gtuIAm/67350oCIPzZGiSmBPpGRI9i5XRfkPXvfG2oZcDbTOQUJnxVwFwFSK0qe8/UAdBpPZqEy3pBIMLRMoIBriL0B/TDoYTatMnf1SKEIc6uO1JI3WzUqwVJZa7ou5Noy3FPtQnOsRncAcqll5w721+/EjjK3db43BwFI9tINDINpHhq6SYichV9Oq3lfPKT82H3dWEGg6/EgSzjpB5dJ+ylwym0oxE9xWGcBFBZACwn49Egk/wRdXZMuIquBEcRaSYmI6q/yX7bk6wFhCn3M8pCJqnzyHNHYyCxTNzW/f9HkK99nwx2zZruv4U8hnUvjUfSPMV/XE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR22MB5636.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+XYM3M/E6XMC2x2mPrwO8Z9vUsEp5fUVPrJN099bhcjVcei5XOytbCfH/Iv2?=
 =?us-ascii?Q?0NyGNK4Ahzu/+R9jLch7le9uCn+j7YIMuCPiG2qMIGwPAgQMEkoGdBJnzOa6?=
 =?us-ascii?Q?MI2SApcCsO+jGkJjQ5F9er9SQKYwJfuQpFGhdwPCVAfYYDFWpdwDBM8h0GvO?=
 =?us-ascii?Q?o9YdPUGKpl9kmXHw81Bwnyva43fDgeMRvz/K4iZkAfe3bDXgi3/ymjDEtkNg?=
 =?us-ascii?Q?quseJB3MQeITM7AuwOWLCHTF/ZSXV5isflIIZJkPoxuznWJCP/aPF9lwvJex?=
 =?us-ascii?Q?rZXKpeNZ9wEKvZvK64m91uwDLcyR5zNGjJQi0fnWpXm3hy7YZsMU8Qo3ihrO?=
 =?us-ascii?Q?925blju4L1es8CtaG0o3JYG4lXwhs1ksdmwIkQgiZcCJTAsLze0ER2ddp9LH?=
 =?us-ascii?Q?OwDFbkVsJXOGfoXollmXswjT7dJCrPM3JHj2ct+GiMep1MFm9vU8egLj3dkH?=
 =?us-ascii?Q?pO/Vj0rwRMlQtTTkkcS6ArYCPpH7SecFQWgCG1xFYQ+nYjRiNCz+lcZoGzjE?=
 =?us-ascii?Q?UjrEM/YB57E1Y0ZwF4jOM7KH5Puaiq/0tXH5OY0iM2chSiL/KsryTMd/5T5H?=
 =?us-ascii?Q?g0PmIttrFjykLfACcVHoA9PTStN5fsFnPsK+yw+k080+AMR/kTGi1XKFlq3O?=
 =?us-ascii?Q?gp8zlYCMXEjT+xz5VvUq6eX12yqhVzDqhKa0JlMP3iJ9aSC3FKIEUfJej9ju?=
 =?us-ascii?Q?ZqtKVwdGiSvfEXS/j+Y7VmChuW2eMsmHrsmqt2EcRgsG+/I0TiRYo2MAKLHd?=
 =?us-ascii?Q?pqR29iFL7qm0POifW2gzZqxDNLQAlQmjJe6B+O7Rnz08EUiMYxvdGcUIswBy?=
 =?us-ascii?Q?+bWVtyCOqcGCZYGviW7rdzRHw/9HiuwZQwT6DvvHrL2sNgkgco25EK8sI0b4?=
 =?us-ascii?Q?RdZ4WqhxCc5NDU4fNN/+X6ixQsrQvG6B7X0nbZu0IWPBdrKZe2zgmNUL3ovj?=
 =?us-ascii?Q?HYP7I5TGNZyKhcwsTBZRJ4dHuL+EIrVDIk6YBf3mUHixTBARerZOkJcVBHwF?=
 =?us-ascii?Q?jYEM15vfk93NiGcji9t1CWOrZOqSPZpEWkt5NR16dqXAEswD97IReGpvTv2P?=
 =?us-ascii?Q?FxKx7PDGBW8WKmngsJQkV1Z0cGaeQFlmq0iysEq+QGsm2gK0aXVyYYf5I4e2?=
 =?us-ascii?Q?k1YMol43QX6uGyccYZTcKrrRJxbqnfbLI/6DNBWRa3aYBx13FUB/9K4YpH7I?=
 =?us-ascii?Q?7A3P7gr3e63Od1f3TFa87TsKoJHDv64UNX34RF2hva5sAEXHmkSkGSfWt0M/?=
 =?us-ascii?Q?zhtzjsUZ/ZoLx9ViEx865RYE22pGMCoJnS6Pxx/yO1iSF/kQT5nFshgbHb+D?=
 =?us-ascii?Q?SAXbJanhAm98Jmb14/Xro5BpRMB85CSK9UBuLjb4iTWMdph8DD3J3fsLzzcY?=
 =?us-ascii?Q?xnWHER3D0ZuPsr4dud4QsC4fo1hPcaSnOo6ccpZWSrymeS4WBzGDA6kohRO8?=
 =?us-ascii?Q?0olfwFot3XDUTm3NWw9CPNOwe6a+1qtYonG3xQBMJ6vl1BixIRB4MXP1vP//?=
 =?us-ascii?Q?gub16JITss5bFtiA1+/1OOVJeSGtu3LUH+M8JPVY5NeAV+23WbgVHJvZl//y?=
 =?us-ascii?Q?2uudU1TeoSK8YY3ZmF2J2i1985d8kXOBK/1zhPQv?=
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe7dc9a-73c6-42b8-7fe5-08dc4766e47a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR22MB5636.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 16:17:22.7274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 67bcab1a-5db0-4ee8-86f4-1533d0b4b5c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fo3Cuo3LmvTQF+sKuz42chpIi6kqscdcfBSMd4rC3S4PksXXXuiRXEDdELmuhkEWmv4HyGJ0gmM7dI3J5m6UUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR22MB3715
X-Mailman-Approved-At: Mon, 18 Mar 2024 20:46:02 +0000
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

Add the device tree bindings, timings, and compatible string for the
POWERTIP PH128800T006-ZHC01 panel.

Nathan Morrisson (2):
  dt-bindings: display: simple: Add POWERTIP PH128800T-006-ZHC01 panel
  drm/panel: simple: Add POWERTIP PH128800T006-ZHC01 panel entry

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
 2 files changed, 31 insertions(+)

-- 
2.25.1

