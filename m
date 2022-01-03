Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01759483802
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 21:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B1F89FD4;
	Mon,  3 Jan 2022 20:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166C889FD1;
 Mon,  3 Jan 2022 20:25:03 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203K1u72018374; 
 Mon, 3 Jan 2022 20:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=1qwUMZSCV7arMN66REY5JrEr737abr0bQ3YBnvQtqqc=;
 b=D93XVHgDO56SGkdHxQVrALDx+wtV5FqsUodOxZlVF4eZeN7Pc1seggIVFgzEceZNxgii
 3Mr2r89tfDYauOlbwFsK6RLjqdPVPxS+QxglV06ap/+Fee/ysf7y9RPq6CDtTeuZoeCC
 8p0NVBv6u+X2BrbH88lDG01SG9RWzCe1jbzIYe+dIlDhknIP65eVdUtYMB2VkH17f57+
 6OQSVQFzRbYcFMq/Abu+hktTjD/geBOKvSpvgB5PSwv5pgzu+7Lb8XJ15cy2qd3N3TYt
 OrqoeBYoZGFLO+Z2OrTQg6vjLjmG3VSRo8vfdkIjqgQK3Eb56vdI5jUcMRnaOp+xlmwG XQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dc40fgm8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Jan 2022 20:24:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 203KBfDh044917;
 Mon, 3 Jan 2022 20:24:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by userp3030.oracle.com with ESMTP id 3dac2vb4vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Jan 2022 20:24:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvKfQM/38O/q1ic8mLxaiYz2Oqdr9VbDSqyZhp4F+XSIc7DWSTU6rBYkwiOwabyFp9pV0RTIcI1qnM4QGwpD43CVrOXF4kv6NNQFBA9P9GqPkNgwxIG59Oza5puZmtYCCCgwmcWuiPe5F8mx4UbI6fX+LXsBeb0NEimdCCQPJDSH/1EayLqOO8HGgESFvdTAJceEfPF1XJTcqosHnL/SaOqKaGfIDIMptRXEd0hhby/sWnE63AKzUPzXpGhn7fGHfEdxLADnvBd9N2ELqrvtxrRL/TAinTkmGVdOFkBWF8dj54OEybMkYz2pJmX94QEU7Q0mrvH2FdlxUMiY1T9Pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qwUMZSCV7arMN66REY5JrEr737abr0bQ3YBnvQtqqc=;
 b=WWw9UyKyzkd4A7FP1VpIDQD83abIa1PwFlQ6bEWsT7b0DkBfE6L7Y/aw7h9YOgLGsh+MdMe+TsiMO0pUnTdXMZPjsHiBYMxOlOJS0t2hwT4gpE2sHCahui8+ACcfJuh+G/kHdbO+7WbFzGO6Dl/iGXV9rlq75M/swdnIMAULzQiWVrDIaAQ0SYtVlL8hzOMoYsSkvSAX6pslES3/NITBZQpDkgt+OQRx7EgWj9phUye6WeSFC5WFQAFtVhu2cTxQZ1wFRk4QRCcOmDbujpTx6MlMPux7bPefQb+NuCRtWc0VinSVgITgcG/7xryK7Mx9Um8gHEwrDV8qA/KwuuNgDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qwUMZSCV7arMN66REY5JrEr737abr0bQ3YBnvQtqqc=;
 b=eRp3H/EIn2TP0JQt5VI6K4gTVcd8FqGR91FDSruR7V2XR75lzKxWEkUlAwjZhfIIIlvY0ozzujTGm1Hpi3Gl5gb0XOuU6bbvJ69MwRPSBPEphcN9M1453DDLAWwFa0oua9zM1SUIejJ/4LKEMel1dxg5Sa3j+WwY/t6q2LuWtIw=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by SA1PR10MB5712.namprd10.prod.outlook.com (2603:10b6:806:23f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Mon, 3 Jan
 2022 20:24:52 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::3857:3a25:3444:fdd3]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::3857:3a25:3444:fdd3%5]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 20:24:51 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v2 08/11] lib: add support for device coherent type in
 test_hmm
Thread-Topic: [PATCH v2 08/11] lib: add support for device coherent type in
 test_hmm
Thread-Index: AQHX6tOBhiPZ9xaAiUGRkHyMOk7SIqxR6juA
Date: Mon, 3 Jan 2022 20:24:51 +0000
Message-ID: <20220103202443.bgtkqgimta63lqay@revolver>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <20211206185251.20646-9-alex.sierra@amd.com>
In-Reply-To: <20211206185251.20646-9-alex.sierra@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c59d2395-1117-4107-887d-08d9cef718ea
x-ms-traffictypediagnostic: SA1PR10MB5712:EE_
x-microsoft-antispam-prvs: <SA1PR10MB57123503DCEB17B14C07BF24FD499@SA1PR10MB5712.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vsFRMGWkIeLoyfDy/CsO8wLJ1gYdY+3eONrJy9JYsXVKELFx/41Ke1WGFznnEURk4pIqSN7BsyqSz15Ay0nF+qGyjsFSrfylmhgweb0LqBbhYtACRNLpOifP1eg/nM4ClGcCALxVvnc2cAddipqZh6CJMg9h12U/K9ifMJOaQISgqeNa8TUPTChFXtUzEn21cYSQusj0xvZA+bKh9N5XGF2didOy1DdGjOF8DY/wmX2ks0uOYsYiM1g8u/IX7LTzl6PQ5jJrak0zNI/FHeXv8x4cylwqk0OabPcFR2NfRL96xgSpsw8PWXAlwaOF2g32MLnIvbaAUXCjdUUXE5n0VMaqLnbvgwp3OySmLN70vfnn2C/REwk0M+pBtlo09q1lsdm05AsD99AwyeN5W4ryOALCtWDLiaUXYsh/6RzM8nfNvd5Y7p0itfdjETWsEntA9oiKRcwCu6FdGgq5s2n+jmMSU+Bq9RnbB+bUShkb7xPLzQzygWEiXDfOiw4E0ZDwDfyOtDnMCNOC0EsBHZRNx4GnrMzb3a9o2hsl4r1JWUlNlotjcjtpq1X6oFbp9v7Z2rgkUUlEDgqkC+G/QhF/UL7N0976Ad8V4kvE9QySCwpRr1nqNDbaDSFrbN1CFRbSEzeep58UovWDRG7PNJmElKhIn18cgUSBDj4dpD9WS/90VdAjtsEi9g+WdjiLR931ZlPKiAuvn2Ef+ShW0zmkyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(30864003)(76116006)(6916009)(66946007)(38070700005)(44832011)(66556008)(186003)(38100700002)(508600001)(33716001)(54906003)(6486002)(122000001)(8936002)(2906002)(86362001)(4326008)(91956017)(1076003)(66446008)(83380400001)(6506007)(8676002)(316002)(64756008)(66476007)(9686003)(6512007)(7416002)(26005)(5660300002)(71200400001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sYiUh/yUDVbWq3T2je8hokHEQ4HKs7bwzj7/kPyB/vOm4XRUp8rvYtzOBIq5?=
 =?us-ascii?Q?9SNfFo75SfNOyyytu5duxpPdgAl5dnab7IKr6QVhsmrNdY9EQH2GldpugMx4?=
 =?us-ascii?Q?w+z6QRFbM4AY/flusjeXPaTmHQCTgJ9KNGdAk4mvzvWgQ5XYMiiRs/xphtwu?=
 =?us-ascii?Q?HFJeDIYwQGKBZ49w7czzVjz2mUqms83WV+RqW5mcszX4hQ3TPpMosrjqicnh?=
 =?us-ascii?Q?NsOaZSQa9k2JV5wikzSqSHxGmVcimB9/Wd+CGph+UeOgdeFebqSOSzr/f7vd?=
 =?us-ascii?Q?0kJ8nLI0ra5mDq9mLQFGLkTybwElma5Vvvy1M5aJ/laUcX/wu2+UoU+nK5iA?=
 =?us-ascii?Q?N3E0VBSDYgczQEgRg3060KSor5kL/5SqT5qTs0WH1eUiN0+TBUwvgiCyREls?=
 =?us-ascii?Q?Op5zov2+mgxJ0ibwJb9U4HB0oKMcezTYBc3WLBkSPk/aRmfwR1UymlLztexp?=
 =?us-ascii?Q?siVkUW9RqlezBwThEIsRnCnKpM6H6W4Uv3Dwi39arbzDFV4LlL5AlBvatvg7?=
 =?us-ascii?Q?CPWLIS9WuDehSLRg1tbYOeV2JpFjcOW5QKcX+iMzoKRjkcBK8yoMkS7HRYib?=
 =?us-ascii?Q?lw+71dJ5Z0zzVL4+gU+aJATa2lTr4HTDhD40v4z8MgM43Vs1ks9JZvagVOkX?=
 =?us-ascii?Q?S8Uxqy107GoDiSeq0uohEOUOAKWnfWnJdPhsyy4DnaN0ZUvWiO75+/m8h60u?=
 =?us-ascii?Q?EeqsMspyzqh9eEfg1mdzDcFddGYvJvPrbZeFuJM6tD9jm0rsKYI8vzgT07rw?=
 =?us-ascii?Q?Tv4SgtEKiuQIJtfqMuvwHJv+HOc1H8cYYO8Wb/MdMKO5MbEwQsIDqpAUAboG?=
 =?us-ascii?Q?2FqjUhrTEL2HxMC02KGiuQwBDTx54Vz85tZSFWf81LULCQpiQqgyu8/aU/+g?=
 =?us-ascii?Q?ja8rYIvRL/FVtf7iojBat0DO7CxzeDTnqFz+ndq+tbMS6jtqYLfNHrKhNlPc?=
 =?us-ascii?Q?agJfrJq7TCd40c/+SHfRcqTTGIj1uRa7beNgQJV9AKneAJTETX4wUUSkl7j9?=
 =?us-ascii?Q?dP5VmL4bj3y+llq+fjJ/sdJAE/Wtrx5FFD9P0RCiKkCz5/ih4MhMoin97LLD?=
 =?us-ascii?Q?K4FmIRss45oaCZpQUoKH3eTjTOkLCvo2JpoY1BKkCMbH6DEJ6c3jlLCtzjcH?=
 =?us-ascii?Q?UFyiVV/g8MWm/ObPyM5VAM2CZ844OFOmZ3lGDeY9pJK3GDptL23X4xUeKyld?=
 =?us-ascii?Q?1xETYAl/R2eTnGSnPCmhs9x080f+wOfy/aUROs3bnoho1Ymk2D1QDtRikKVI?=
 =?us-ascii?Q?DBudaFmt/7Cm9/BEmRnwdh7/q8KIBBPgQsOQYA/gkCmrQf7/y/0wlLKBI7Lc?=
 =?us-ascii?Q?XldSRspHS8NM6QSXK9n2xC15iJ2vsuDXms8ncVigbyh2N0EH96ZkjHniSWKb?=
 =?us-ascii?Q?CeKYwg7dN49+0PvXpWRlKJGgN2eMvoUyg74boWWjhS7dOtOozi/CboZVmSig?=
 =?us-ascii?Q?RyF+eVrxC89OgrtgE6XOsM3XzViCIMJXpl4kkjQz3djkmi/MCfA1ODpea44U?=
 =?us-ascii?Q?gUKUWgVUG8BgeaolVP+6TPthBcRrq4QC+HvPpncx4jLZQ2U8cTeFhycg4xc0?=
 =?us-ascii?Q?+IXzoOyZn34r1tqVszUL2n7WqfJTcwr+damoQOt9fbpWGcNHUE2gzAxvzeYE?=
 =?us-ascii?Q?VsnLDxofmcsuO52xAbBO7Bw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BC64EEF439EB8C43AB677EFB5BE358EA@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c59d2395-1117-4107-887d-08d9cef718ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2022 20:24:51.8809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K4FoaE1raWKizb9w80IhTsxsZFwKF4atG/phlO760ZQhf4sErP0xDD9UoANZfsC9kMK82l7ZPEYKI4WWqDoTYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5712
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10216
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201030138
X-Proofpoint-ORIG-GUID: 01pGQ-F9K1cMUturJp8DEc6uFucbj3zB
X-Proofpoint-GUID: 01pGQ-F9K1cMUturJp8DEc6uFucbj3zB
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Alex Sierra <alex.sierra@amd.com> [211206 14:00]:
> Device Coherent type uses device memory that is coherently accesible by
> the CPU. This could be shown as SP (special purpose) memory range
> at the BIOS-e820 memory enumeration. If no SP memory is supported in
> system, this could be faked by setting CONFIG_EFI_FAKE_MEMMAP.
>=20
> Currently, test_hmm only supports two different SP ranges of at least
> 256MB size. This could be specified in the kernel parameter variable
> efi_fake_mem. Ex. Two SP ranges of 1GB starting at 0x100000000 &
> 0x140000000 physical address. Ex.
> efi_fake_mem=3D1G@0x100000000:0x40000,1G@0x140000000:0x40000
>=20
> Private and coherent device mirror instances can be created in the same
> probed. This is done by passing the module parameters spm_addr_dev0 &
> spm_addr_dev1. In this case, it will create four instances of
> device_mirror. The first two correspond to private device type, the
> last two to coherent type. Then, they can be easily accessed from user
> space through /dev/hmm_mirror<num_device>. Usually num_device 0 and 1
> are for private, and 2 and 3 for coherent types. If no module
> parameters are passed, two instances of private type device_mirror will
> be created only.
>=20
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  lib/test_hmm.c      | 252 +++++++++++++++++++++++++++++++++-----------
>  lib/test_hmm_uapi.h |  15 ++-
>  2 files changed, 198 insertions(+), 69 deletions(-)
>=20
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 9edeff52302e..a1985226d788 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -29,11 +29,22 @@
> =20
>  #include "test_hmm_uapi.h"
> =20
> -#define DMIRROR_NDEVICES		2
> +#define DMIRROR_NDEVICES		4
>  #define DMIRROR_RANGE_FAULT_TIMEOUT	1000
>  #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
>  #define DEVMEM_CHUNKS_RESERVE		16
> =20
> +/*
> + * For device_private pages, dpage is just a dummy struct page
> + * representing a piece of device memory. dmirror_devmem_alloc_page
> + * allocates a real system memory page as backing storage to fake a
> + * real device. zone_device_data points to that backing page. But
> + * for device_coherent memory, the struct page represents real
> + * physical CPU-accessible memory that we can use directly.
> + */
> +#define BACKING_PAGE(page) (is_device_private_page((page)) ? \
> +			   (page)->zone_device_data : (page))
> +
>  static unsigned long spm_addr_dev0;
>  module_param(spm_addr_dev0, long, 0644);
>  MODULE_PARM_DESC(spm_addr_dev0,
> @@ -122,6 +133,21 @@ static int dmirror_bounce_init(struct dmirror_bounce=
 *bounce,
>  	return 0;
>  }
> =20
> +static bool dmirror_is_private_zone(struct dmirror_device *mdevice)
> +{
> +	return (mdevice->zone_device_type =3D=3D
> +		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ? true : false;
> +}
> +
> +static enum migrate_vma_direction
> +	dmirror_select_device(struct dmirror *dmirror)
> +{
> +	return (dmirror->mdevice->zone_device_type =3D=3D
> +		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ?
> +		MIGRATE_VMA_SELECT_DEVICE_PRIVATE :
> +		MIGRATE_VMA_SELECT_DEVICE_COHERENT;
> +}
> +
>  static void dmirror_bounce_fini(struct dmirror_bounce *bounce)
>  {
>  	vfree(bounce->ptr);
> @@ -572,16 +598,19 @@ static int dmirror_allocate_chunk(struct dmirror_de=
vice *mdevice,
>  static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mde=
vice)
>  {
>  	struct page *dpage =3D NULL;
> -	struct page *rpage;
> +	struct page *rpage =3D NULL;
> =20
>  	/*
> -	 * This is a fake device so we alloc real system memory to store
> -	 * our device memory.
> +	 * For ZONE_DEVICE private type, this is a fake device so we alloc real
> +	 * system memory to store our device memory.
> +	 * For ZONE_DEVICE coherent type we use the actual dpage to store the d=
ata
> +	 * and ignore rpage.
>  	 */
> -	rpage =3D alloc_page(GFP_HIGHUSER);
> -	if (!rpage)
> -		return NULL;
> -
> +	if (dmirror_is_private_zone(mdevice)) {
> +		rpage =3D alloc_page(GFP_HIGHUSER);
> +		if (!rpage)
> +			return NULL;
> +	}
>  	spin_lock(&mdevice->lock);
> =20
>  	if (mdevice->free_pages) {
> @@ -601,7 +630,8 @@ static struct page *dmirror_devmem_alloc_page(struct =
dmirror_device *mdevice)
>  	return dpage;
> =20
>  error:
> -	__free_page(rpage);
> +	if (rpage)
> +		__free_page(rpage);
>  	return NULL;
>  }
> =20
> @@ -627,12 +657,15 @@ static void dmirror_migrate_alloc_and_copy(struct m=
igrate_vma *args,
>  		 * unallocated pte_none() or read-only zero page.
>  		 */
>  		spage =3D migrate_pfn_to_page(*src);
> +		WARN(spage && is_zone_device_page(spage),
> +		     "page already in device spage pfn: 0x%lx\n",
> +		     page_to_pfn(spage));
> =20
>  		dpage =3D dmirror_devmem_alloc_page(mdevice);
>  		if (!dpage)
>  			continue;
> =20
> -		rpage =3D dpage->zone_device_data;
> +		rpage =3D BACKING_PAGE(dpage);
>  		if (spage)
>  			copy_highpage(rpage, spage);
>  		else
> @@ -646,6 +679,8 @@ static void dmirror_migrate_alloc_and_copy(struct mig=
rate_vma *args,
>  		 */
>  		rpage->zone_device_data =3D dmirror;
> =20
> +		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
> +			 page_to_pfn(spage), page_to_pfn(dpage));
>  		*dst =3D migrate_pfn(page_to_pfn(dpage)) |
>  			    MIGRATE_PFN_LOCKED;
>  		if ((*src & MIGRATE_PFN_WRITE) ||
> @@ -724,11 +759,7 @@ static int dmirror_migrate_finalize_and_map(struct m=
igrate_vma *args,
>  		if (!dpage)
>  			continue;
> =20
> -		/*
> -		 * Store the page that holds the data so the page table
> -		 * doesn't have to deal with ZONE_DEVICE private pages.
> -		 */
> -		entry =3D dpage->zone_device_data;
> +		entry =3D BACKING_PAGE(dpage);
>  		if (*dst & MIGRATE_PFN_WRITE)
>  			entry =3D xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
>  		entry =3D xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
> @@ -808,8 +839,106 @@ static int dmirror_exclusive(struct dmirror *dmirro=
r,
>  	return ret;
>  }
> =20
> -static int dmirror_migrate(struct dmirror *dmirror,
> -			   struct hmm_dmirror_cmd *cmd)
> +static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma=
 *args,
> +						      struct dmirror *dmirror)
> +{
> +	const unsigned long *src =3D args->src;
> +	unsigned long *dst =3D args->dst;
> +	unsigned long start =3D args->start;
> +	unsigned long end =3D args->end;
> +	unsigned long addr;
> +
> +	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE,
> +				       src++, dst++) {
> +		struct page *dpage, *spage;
> +
> +		spage =3D migrate_pfn_to_page(*src);
> +		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		WARN_ON(!is_device_page(spage));
> +		spage =3D BACKING_PAGE(spage);
> +		dpage =3D alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
> +		if (!dpage)
> +			continue;
> +		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
> +			 page_to_pfn(spage), page_to_pfn(dpage));
> +
> +		lock_page(dpage);
> +		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
> +		copy_highpage(dpage, spage);
> +		*dst =3D migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +		if (*src & MIGRATE_PFN_WRITE)
> +			*dst |=3D MIGRATE_PFN_WRITE;
> +	}
> +	return 0;
> +}
> +
> +static int dmirror_migrate_to_system(struct dmirror *dmirror,
> +				     struct hmm_dmirror_cmd *cmd)
> +{
> +	unsigned long start, end, addr;
> +	unsigned long size =3D cmd->npages << PAGE_SHIFT;
> +	struct mm_struct *mm =3D dmirror->notifier.mm;
> +	struct vm_area_struct *vma;
> +	unsigned long src_pfns[64];
> +	unsigned long dst_pfns[64];
> +	struct migrate_vma args;
> +	unsigned long next;
> +	int ret;
> +
> +	start =3D cmd->addr;
> +	end =3D start + size;
> +	if (end < start)
> +		return -EINVAL;
> +
> +	/* Since the mm is for the mirrored process, get a reference first. */
> +	if (!mmget_not_zero(mm))
> +		return -EINVAL;
> +
> +	mmap_read_lock(mm);
> +	for (addr =3D start; addr < end; addr =3D next) {
> +		vma =3D find_vma(mm, addr);
> +		if (!vma || addr < vma->vm_start ||
> +		    !(vma->vm_flags & VM_READ)) {

If you use vma_lookup() instead of find_vma(), then the if statement can
be simplified.

> +			ret =3D -EINVAL;
> +			goto out;
> +		}
> +		next =3D min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
> +		if (next > vma->vm_end)
> +			next =3D vma->vm_end;
> +
> +		args.vma =3D vma;
> +		args.src =3D src_pfns;
> +		args.dst =3D dst_pfns;
> +		args.start =3D addr;
> +		args.end =3D next;
> +		args.pgmap_owner =3D dmirror->mdevice;
> +		args.flags =3D dmirror_select_device(dmirror);
> +
> +		ret =3D migrate_vma_setup(&args);
> +		if (ret)
> +			goto out;
> +
> +		pr_debug("Migrating from device mem to sys mem\n");
> +		dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
> +
> +		migrate_vma_pages(&args);
> +		migrate_vma_finalize(&args);
> +	}

out label could be here.

> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return ret;
> +
> +out:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +	return ret;
> +}
> +
> +static int dmirror_migrate_to_device(struct dmirror *dmirror,
> +				struct hmm_dmirror_cmd *cmd)
>  {
>  	unsigned long start, end, addr;
>  	unsigned long size =3D cmd->npages << PAGE_SHIFT;
> @@ -853,6 +982,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
>  		if (ret)
>  			goto out;
> =20
> +		pr_debug("Migrating from sys mem to device mem\n");
>  		dmirror_migrate_alloc_and_copy(&args, dmirror);
>  		migrate_vma_pages(&args);
>  		dmirror_migrate_finalize_and_map(&args, dmirror);
> @@ -861,7 +991,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
>  	mmap_read_unlock(mm);
>  	mmput(mm);
> =20
> -	/* Return the migrated data for verification. */
> +	/* Return the migrated data for verification. only for pages in device =
zone */
>  	ret =3D dmirror_bounce_init(&bounce, start, size);
>  	if (ret)
>  		return ret;
> @@ -898,12 +1028,22 @@ static void dmirror_mkentry(struct dmirror *dmirro=
r, struct hmm_range *range,
>  	}
> =20
>  	page =3D hmm_pfn_to_page(entry);
> -	if (is_device_private_page(page)) {
> -		/* Is the page migrated to this device or some other? */
> -		if (dmirror->mdevice =3D=3D dmirror_page_to_device(page))
> +	if (is_device_page(page)) {
> +		/* Is page ZONE_DEVICE coherent? */
> +		if (!is_device_private_page(page)) {
> +			if (dmirror->mdevice =3D=3D dmirror_page_to_device(page))
> +				*perm =3D HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL;
> +			else
> +				*perm =3D HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE;
> +		/*
> +		 * Is page ZONE_DEVICE private migrated to
> +		 * this device or some other?
> +		 */
> +		} else if (dmirror->mdevice =3D=3D dmirror_page_to_device(page)) {
>  			*perm =3D HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
> -		else
> +		} else {
>  			*perm =3D HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
> +		}
>  	} else if (is_zero_pfn(page_to_pfn(page)))
>  		*perm =3D HMM_DMIRROR_PROT_ZERO;
>  	else
> @@ -1100,8 +1240,12 @@ static long dmirror_fops_unlocked_ioctl(struct fil=
e *filp,
>  		ret =3D dmirror_write(dmirror, &cmd);
>  		break;
> =20
> -	case HMM_DMIRROR_MIGRATE:
> -		ret =3D dmirror_migrate(dmirror, &cmd);
> +	case HMM_DMIRROR_MIGRATE_TO_DEV:
> +		ret =3D dmirror_migrate_to_device(dmirror, &cmd);
> +		break;
> +
> +	case HMM_DMIRROR_MIGRATE_TO_SYS:
> +		ret =3D dmirror_migrate_to_system(dmirror, &cmd);
>  		break;
> =20
>  	case HMM_DMIRROR_EXCLUSIVE:
> @@ -1142,14 +1286,13 @@ static const struct file_operations dmirror_fops =
=3D {
> =20
>  static void dmirror_devmem_free(struct page *page)
>  {
> -	struct page *rpage =3D page->zone_device_data;
> +	struct page *rpage =3D BACKING_PAGE(page);
>  	struct dmirror_device *mdevice;
> =20
> -	if (rpage)
> +	if (rpage !=3D page)
>  		__free_page(rpage);
> =20
>  	mdevice =3D dmirror_page_to_device(page);
> -
>  	spin_lock(&mdevice->lock);
>  	mdevice->cfree++;
>  	page->zone_device_data =3D mdevice->free_pages;
> @@ -1157,38 +1300,6 @@ static void dmirror_devmem_free(struct page *page)
>  	spin_unlock(&mdevice->lock);
>  }
> =20
> -static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma=
 *args,
> -						      struct dmirror *dmirror)
> -{
> -	const unsigned long *src =3D args->src;
> -	unsigned long *dst =3D args->dst;
> -	unsigned long start =3D args->start;
> -	unsigned long end =3D args->end;
> -	unsigned long addr;
> -
> -	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE,
> -				       src++, dst++) {
> -		struct page *dpage, *spage;
> -
> -		spage =3D migrate_pfn_to_page(*src);
> -		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
> -			continue;
> -		spage =3D spage->zone_device_data;
> -
> -		dpage =3D alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
> -		if (!dpage)
> -			continue;
> -
> -		lock_page(dpage);
> -		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
> -		copy_highpage(dpage, spage);
> -		*dst =3D migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> -		if (*src & MIGRATE_PFN_WRITE)
> -			*dst |=3D MIGRATE_PFN_WRITE;
> -	}
> -	return 0;
> -}
> -
>  static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>  {
>  	struct migrate_vma args;
> @@ -1203,7 +1314,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fa=
ult *vmf)
>  	 * the mirror but here we use it to hold the page for the simulated
>  	 * device memory and that page holds the pointer to the mirror.
>  	 */
> -	rpage =3D vmf->page->zone_device_data;
> +	rpage =3D BACKING_PAGE(vmf->page);
>  	dmirror =3D rpage->zone_device_data;
> =20
>  	/* FIXME demonstrate how we can adjust migrate range */
> @@ -1213,7 +1324,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fa=
ult *vmf)
>  	args.src =3D &src_pfns;
>  	args.dst =3D &dst_pfns;
>  	args.pgmap_owner =3D dmirror->mdevice;
> -	args.flags =3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
> +	args.flags =3D dmirror_select_device(dmirror);
> =20
>  	if (migrate_vma_setup(&args))
>  		return VM_FAULT_SIGBUS;
> @@ -1279,14 +1390,26 @@ static void dmirror_device_remove(struct dmirror_=
device *mdevice)
>  static int __init hmm_dmirror_init(void)
>  {
>  	int ret;
> -	int id;
> +	int id =3D 0;
> +	int ndevices =3D 0;
> =20
>  	ret =3D alloc_chrdev_region(&dmirror_dev, 0, DMIRROR_NDEVICES,
>  				  "HMM_DMIRROR");
>  	if (ret)
>  		goto err_unreg;
> =20
> -	for (id =3D 0; id < DMIRROR_NDEVICES; id++) {
> +	memset(dmirror_devices, 0, DMIRROR_NDEVICES * sizeof(dmirror_devices[0]=
));
> +	dmirror_devices[ndevices++].zone_device_type =3D
> +				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> +	dmirror_devices[ndevices++].zone_device_type =3D
> +				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> +	if (spm_addr_dev0 && spm_addr_dev1) {
> +		dmirror_devices[ndevices++].zone_device_type =3D
> +					HMM_DMIRROR_MEMORY_DEVICE_COHERENT;
> +		dmirror_devices[ndevices++].zone_device_type =3D
> +					HMM_DMIRROR_MEMORY_DEVICE_COHERENT;
> +	}
> +	for (id =3D 0; id < ndevices; id++) {
>  		ret =3D dmirror_device_init(dmirror_devices + id, id);
>  		if (ret)
>  			goto err_chrdev;
> @@ -1308,7 +1431,8 @@ static void __exit hmm_dmirror_exit(void)
>  	int id;
> =20
>  	for (id =3D 0; id < DMIRROR_NDEVICES; id++)
> -		dmirror_device_remove(dmirror_devices + id);
> +		if (dmirror_devices[id].zone_device_type)
> +			dmirror_device_remove(dmirror_devices + id);
>  	unregister_chrdev_region(dmirror_dev, DMIRROR_NDEVICES);
>  }
> =20
> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
> index 625f3690d086..e190b2ab6f19 100644
> --- a/lib/test_hmm_uapi.h
> +++ b/lib/test_hmm_uapi.h
> @@ -33,11 +33,12 @@ struct hmm_dmirror_cmd {
>  /* Expose the address space of the calling process through hmm device fi=
le */
>  #define HMM_DMIRROR_READ		_IOWR('H', 0x00, struct hmm_dmirror_cmd)
>  #define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
> -#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x05, struct hmm_dmirror_=
cmd)
> -#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x06, struct hmm_dmirror=
_cmd)
> +#define HMM_DMIRROR_MIGRATE_TO_DEV	_IOWR('H', 0x02, struct hmm_dmirror_c=
md)
> +#define HMM_DMIRROR_MIGRATE_TO_SYS	_IOWR('H', 0x03, struct hmm_dmirror_c=
md)
> +#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
> +#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_=
cmd)
> +#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x07, struct hmm_dmirror=
_cmd)
> =20
>  /*
>   * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
> @@ -52,6 +53,8 @@ struct hmm_dmirror_cmd {
>   *					device the ioctl() is made
>   * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on =
some
>   *					other device
> + * HMM_DMIRROR_PROT_DEV_COHERENT: Migrate device coherent page on the de=
vice
> + *				  the ioctl() is made
>   */
>  enum {
>  	HMM_DMIRROR_PROT_ERROR			=3D 0xFF,
> @@ -63,6 +66,8 @@ enum {
>  	HMM_DMIRROR_PROT_ZERO			=3D 0x10,
>  	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	=3D 0x20,
>  	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	=3D 0x30,
> +	HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL	=3D 0x40,
> +	HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE	=3D 0x50,
>  };
> =20
>  enum {
> --=20
> 2.32.0
>=20
> =
