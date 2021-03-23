Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2412434601B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5574E6E88A;
	Tue, 23 Mar 2021 13:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECF76E0B8;
 Tue, 23 Mar 2021 13:43:32 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12NDeXgr084645;
 Tue, 23 Mar 2021 13:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=Bf5RdYJr7ILtQEb2JvXJyMU2ULTK6cKWU2GGqdLAlKU=;
 b=sSdXudRVbkGvL+MnpZY7a5P5P1OIjNg7vKq4sS5t7Qhz11ZbFOgtaavjeW3Welj98Iu+
 j4eNxXtT5AM34INhZ/dD2OxqkuHojLh4Z2qOqVNSVXCkL0PVoD87mMAuICHtczcS/gC9
 cj39xI2331KaNhlh8AyjKMONuzhBgH2XqGPT8X2Q41iKTDUod4aVkdclkFa/BEjjCcNf
 di4FVP2McTS5psw70UmIvBxUPksQ+C0Zd0b1wdUHjTwdu5vNnYhQ4e9m7Xl73+AXJa6q
 syyLRItvvwigRsjc7WiKbW5+Tc8r9r8Q9rUHKlVJm1/+PegLLqN0m+G+a917DsSSA+gg CQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 37d9pmxyya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 13:42:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12NDeBc2125502;
 Tue, 23 Mar 2021 13:42:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3020.oracle.com with ESMTP id 37dttrxt1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 13:42:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq5LPg8movfRzttQ+J5BkY/Y1kzXEGrMJfVQdObQKpLBM8z/eerL1NNHAH4P7Wtf5z959wH5atJgLoMIjMPPAWvlxGqHpJpf2iDgUuVGOh3Fjb14GHWU9UspMP5Ttj2ijM1dz1Ko/9nzfhjjY0Qz+IrMt3VmOWDv0f4HCJuWnIEEcs8jp4VHvwr0kIOjYbC8s2bIZIkKPmb1BQM3ZX6LPrcNt9AjA5oeG6rVHJjVENlJdm50Io4smOH/jn4EH99Yw1DlXiNtzxgDhMi2J74XMQVNThcUzr2ZuuyUeVK6HM4eHorLVBw8SMzdPY2ICFVSMWJjK26SvgA8PKK2my7zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bf5RdYJr7ILtQEb2JvXJyMU2ULTK6cKWU2GGqdLAlKU=;
 b=cKlymwCaNBzzD/gbsUU/1s3n+lU5eYM4+vOBbSZ6ZngKN1G/2eZFY2/J9jxssZhc5Ffo/U2m/KoDlMugfWmrzVW7pNv4bA729FQtjTz+yIvtT86xF9W1eJ7cvC3oAQaHPehitLp4WstUTgHYOrt2rDfo8dD5It2cYcY5GGPpvODDkxNBJwZJPSckg7+C8z/8FEHoH4OGAiDB+kNTB7caUGXKvTmLJEcFEqMQQjqlhAqUrYPtRF6J0pO8tR3BGnnoFByTiMR9k6b+gH0K1K2OXbjM5WYBLIjvIOnTkruJp8SJtvkdtMa54ZZc5d9qV0s84W316YUDJ11ocHNmWddTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bf5RdYJr7ILtQEb2JvXJyMU2ULTK6cKWU2GGqdLAlKU=;
 b=0Q82YvGaWLXHuh+Rfwy3frW3bV6lllqHcp+tIbtnM/8/kckDDRseiMDsOE+YQu7yk1EddAaHlRdUOOY3PglAqN1pxqenwftfghRmaQKmT8r9UO2h6Hj/T3EJrJwABTTzIcN1tm42uRjAQiHzfpc6xqB8QCCyfxDlriShuCFc36Y=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by CO6PR10MB5395.namprd10.prod.outlook.com (2603:10b6:5:35c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 13:42:21 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::1ce7:260b:b004:c82c]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::1ce7:260b:b004:c82c%11]) with mapi id 15.20.3955.027; Tue, 23 Mar
 2021 13:42:21 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH] i915_vma: Rename vma_lookup to i915_vma_lookup
Thread-Topic: [PATCH] i915_vma: Rename vma_lookup to i915_vma_lookup
Thread-Index: AQHXH+pZpr0zHYAZfU6V/XP+m9CozA==
Date: Tue, 23 Mar 2021 13:42:21 +0000
Message-ID: <20210323134208.3077275-1-Liam.Howlett@Oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.30.0
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7b25814-052c-45b8-88f4-08d8ee017c15
x-ms-traffictypediagnostic: CO6PR10MB5395:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR10MB53950D74B1B99EF59D209EABFD649@CO6PR10MB5395.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8vfATNN3y5ivEtwfXz6nP79JPf9/T+COtY4+5Z1FEve8+8jiH3SUtOa0LcplyePzcO7ShL/YsrQIhIWrfkylNxjR9ZK2qxtn8DG6vUEC8FQslpfACiyo+ciq+f0qDeLsNkf62DS1Hc2PWe41TUrI6rjLFbBO9F9TRgkv1Ac9+hQbj47Xu58ESHdmeJJpv7ZYCQ7IqU8KfQBSYcB+zu37QFOq8qZP0u13G6KdC0v67QbyTkU/6LeMW9NJtlnOhMFCcsE2gZ9rVexd5GHmP6OJfDS4pt0KdZseyFiWVQTIrfsUzSV2pSV3wjwZt1+TM2beE5rAAlk1SaNYTIZF1o6FHwNJ0MiJCKhOCGUIIw20Exi1rn4VXiD9sZkct3C19PvKFKgeEorDSGmSPnffFnGintL/G5fldEBPzMDKioDWa3DY8xpw4obzAMaM7JXfCeuQwzhmWfvmBiTSU3IlUzj5m8T/8OB581Mq7/Yuwozo5H3EtW0yfGXVD6lsxzjY4Rwn5T9CLk801zzd2+FeCroS1qk7CFn2RRzqdblo1a9CIWkH2qgydlByHcchIAiaEMtzehJYl5LrAF1B2Hs3ajI91NaI8XYnGcWHm1kcH+H9o0L9NNeHVQ4iPgI+d5sWjRqbZ5CS1N2PCAdqxTAc9UKxAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(346002)(376002)(366004)(396003)(66946007)(2906002)(107886003)(76116006)(478600001)(44832011)(26005)(1076003)(5660300002)(316002)(66476007)(4744005)(66446008)(66556008)(4326008)(8676002)(91956017)(7416002)(6506007)(38100700001)(71200400001)(64756008)(6512007)(54906003)(83380400001)(8936002)(110136005)(186003)(6486002)(36756003)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?AlNip3mAl8u8ewNfw+QgTmP6v/Cqh2R2TBbyvm6wY2SPqTGXYGT+KF0apK?=
 =?iso-8859-1?Q?ghb7poGTCvCiFs3f6EFXe/TuktUv722YecoRAdbN9Hwy1g6E3XuktO5/TO?=
 =?iso-8859-1?Q?mUChFw/GLRraiqV7SMfW15o8++RgsxUa7MxJQT76hyyMbapzumC4yet25C?=
 =?iso-8859-1?Q?QIJ7yqDxGGDaFt9bvS69kFrMal+KOm5eSSRjgQFyd9lg7TNOPvNUveGATm?=
 =?iso-8859-1?Q?ffc4clHUvpkErOX9QFeSLPi7nNUERQMI+4dDNnyzmmFewV5xAofVf/rBEk?=
 =?iso-8859-1?Q?jqlIjbRcJ2v2r42mbe8r9eRoUtewGPEbPv4kP0YFRZPkwPMXkEYBeeoxM+?=
 =?iso-8859-1?Q?fyANqCL4Sj0cFPoGNyACDemmbQoxsh+L1PLcus5+LM3DZJxh8RNO3Btm3M?=
 =?iso-8859-1?Q?MqFvcGjSZT8WFzXy972+Dl7M8+OLWigkYRQy4pVWSKFs4iRleQ0qtBv4Mn?=
 =?iso-8859-1?Q?haMEasOPYLFhB6h2/oqhIn1+z7HwfW8/2avhA4TEmATwV96uUIClarFH+Q?=
 =?iso-8859-1?Q?mMgtCVsgWAnk81/2PHnFtej84qFt8yl5xGPbFTMt/01X3tzY0BCYmDyqJ8?=
 =?iso-8859-1?Q?+Z/iHyPUQsV1lPdMzoHG4GVIzqylRWKGzdbk+DbcJV9f7G+4566+HCEAbD?=
 =?iso-8859-1?Q?LlGi8FnRS9soWtl0iLPVUTykk98alvowJeJj+ngHpLvJWbnrbNotPscv9A?=
 =?iso-8859-1?Q?v/r06WwYcVOwoVfMTfjzXv8DJESblH6pQddGV1Rd3sLdGc5a71B37oSqJ9?=
 =?iso-8859-1?Q?x+CtQazaJ0kuOiV3dLFr10vwf0weeGu1921i+vAev3i2y9PoGgu4tCWdnJ?=
 =?iso-8859-1?Q?yh2j8aXv/n5uKoJE/iIYG/CRCSW3LZTughePcYHW4jBuIaGtshGaoUHnzz?=
 =?iso-8859-1?Q?ag5dpP9Q1/iVDPs2chArcHZJHFWpJvtyv3aGXXeHsFlKTxFdXE+as5P3cw?=
 =?iso-8859-1?Q?UOubxn3Sx0TR3TIju7Y3BncWXU2wkMHeUtkX55YAKDD+i6iyujxdfFZBdV?=
 =?iso-8859-1?Q?UloW+gor2K30+P/dTFzc1Nv9oY5rMKGyTFPOAmqvYAgVQ/GTG6kCUkP963?=
 =?iso-8859-1?Q?jUsPI+aBGNERV3en9If5zns1ikEgZvdNBIK0hdQ5WmH0+RgoQeWA7VuxPm?=
 =?iso-8859-1?Q?kdCPXE/3GN0/+A6lhWXCll4pxk0S2SIvy4feDVxod8peOQsNhnMKjtJ2LE?=
 =?iso-8859-1?Q?yj7a3ADI2rbCRtuL2F6scSaowLFieZ6UC6GZYi/SvBQtQX9qIoN05dLQu6?=
 =?iso-8859-1?Q?/B67Bc62x5ohvlKSRsL+uHv+RK9Q2F+nWOv7mfeTZ6PIZDSL2wq/33BmRr?=
 =?iso-8859-1?Q?GWiV30+CqIZHX3wvL5GNUVNyOC0KwbZ1bdlWKRczeqF7GfFPpgpWB1xUcJ?=
 =?iso-8859-1?Q?wJpvOMnK9f?=
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b25814-052c-45b8-88f4-08d8ee017c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 13:42:21.5739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6XlCVXmxfMRnKQ1M6BewX8jgeSh9qeBeE6dTUcaot2yBPTvejGzsHgsx5HlEfPf0CFbdcbNKz9wZ91ihtD+OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5395
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230101
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 clxscore=1011 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230101
X-Mailman-Approved-At: Tue, 23 Mar 2021 13:49:40 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Liam Howlett <liam.howlett@oracle.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use i915 prefix to avoid name collision with future vma_lookup() in mm.

Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/gpu/drm/i915/i915_vma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index caa9b041616b..ee0028c697f6 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -230,7 +230,7 @@ vma_create(struct drm_i915_gem_object *obj,
 }
 
 static struct i915_vma *
-vma_lookup(struct drm_i915_gem_object *obj,
+i915_vma_lookup(struct drm_i915_gem_object *obj,
 	   struct i915_address_space *vm,
 	   const struct i915_ggtt_view *view)
 {
@@ -278,7 +278,7 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
 	GEM_BUG_ON(!atomic_read(&vm->open));
 
 	spin_lock(&obj->vma.lock);
-	vma = vma_lookup(obj, vm, view);
+	vma = i915_vma_lookup(obj, vm, view);
 	spin_unlock(&obj->vma.lock);
 
 	/* vma_create() will resolve the race if another creates the vma */
-- 
2.30.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
