Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF735ED2A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610866E450;
	Wed, 14 Apr 2021 06:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680070.outbound.protection.outlook.com [40.107.68.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF6C6E430;
 Wed, 14 Apr 2021 03:29:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh7oGrwLMKIwyjchL3Sl7DLN593bXd9uKIbQKokXuDE4P5Mqc8jH/ZAXCva8+FMAIPUrrjrNF218FgZAXIy5OwFUMGmSDl/NxObZzVMLALxqYC5pj6si2jZaBfRWNnm1O3Qr1Ymd9zmunXva8m71MxVPf0RdP/bi9+z2nG+7MMltV0uwRroHwHHOOnu7mI21qom7547WCsz4VDKEFyEEyNHjtp8JAqCjq5i9mKfHwYDFYfHe1pxMIevAnaiMlQrztlcrcL88o/vLMZRObC8qOI75/+RNYcl6havAlyygZyHhC/4xmgJt0i/XaKjcmsPhjfPOxOPYNuc23MX6lN/npA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bom6wj1T+7mXVv65yQkm7xi/67iYUyPoexbbC2nF3L8=;
 b=J0bOpeaydlmzDKQFTa5EyLrJQuBU17JV/mKVXbzCBJc3KI0Yn8eqdKOuT7EOqy6AFz8U14ThpZyU9SZRYba5ZrBGN3QA/Wdf4e7MlSNPv1mVNtAVL2RvCBcIbgwA+8QWUhmXViUvQNHhJG1Xm+X6wxeaRRK6B/5FAZcQLNVkv4vEafRjVdl+UspN5j+KEy9vtgv0krRAD1AfRDDO/AbtWJG9bmkCFmWkYg22rY9DLFkqnX7sVQ1PHWAs4Q5H+eSTqGWzKHKNI6tWRJMQ3FOuTSUdW2nIzuo7wS7K5DenGWni74IG5NCMm9ZTcs3Sm5gP5g3L+o8yN+JDUD8cAXxwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bom6wj1T+7mXVv65yQkm7xi/67iYUyPoexbbC2nF3L8=;
 b=IJVkl2eszQN9eDgiS4teyMMGv4Y0w5MR3DFio3BOdC6depTZyL5ifbZzOzcNA+zS1yAeXnX5suEuzaPA8lKhdklfOizO9J//4kq8290o9TijvxhVbyko8HceYPZ48rtWxCuETteDH3TLtc1yIap8/P+22vXaA8jvmdkeSEh1pxY=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2579.namprd11.prod.outlook.com (2603:10b6:406:ab::21)
 by BN6PR11MB2001.namprd11.prod.outlook.com (2603:10b6:404:49::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 03:29:37 +0000
Received: from BN7PR11MB2579.namprd11.prod.outlook.com
 ([fe80::4c79:805b:e69d:948b]) by BN7PR11MB2579.namprd11.prod.outlook.com
 ([fe80::4c79:805b:e69d:948b%6]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 03:29:37 +0000
From: Jun Miao <jun.miao@windriver.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] drm/i915/gt: Fix a lockdep warnning on RT kernel
Date: Wed, 14 Apr 2021 11:29:21 +0800
Message-Id: <20210414032922.12639-1-jun.miao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:203:b0::33) To BN7PR11MB2579.namprd11.prod.outlook.com
 (2603:10b6:406:ab::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp3.wrs.com (60.247.85.82) by
 HK0PR03CA0117.apcprd03.prod.outlook.com (2603:1096:203:b0::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 03:29:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a766f0bb-f8bb-498e-6f9c-08d8fef58798
X-MS-TrafficTypeDiagnostic: BN6PR11MB2001:
X-Microsoft-Antispam-PRVS: <BN6PR11MB20011339143490D68960A3978E4E9@BN6PR11MB2001.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C1c5gndF8gR3gcBftOX2+3WSycckJ60/+q4ADtt02BUdWF6kOUNnkfHsqKXqteIWThcF8KteLICaVtsOLhX6mZM5o9UebazblxECob2Kn2eRG8if9e0vDM0jvrNwObzMgCZD9Jio1s7LuHgPHIS/5ZSgckCd65PCvx8xbr27/Fc8otM8Lusf6VdX9S0EoyUkAWG281vvjia/IYBw7p4VAgzMEBgiYbDYZbthVTTh02D6OtR7JDCSOA7xKsLhCzBaEXwoeTTpDasBBp8huztI/59Sl54DKRDuQ6a9iU80Q52YxCMWa3eL8I3oYVBdTD4M0OZ8ZZoew9xMlTgYanEiUdrE8nPSetgC3FTCdraJO6VjOE6GHEQSjfvEx0uJJjuP0oIE35a0FfEDtlMhjILCjuxakhiJ0AwDbQDoLkdTEc4xwyfOzGrJbt1EzK6c/MINTgdk+YRbzigCPk9gGFwOAIGh6MQUY9Ks3cFXUPZ+Vo15rxFOU0NJzqZyFYQA+CpMruPxKpmQH4Kf3mbFtZYltiI7VrVgsigzpIvxtMYCbrNuU/Iv+WmcW+vLL/NdrPpdev6Y2F+9G+uQnMq6ffK2t2pwEbYPt7C0WzsExTA6f8p06yNg6m9Iv3wRFuqRYmBqVdHVKLm9ELN2GvDMiTip8ENY3+5nfMVip4e2Ry75ZBgNVWN0yiyo16wQiym3KBjC9UjxolBIa6yRjDVqHvEbuA8ucsyYd8jLEyXIg3KOgJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(6512007)(6666004)(36756003)(956004)(52116002)(4744005)(5660300002)(8936002)(6486002)(16526019)(2906002)(316002)(83380400001)(86362001)(2616005)(186003)(66946007)(478600001)(1076003)(44832011)(6506007)(38100700002)(8676002)(66476007)(38350700002)(26005)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BMPmX7QdvqPHBvqvywLJpjK9tIrzEBHEu28jx37MJ7P4D5QiyY2ECLZep8gS?=
 =?us-ascii?Q?tTw2yxqj/VUNma3CDeBfksjVS7SB3YBSYJDfzvUifFNzTclIahEIih7AH/+5?=
 =?us-ascii?Q?2HjmQh9NAHK74iIRCH9d1OeMTdxidNiYzQQeCmo7/6g8IZqtoY/lVcPvC04R?=
 =?us-ascii?Q?TDBdnsNkICjetMaw8GYtD78jpQB99xfA5ulc59VA6fE9jR1fDEW/uwRXdGbM?=
 =?us-ascii?Q?goMPHJnLnd+BRHeY8tcUm+rMYvd5uXImxTS4OR/ygi4zZ3J8V/eCiSW08Egc?=
 =?us-ascii?Q?3KLcLf4Y2/d1ySjEk57U6we7y0Tbb6gf9TX+wEl88I3jcFrsJslBgaUj7GqI?=
 =?us-ascii?Q?jcJZltPKTOuS+ZpOCvDzPHMZs02iA2B9+UL0Ps+5e4VUXyONnkUDq8AmXRF7?=
 =?us-ascii?Q?slPj/Yawh5rtsSNh6kvxDaf+D4+7Wh10vvgB1NWkteBhxOlMLxTyGNLka7BE?=
 =?us-ascii?Q?aRDVGxIraB8p8tbLV3T7HWfWb6Fn5RVmqnENHnwJDqyz3iSbtdKNm7OFZx0s?=
 =?us-ascii?Q?Ror2jop7Q6RROu1RDQ6xh4nn/LMm4FPO7PlnDy3jBW/OUiqEGihOs0lxsVxQ?=
 =?us-ascii?Q?dVq8gVYTo18gXn2S+xqKBkp2QZA2idkW1m4QbeY3xmqdGxW0OD5SPprSqUF/?=
 =?us-ascii?Q?9O/kxFbd/fkPKC/zURM5PdFJEe/p9hnX0vAr2/XP/MuYS54b80htno9ll2MP?=
 =?us-ascii?Q?9bdZ+yrx+mj3o9hWNIBROQamQWgajkhfHB/jfuuRhUjWk27tBt3Iwk83HuvI?=
 =?us-ascii?Q?u3SnQeNd2bvDK277n/q4f1OJmrTAAqR6gWCq5B/ma97LpzGDDTqqxGo1c5iv?=
 =?us-ascii?Q?WTAhw6lvjXKieFcKOVohWmY5JsuAev0Aa5Tp6NFQXhtcHOBSl+Wt/ZZSTVV7?=
 =?us-ascii?Q?EYDZM4dUozwUTWpGYfhHQ3NVfFo7Hdj6Pjikjx9eiSyU2lerZkqOrOLQHev6?=
 =?us-ascii?Q?RJQxoOmFAZovzo6Zl/ErmsU9CAquhTAEDV3C76gGRmiYxl9gOQQzICMoT62m?=
 =?us-ascii?Q?wHxiYYWU2H9ML+LHK8XdIiAOM/fKaT5FYtd0moBQtr4CXUKdCjX5uQ0qT8Iz?=
 =?us-ascii?Q?kT6oEJpN0oVd4D+eT/2aqLOAYZR8YPzY41zJq1cLSo9TSw7aZZ9x0qVel2XV?=
 =?us-ascii?Q?Bp14WblkKAi/Fh1LMJYQu6JtucpW5Wqiq00jubaBGNE0O+PIj3JSVmSlVKmV?=
 =?us-ascii?Q?WtWwEAy8Y6HGsTvpwd7UnM0IIIWHugnpAUMGiPgS49WgOmFqxTaG5ZRAvOd2?=
 =?us-ascii?Q?SFoVPWKFM3E7h0z6y86SeHdsoqyQfh5kUJmwRTjEYLTtAxfXXrhbzQmd/0+y?=
 =?us-ascii?Q?OvqOepKv7GmTRcSnCEZC6Kd2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a766f0bb-f8bb-498e-6f9c-08d8fef58798
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 03:29:37.5098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: endL6fLpjli32hxN3azlDn/pADsLvyxy8lZsMh3pTdY2uA6AA0qRE5RW081jWPCVXf0kZUFaBbsF6DIjlWti+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2001
X-Mailman-Approved-At: Wed, 14 Apr 2021 06:22:01 +0000
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
Cc: intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,all 
	This lockdep warning is only in the RT kernel.
	Which is introduced by this path:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c?h=v5.12-rc7&id=9d5612ca165a58aacc160465532e7998b9aab270
	Fix it. 

Jun Miao (1):
  drm/i915/gt: Fix a lockdep warnning on RT kernel

 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
