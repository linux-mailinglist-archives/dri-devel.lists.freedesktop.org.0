Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D754757C8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 12:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD20C10E221;
	Wed, 15 Dec 2021 11:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6372010E35F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 11:32:19 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFBSnWf028496; 
 Wed, 15 Dec 2021 11:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=f6Zwsfw87+pQ8kiMt59WTaRg+NqheqjaDFCciO5EVsE=;
 b=IYzPI40ol13/Juwu9L8I0xbGiNi0YQ4+R4PN94cGTOqqmtrGv4U5ol2FDQETUx14F5r7
 YxEu51E6sbRTeIFf/6tuRQrJf5/hARkqwpwcAdEOqvXehUZW0BaOXtOZXr1eNhqP8K1W
 umKQ51k0u0gVvARmwF1dHVpd3k6qzvlCIaHi3VSnMc4cNyKfUxyr7TSx63iotk9FiIIk
 HaojoaUMqE1malMIo43PE84dTR22TAjfL/174OYCT/U2+s8YtT6ZHzaWnf6hmaCd9A++
 nbqsADR5SXWAmoDCi3yiOoc8TCJC7Nz0atu9JvhdGdfcCvTT7cSG8vYXrWXLfeKNBFzs kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3ukej0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 11:32:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFBW6cS093620;
 Wed, 15 Dec 2021 11:32:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by aserp3030.oracle.com with ESMTP id 3cvj1f9qvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 11:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6UbOx7nqZgXjAE3QmZuVKml04LO/hOyxpmmCzjxrxFg+kG+FHMfB7c3TCFv7dzbD1JzQAR8Jsyb2qRgBTe9ChA1eQ75mj9xz9PBCTP1newRwyr4C0rB8orwEIrih6TFZAH67i56p/n1QzuwN3s47XHV6Kge1ethn4uD5gJ6YSXd267omDqazpw9YKd8ZiW3Tn9eEaL6knwfk26OIvs9ZIr5BKdf9z44GqgVVbWWfpLoxkvU8GV4wSJwQBxtfqQEkgZgQdu3wSGvwMdlqsPPuBOz20GhRd8aL5EHAE4uwKkBw1ogVozt71GevFu3UiCgMOVuJqxvsI8Jjogp3oGiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6Zwsfw87+pQ8kiMt59WTaRg+NqheqjaDFCciO5EVsE=;
 b=TsP4A/TZBQybDhh5umtN9DuYZODbICvD3yHQz7lSPzLdynAnsCZLmKroHrkjbL9GJzXmMXSm8t1Su+eOxfkUYgHNwEubA6gkZ1aT84fjIO1+HRqPAUg99IaMShgwQxIL2lrQDrWfJ7MdDYfo28US6QuU77UHqhGBqRuRymYgiPYzHCAv3dXbywhpvVEJ3Qm5AZ9FIwYyy5bnCtheoApuMvvlkM5k78VIzL1OkuutepB4SjhypPIy1W/lwmFCk+zhCEN8RiQQDKyRAK+l4kv2ofdePxVEb6pYRIAaz+63oRtAtCQgOgaELGMzt5eJJDEZeit7dHQtaNfX4nHE3fsc8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6Zwsfw87+pQ8kiMt59WTaRg+NqheqjaDFCciO5EVsE=;
 b=cOcUOgkA4+CgtN52EPtBIhmjhKZ1ZsgVil4owszee1zk2+KPT9X2U+b5u/2XdqQ/UAix+qPtTnHqp/gfH4rj2sppMnn/w/2Jbwqp3bYLULOtFnAr1b1h2q4xdW6LBxgJYDCcNQZR9CobQ1DeoAV1ZBQb9WHU5LdovqxOV3/zihM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4484.namprd10.prod.outlook.com
 (2603:10b6:303:90::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 11:32:14 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 11:32:14 +0000
Date: Wed, 15 Dec 2021 14:32:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kevin3.tang@gmail.com
Subject: [bug report] drm/sprd: add Unisoc's drm kms master
Message-ID: <20211215113204.GA14552@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0157.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdc7d024-2ca4-451a-b0a4-08d9bfbe8ae9
X-MS-TrafficTypeDiagnostic: CO1PR10MB4484:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB448439F4CE8B6E40C839D1698E769@CO1PR10MB4484.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGfvwxYAGocWYuJjIpsro8/RAXy+TKIpwTrrR+B8hhXcsvb0kydi0PIjjXREPtPmdzcUyQe5TEbWr4SmltilK7vqrmPJ4nxi3+7gkQHMoXpNVue0l3atKArvI2qxC0T2qTF5CXQqvYvKDNwvgrO6mRIzc86hhWE+wX3u/y/gwfN4v/rNPQJnYYTTQfVJ3YBIc4FnXQ7B7SPqfAEGbtcKIJK2Sjk8RoFwVpKiPLhY08cBnC+uz3M6aKiwrzVPyRzs4EjlWMVWuQQFnJOvPPXWR8x2YMA+II/TVxYHcXbivjOQLPLYyiEYx96biho4TVbmTBw5TTHL91F4M+Mh/Ne8MaWq8S/bhcfXLsEy9S9wfTwh/wMS6fr8spmsV/czX6C038yDAKA1Wd/ctMiezAHYrma1jp04NLOXM4eMOt2/RRtCEQGZCjK8ad291DpJq8P6xri96aZ2kTzkMyx+M/y1u4F/czGlI+E7IkCita4XPWtuYpc3QrTiWhgQ6ZfKWkzMD1uCdZ72RWUr37bN4sZIQIYA53mVE4j+YLoILeg66TGBm7WuOol3+NWS/sOFx/jhanmZtDtLd8B70oAKvZ4QNxePD7kM7JmkAS84/Tf+zElIepNIP9mAlQOZw32jn+RcOH69dz8MV5K+54zhlQGudJV3GMNIgnyUep1aU08oSP/ZxevfT7zoW9Qxe1g/HLK0OGEcyUEalZtT/zFAc/5mPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(186003)(83380400001)(86362001)(33716001)(8936002)(44832011)(4326008)(26005)(6512007)(6666004)(6486002)(5660300002)(6916009)(1076003)(66556008)(6506007)(8676002)(33656002)(66946007)(508600001)(9686003)(4744005)(52116002)(38350700002)(38100700002)(316002)(66476007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pwgqPo4Rpz6mTJDh1+kdAknliSIw4A7P/QLrojqnxi3e8ZTNrLBv8mziPJDP?=
 =?us-ascii?Q?u5iWOyx5iUIq9804j1G5WBSf914HBzW32CZ1tNPyLz1Qaot4Zg1qPAE0VHzR?=
 =?us-ascii?Q?5MSnqxl1/dGavpOkF0URninzicDLCteE9nUx4g33Z4+7AtF6BVN3L3rk7+I5?=
 =?us-ascii?Q?NKQPZHxadlvHmp/mFBm1e1VrjIyPTO2pggL+gca+/sFWDBKzKWl1+NVJbfni?=
 =?us-ascii?Q?jkrfEThYJLzKknp1Q427qYl8CFAy7qiklaXZppJa+PNLNKxieJGWgiseF1Ih?=
 =?us-ascii?Q?xU+rfTJLG7EAkkYcvkPVn+MvlqDdoS52eJpaY2+UC8gLT6RQYhOK4IYEkK3x?=
 =?us-ascii?Q?leM+1zDy+hwX7ocny4OnmqYqYnohMqV98CNEkuPA/8WG74hyKf+q2biC96qA?=
 =?us-ascii?Q?Fw4Jk2deAEqf90C03F/WRE7zrhrGDarZk8rnLzvGGcr3CYqEH2yM67LnGllk?=
 =?us-ascii?Q?FH4p8/jmoPju4yv70INZZBdyi46wx40VlQ2RSFflUKLVXxRCko11GIya0uVz?=
 =?us-ascii?Q?mDQMYaq3vmdG5igDveY7jp0OABk/DB0laQ6YrxfJeGvlnlJig9lR5df7ivCS?=
 =?us-ascii?Q?6nGDopSuneCHbfXzemHieu5p9e9TE1psXqegSyIYea4lBvprT2c+XJraM915?=
 =?us-ascii?Q?o9a/5AAPEAByVxuwx1xtrvWFvJNM81Qp6cMBfNXesqxqIhY2K8+psi3P/qoh?=
 =?us-ascii?Q?JTeIWmNtAZe5wT43XamZYE43no7y+e9zQjwkvNtGl6kocYUK2TOOnYKDTRwL?=
 =?us-ascii?Q?F0z4WcJ+QpFXv1OIz4jXPmvefOqXlTS880hiCC3AJWwWsg2GOQBv16W8eLXw?=
 =?us-ascii?Q?fvRmsWhJOZhzejwRL/1C0TI/DO8FhLi6YByhIpQUcohzFMzquSM7fnqkz2jK?=
 =?us-ascii?Q?mECqO0p9Fgxe8DI1TfzwBw2CH45SPZh5wCDFQGmM1OHeI+N6RwPKk+oPV99h?=
 =?us-ascii?Q?bn+hO5/5wSgIX2o5JwCH3j6CV6w1m6yBg62cLmw3/m9A+QcW4N7TOqKEr1sz?=
 =?us-ascii?Q?Fw+93NzE4eHu5Cax+0/cARTWhc09GDMlfGu+6C16SZ9bfRhjWYp8SlIFHDmM?=
 =?us-ascii?Q?bAeQp3KPceT8UpZ9F8ttBfaynw6O87aR44vYq3177tpVYHBpeq0QjX0hQbq8?=
 =?us-ascii?Q?7Zr+846efVqs20YVEQyqWzdq/bUL3tjrj+/WrTg2nkOO8vupM7BTAS7iCqiV?=
 =?us-ascii?Q?iwysWUcERRoBHMHYdn4kAWcuUY78D4Hhf47k0JkRvB9x44cY+Gv2wQ8fKm2S?=
 =?us-ascii?Q?n2wp9A7JtZjriHMLzf15wS8B77/XnyKntJ7+Lo4E1/QchYgsRTZ5m2U5r4ms?=
 =?us-ascii?Q?5fhLb1j2nDk+SPOzZCxg2Q2DNAoiPKbULXeBtVh+3VF256E7PrWnemBmuTsd?=
 =?us-ascii?Q?0IwTRNuGvZxzvw+4/e1Y6eylV91sr1CHL+T5YM13IGuheNugax5vS7PeOG92?=
 =?us-ascii?Q?aZMwtvIr7UFXvtXn2nKjkvXg8SfUa2tMX2JNY65kZF3Z9bCje2hJKXaaHV2W?=
 =?us-ascii?Q?iufIP9HDR7SCJGvPnNfa/LmKJn0KpNwrgI7zpmoDMsw8waOVXPpV2uB8IwkP?=
 =?us-ascii?Q?OBFWKea3UJL7G14lZV/Rxm8+yamDjtYV7oPROppo+3ybeewUdEWCwufn56nq?=
 =?us-ascii?Q?F5oOhvNYvmUy9aWQpH6SKryyWqTpUWqk3F5KfEa9wj4hluXnuuIu3wUsXA14?=
 =?us-ascii?Q?reREAQ40f1Y2yRhg9VMcsROrXhk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc7d024-2ca4-451a-b0a4-08d9bfbe8ae9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 11:32:14.5857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/kz6JRo+YT/q8XZc6qNSQono5a5i9fQ4xmkBhBLoUEoaAN890FCiLRiUu/Oc2PsVBM1eNn553oyiMWnVuLVAMgXDlLQ1jtQOJjYtsjI8qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4484
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=743
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150064
X-Proofpoint-GUID: OrGhxTJZkSyS9tdnUvF3refGfQcyXGZE
X-Proofpoint-ORIG-GUID: OrGhxTJZkSyS9tdnUvF3refGfQcyXGZE
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Kevin Tang,

This is a semi-automatic email about new static checker warnings.

The patch 43531edd53f0: "drm/sprd: add Unisoc's drm kms master" from
Dec 7, 2021, leads to the following Smatch complaint:

    drivers/gpu/drm/sprd/sprd_drm.c:158 sprd_drm_shutdown()
    error: we previously assumed 'drm' could be null (see line 157)

drivers/gpu/drm/sprd/sprd_drm.c
   153        static void sprd_drm_shutdown(struct platform_device *pdev)
   154        {
   155                struct drm_device *drm = platform_get_drvdata(pdev);
   156
   157                if (!drm) {
                          ^^^^
"drm" is NULL

   158                        drm_warn(drm, "drm device is not available, no shutdown\n");
                                       ^^^
This dereferences it.  drm is set in bind().

   159                        return;
   160                }
   161
   162                drm_atomic_helper_shutdown(drm);
   163        }

regards,
dan carpenter
