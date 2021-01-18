Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF822FAC10
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646226E5A1;
	Mon, 18 Jan 2021 21:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7616E5A1;
 Mon, 18 Jan 2021 21:02:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqvImLXT8iwWBhE3kFUPW0KPyBCVGbsa7fPKBvFykJfOINO0lojKfn+ICtA9YG4r9UqMmnBYN49fQtasGb8+VdBqJxf9oOYh6RDfkT9RdVU56RQLtaC8ZSCJQNWuaG/EMMA88OVxyxwgj0AD21HOtQSbohRNDyQ6vdzDHMfvTXkRBMlJbxWQKnza/Qil8gzC3oVA4FGcUmF0z176zFyizLWdjT5PGjHkcThT6mbL3gFQI2lmku3T0ymEopyFlQLDtxEvnPvmC8WEctH4Rkkjtf+XKofoncZKcZn6PxhKa1uerspQSusnJ+sk+NebpFSgG53bRTIqe4riCBcE4H5uag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eP+CWFFP1/158PxaoXh8nWaz8kcCjPtiaThEI9ZA/Vc=;
 b=KX/ygTOCPv4Tad0eYqzSMzSlKn5tDfYDKVvT7RXaelKPy3egDKf9k8KQFg8o/7ZRIpqszyx8cmR6Wh5Wr9fDDaDu+ZwM64xdTvgQTMjoNGKFFlgzBym7YCYKuxyK++0fHL/dRgC0qYcNcWk6v2MXylhCTWIxpU0aNbgbjtkuViXi8h/m7m8CYrd1x+jrpFwEvIbK98yOyyWvqiz0xC/z3iuxMbI37djxt8ntiBX3BTM7iCQ5F2X5XKQSOmmKlJ27MwMULkbO10VzNBIUgBnEpVzIU7MlGQxoOWPoPrPEL6yn/xvkbU//26iEetHV+DADB6szu959ycbHjyuiuF4fCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eP+CWFFP1/158PxaoXh8nWaz8kcCjPtiaThEI9ZA/Vc=;
 b=2B/qZp2wAnzl2FjCN2TesIuaf0u0C4rn5AowQbnSsqvT8CYCLjVB5zpYbSxoGbfJhO0h9uzwxTJ68OjggQ4Qpr9ggKqRYKEr+uaU5RHc++9oHBcTYvp5Kc3MhRaGwLaKCIuoStbBaOF0teGp6Ps1w2Gv65oDC8hm2FtXhFEXM2c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:23 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:23 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 02/14] drm: Unamp the entire device address space on device
 unplug
Date: Mon, 18 Jan 2021 16:01:11 -0500
Message-Id: <1611003683-3534-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5bfaa15e-8cef-47bd-ac83-08d8bbf45a42
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB47674953DB7D04E59096F75FEAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hXTeKLN9X5KcSvCdgiNOFlRAB+onmHJtLBHvth3ThC7htiaf2EjCmx2SEkf7FlllqYb1jW6yGbY1nRwrwu3TNpt0feU5+26/lGfYYiiDky5Lny7jXqQzr09TaAOd8FN67gOyn9FvG9UIl/wef+8pI5yr+A3cBCBxITSvJ6izHZhoHGzw2qwHz+KZARHwpLhCwi2bKH54gca9l85kXZ6DnvD21CO+A46tlEYpIvwdBj+tJJ0U8hpRxxREA64InaC16PPBiaweSiF0zp1d17IEqYedGIgdS1qdXyX/pew5zIGsFhZgnHqXNBzrQZ/DbEZHuQhwkyN5pmx240vyQ8MetuOVwnwXhwEwPkJ+p0Oty+N1o+NkPvJ5VIfHWB7hN/v85kOx0BCnw2yzFIb/r9Am/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(4744005)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGxFSVRVUWJmYk1RUkxpb1VhNmxpc3dLWG1GaXM3YlpqT3gyNWpNZkNmTEZr?=
 =?utf-8?B?THd0VTZ1UHpEUFZXY0J4WUJHMUdQU2MvTnR2d3hOQmRkR0tTNHFCN05DNTZ1?=
 =?utf-8?B?cS8yNFZ2VTBkZnhmYjZTM2VxNCtyTTR5TlRBK3RjRktsdERzbnJ0UFBTVDdT?=
 =?utf-8?B?ME5VenM3Mi9WYWRxLzZhSkJVOWUzMURwNllOK0syenhaV1lXK3NtaTBpNm1l?=
 =?utf-8?B?UEg3Z0w1dS9HdXVQZTlkSXNpUDhLbW5rVlk0THhBRmtla1c0ZGF1c2NMQnNS?=
 =?utf-8?B?RU5pM1Rsam1rUU9WNG9EbzhydlYzMnNjWkQxWk12Nm4zYVdnRWVxcGdLYm05?=
 =?utf-8?B?c09NbHZ1eGdnM2xleTczMUVOZ2Fodm14a1ZFRU1rczlxWkZNM2FTZkdlYXJK?=
 =?utf-8?B?b3d5TlNLQ3VjZG1xNE5QVGw0clZwRHdKbmtyazlQNkVVQlExdlFhTDRsc1JP?=
 =?utf-8?B?a0FwUzk2U0hvMUo4eEd0NEtETno4em1Mb1lDN2NURG8yTnZzOTZ4R2V6dmlD?=
 =?utf-8?B?WjFPOWJZbjFNdUdYcHk1a2FqQlZETmJPMG40UWR6UGtoc0N5eXBuM2o1eUxq?=
 =?utf-8?B?dGVvaDZMck5OU3BqdTU0Z2Zaa1pHWCtCNTlpOXhITzFnTXdoaEhBSVMxUUNM?=
 =?utf-8?B?UkZ0bXJRNTdPNlhmWGk1RER3Qmd6V2Y1Ynh2TytBd0tmek5URWY4NmplZXVs?=
 =?utf-8?B?bUtXS29WWkxSdkxzV2w3UFZBbWZFcEFaVElDZDI2YmxwdVduYm5pYjY5ZU1B?=
 =?utf-8?B?WWxRY05vc3hmT1dQY1d1ck5XL1NBYi9WS0IzU0lheXpBcTVmVXo0SFFlbTdS?=
 =?utf-8?B?V242NGdCVE52V3JNZ2ZGMzdXZ1FYVDhLcWpmSlI1NlRVR1VyL0oydUYvMDFq?=
 =?utf-8?B?TFkzejZFRVJzYnloVkx4NTAyNWtmUkthR0ZZQzhWSTZaYzVLQVkzZkxJYXY2?=
 =?utf-8?B?eGxHeTcxN3lRY280UnFxR2hDRkw3S1ZHMFo4VmxVQWMrWWhQN2d1YTZiemZ1?=
 =?utf-8?B?bHROb29vdkk3cFlDQzhrcFlDVEtacTFyRGdQM09JVUNtZkR3TmQ5ZzNOV2k0?=
 =?utf-8?B?OWdJbWpRSGJtYjdnZFRrZnZjQVVKVWtKdFJ4akR2WE0vaEZiMGx1Mml6clJG?=
 =?utf-8?B?Yzhzc0s1RVZoM01TemF1VWQwTnhMMXpJNzNxeUd1eVlobm05SGlyRkw5Wk9m?=
 =?utf-8?B?UVh6aTQ3bzRWTDIxRmt1MFBiUDY3R3RCWXduaE9WdlI4ZEZ4Nk5JVG1rNzRx?=
 =?utf-8?B?NCtBRTNBVUpiOHhFalF0M0VCbkk3WFNZeWRaTkdDaE1Jb2tsUFpWOFYwZm5h?=
 =?utf-8?B?MDVhZzFsRmNKclBGMjdsVjdvQ3YraGJYcXpnTDBkdXFpaENKWHNEcGNMZ1NN?=
 =?utf-8?B?TkMzbGQweWR0UThhMUM2VnJ4QWxHa3pKMWtLMnA4YWhhUEJFVGk0Vm1tdk1Z?=
 =?utf-8?B?bjdsTDRQb2swdGNxWmd3di9VWVhGb29IUFJXZ05XM25RcWxKTitPZC85QStp?=
 =?utf-8?B?ZC9EMUFqemNSTmtIVFZhNXMrV242aFR6WFI2d29mMW5HSjFRYTAvbkwxcTZU?=
 =?utf-8?B?Znd2dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfaa15e-8cef-47bd-ac83-08d8bbf45a42
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:23.5007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i01vlg1oywQwip2gGt6ME7CvwOG8u9VvMHPLq21aXL7iuukFTnnukScf9nE5Qf9/EghHEMz9w5bztwKfBiHUbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW52YWxpZGF0ZSBhbGwgQk9zIENQVSBtYXBwaW5ncyBvbmNlIGRldmljZSBpcyByZW1vdmVkLgoK
djM6IE1vdmUgdGhlIGNvZGUgZnJvbSBUVE0gaW50byBkcm1fZGV2X3VucGx1ZwoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+ClJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9kcnYuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHJ2LmMKaW5kZXggZDM4NGE1Yi4uMjBkMjJlNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCkBAIC00NjksNiAr
NDY5LDkgQEAgdm9pZCBkcm1fZGV2X3VucGx1ZyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCXN5
bmNocm9uaXplX3NyY3UoJmRybV91bnBsdWdfc3JjdSk7CiAKIAlkcm1fZGV2X3VucmVnaXN0ZXIo
ZGV2KTsKKworCS8qIENsZWFyIGFsbCBDUFUgbWFwcGluZ3MgcG9pbnRpbmcgdG8gdGhpcyBkZXZp
Y2UgKi8KKwl1bm1hcF9tYXBwaW5nX3JhbmdlKGRldi0+YW5vbl9pbm9kZS0+aV9tYXBwaW5nLCAw
LCAwLCAxKTsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2Rldl91bnBsdWcpOwogCi0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
