Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F304BA22738
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 01:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CD710E8CC;
	Thu, 30 Jan 2025 00:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p2Mi6g1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF26D10E8CC;
 Thu, 30 Jan 2025 00:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3oVXNe8MF81vRdKodvvOV4JJXvxIMgtVatFWSWB3JwUVXlsH8okoMVx8uiMbvQf9iCyYsy2ICLbCiQxOnWPz5iw2r6jMqdn7uuLBR4GZRkQ72+nigqbdI6Db0fMFfGav1ZIQzpk/jtSd/3Ti1V1Z4jyY7SfR6CTFifEnAMXMTW1TSa2UryuEa+xFBW3WXq0ikSFzORrC+T05NmMLV5mDXnE8EDjZrVHC9mFkZRuJjzs9qH263LYzhhdeAEK0cvFyIgyipud2AVW7rwSVkLAaQVPnnYZJnLaNbog8+7CLm1s1hZtZ4x3JrFVn7eIoXFcMGqPC95qmT4aVhiNerLeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02O4URxI+UKEqwzt7KPDV+TGINmQl1F6/t4to/7U9Jw=;
 b=DANO+U4CX4hlzOXbgvJh0DDt0qbHseKUA11aUsIm/i7zC89k3sZRCpigE76I0LXfkDvu3v6P3L0usaQn9puGF9I99UN39IhvWakchmWlV3hEHRz9vp4d/MlMo7dBeXZcIVRl+KhVQi6QZr7UeMS7dkiWi3JK7wUoP4ti1RX9RIkda70xD+gujPi8hrZRJrBvbNiZLEasMgZNQnOR6zvichtGVae3CtrO2pYa20fuYeTRBNC0Pks0mhVj9c7tuXRTBKUyhNKPfJ2BVv6ilxm7O8bTmXx07FDD5IM7zonGtiGkh9KAISRKymbYxevHL4OhhWRbD295/mWTwosv0BM4uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02O4URxI+UKEqwzt7KPDV+TGINmQl1F6/t4to/7U9Jw=;
 b=p2Mi6g1giVlSQ6DbMe5HnvIhiXe4JifevgHenS4FU0Jg+2NfnpOdfJdhBW3icA5V763vW+S5slphJoZTcbxob8ynsFLhDkNvVlhoXW4NYNNSzhtLHtOwCSUB7R+ImZwjgW10K78MnOqgp8cRHIo5+gSn6dZmOAU1Lfg6DSFnEZyPAqQoBxGg+PchPXoHM3c5K9/ohUR1civf1feiZTGOUpB6xz2K/CJBzJ41MKvQsibvO6rYoFSXGH7BBWDzdXsLyU8rT31VM72niLRpJGWRzXClE+lANTIhUAbHqu9BhX2N06WIUusrYPFsHBYU/6RWqg0SrAdEa9KVkDxQIJ1Rkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by SA1PR12MB8844.namprd12.prod.outlook.com (2603:10b6:806:378::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 00:29:54 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%6]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 00:29:54 +0000
Date: Thu, 30 Jan 2025 11:29:48 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 1/4] lib/test_hmm: make dmirror_atomic_map() consume a
 single page
Message-ID: <l5keslqv77nju4p5rtroqm5w462nux6thgk2kqrxvtu4eljf5t@n6srj4v7ps5a>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-2-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115803.2084769-2-david@redhat.com>
X-ClientProxiedBy: SY5PR01CA0069.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|SA1PR12MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad4629a-77b8-4993-5c9a-08dd40c5374d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D2crkQ807fxWgSTOVMIf4LOte5qraGv8+KeTd5mcM7Ul4M+Ugr6tLIWpnh+5?=
 =?us-ascii?Q?Z7GPOx29t/4OEZI8Hp2wv8qjeG3cwAs9aEHEcuF4HWY62tFQ/FS8zZuPGrzF?=
 =?us-ascii?Q?AMkLc4COGpultzk4AVTfJHTFtVe5+WjGn4nM445YC1pV28SWJneT2pU53/pA?=
 =?us-ascii?Q?yfblz8+YLqD62gIATyAfb9d2IglpXzpZn9SOh5/iVj49gu1iheL8g0FmH5MA?=
 =?us-ascii?Q?7utnLEbUpfzxvALjAVRqjIxt8sFQnEFj4mCt7Wqvqzb+3P6/Wbm3J47JWpgu?=
 =?us-ascii?Q?lzN8elYsud7vAVDO2PXf1yivGkgWpzw8So7FlPUhwW0xEwLROPZKvD4ser1w?=
 =?us-ascii?Q?POE5umVzMcOe2K3cLxoiZ7UToqs9iRGbY39FU+JKZ1RVhlFd1je5WpmIXxnD?=
 =?us-ascii?Q?EErzZMVaObWo2dDZZzjutI6V1in9JKHNcgape2KZoOn9XTAVJQm7OAgTFREW?=
 =?us-ascii?Q?o+WTeIaOcPGPt/K8tgQ+Y97rg+Ntqzb9nkIiFH4ttBsmZTXVHjzWqz79WD6M?=
 =?us-ascii?Q?pnvQ0rC3/RS+0rTI4AcvxS6FqOHg0Bc4wr5Hq7exCeBZu1g68RQU/5QKoBqt?=
 =?us-ascii?Q?MALftukbhrQrqd5WJxFkBNLXMZufrWl/Djs6y+8/6XO4vcwplBCz6sSQvktv?=
 =?us-ascii?Q?ZXclSOetKY7rJwqU+m+spZTRl22SBDtnI7hZKS3QPhbZAObn5sn0i9WuAkAK?=
 =?us-ascii?Q?47whuXRk5Kt9WAQLZoQQtUH8PijX1iHM/qE4VefLZnEmp4gOqh90WJ2zJ3IA?=
 =?us-ascii?Q?+sQ73GveuAH1WTYzOpoAnESOaV3C5cp/BfZptBiP8VYsXNpp7+cpdm81RciH?=
 =?us-ascii?Q?yTjvusjtXe6/dpxOWIUdEXtuSL+1WfnAj7axU8j9QGMqc2zBsrbS6n0Lbmf4?=
 =?us-ascii?Q?57lrKjZ4GQ2LEPs8jHS7j79vVs0Lt7JLvL3CgPjtXhD45mngE/LxwycEUzBD?=
 =?us-ascii?Q?u8LisPnACjnl+TUAquHYgKmUMSBgzByfPH/7WLMl3LH2yVdqh3rfBB/ge351?=
 =?us-ascii?Q?uZvZaWwRUqvhisP/59+q4B3fNWZWCATRJcAxVcLZ+KSp4hDhEvuPUOIW4M6y?=
 =?us-ascii?Q?t3VR3gF2VfGvUPuXPa3LOHm2KIbl6oEaq/clrYyPFH1CDDR5OSJljGLIFkei?=
 =?us-ascii?Q?kK9UZHunz7p3HPVoOn0ztGnENxYpp9oZcqxYHxdiGpgll4tD92eek9zL0+PC?=
 =?us-ascii?Q?EHammxLnBvdWsudawHUtPTLzOpDQRJJ7sF/tT98gYsYOun9wFQJdVb+GNFlS?=
 =?us-ascii?Q?K5UJb6VJYBiDhqcQFPpxRXiuIRZqSH2VsgqbDT1e5Oqp7/Omj3wj6hXze4wO?=
 =?us-ascii?Q?k4ZrxuUUqsKGlytnr3c7bS5nrwWXh9UMqrUR/w8pjgaGdUwn1oRZ/Pqo13Ro?=
 =?us-ascii?Q?rjA557tZQnRsbOVc4Tr0S48awZ6F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l9QdbohBVuKK5Xs892oc3FJILRvM5eJ4qS8Tgf7p5hP4SG3U+9Le2d6CTcBu?=
 =?us-ascii?Q?Z9uySVT5FDmWEj0BbwDA/qitg+Roe638ojFhUYeZytgObAqPm3b4FSUJxP3s?=
 =?us-ascii?Q?5Yi0xuqJL8n07YcDVQfRAiu+udkD9S1qugKY7l1du3wiZntQcx7q1+cGtNGB?=
 =?us-ascii?Q?APPkZqOogcrNeNevsxc5xJxpzlKqBSbTyMT/afB2wzcXnKqwmXwFXRMTZbSU?=
 =?us-ascii?Q?+Lo0ynXHpAIZvztoF2pI6yGxnOtrfq7w27DgocxqenTehdeSiUEVR1A2e8qI?=
 =?us-ascii?Q?6oXdUp9//8xOHl40Ae8Atx42TYgFfrjGQY/jYFnrW0qqfcPzWy/KvLix71hF?=
 =?us-ascii?Q?prJ8FIOvI8V5hAeZJEEfUQhDBYKwUNJWU9l+NmFz02CKwMr5MRXJQuIXHBLt?=
 =?us-ascii?Q?943dIQmGjxIGV7dZZZL85elplXOeJBFjJAhQbVbMSReCf7d8iTN4KZmyskcJ?=
 =?us-ascii?Q?/wMTxIp0ZvdYl5GsoM+GmDP0MOy/5y4o28mQlXOZ94c+4PxQyhKUoXdL30up?=
 =?us-ascii?Q?px3emy2uyfv59F+NBDqo1crQpbUUgDCLLNbFSPcXxXp4QLZs83AJ70gcDgOd?=
 =?us-ascii?Q?8Iq0JCTA2yVKNrHe7LWS/i3Lovqh07L+2kOsx3+znSTyW1BQ/Oiqv/jQH0/5?=
 =?us-ascii?Q?isvQRKHqtkaHiKYVwnnPp448wodO0yC5xNERhnE3oHxn3MaM+WV0jjB9Vt27?=
 =?us-ascii?Q?ZT/aHLr0AP2VtbwPWS77V6LXGBlqhuFJFwpbOGU/IUZqyeD+RI7Tjkydc6MU?=
 =?us-ascii?Q?7ntasTdxMqTkUDthcTiDspHyCFgsO/s8+AdHlAPVXzuEpYEndrGmBXy8KCZl?=
 =?us-ascii?Q?E/SpUPzU8rqAmpS3NaNWjXIQyCCJfZTUsqJETgygE8jR6A/geh9h0q68Sq0a?=
 =?us-ascii?Q?vl1LHyXBUBofqG+IbMfxFzHG1nEF1uhEZtQhpGLJh9Z9suLT3ZUTYIcCZpjz?=
 =?us-ascii?Q?GGNjVWHNWqAQ+aLhiznDwBp+tBUf/iQfinKrg4Ja6u532n3lqIk1Z+NoZ9c5?=
 =?us-ascii?Q?MPWFfE8o/yk6X26JZ9Pqp6iQyec/Ne4OAYpqs9qM9scmljENCROs3PGXgPU/?=
 =?us-ascii?Q?vba1Lf0jr1BnadwcxWsHF7biKa+oshOIt2zjdkwUKstzQhdBb55Ygq5WDOhK?=
 =?us-ascii?Q?c+SY7cldL4Ir90p/dNuVUNH7PRfxqkV1cMpH0PYVuB1kpKuiCfRPgq0tr4wU?=
 =?us-ascii?Q?2m6dNEmneQ26afCSytWTU6vnpBdZ4dbLgQIrQUKKmRRlcWNI0rrRKL7OQmwE?=
 =?us-ascii?Q?e1QDBQkZMn4cjnOGBNftGj8D8mmoJgO89+x90JdIHU/zEMjNrgXnEirgjr5V?=
 =?us-ascii?Q?jq0hij7hEokOvsYXlxKKujGcrY63MFKSGg72py5Xkl4IzMPrAIE9M+9h/XDS?=
 =?us-ascii?Q?iJc8XqYxXR4f1qRWOjegDo1V8derw3jwqLpx4K0Xw5VyugrMI0zuE6lvuM4H?=
 =?us-ascii?Q?BgAf+NswDrEUq4qhfUJSKDDcNIpUHMDU790QggeTPBg038/dOfdP/haDe+AS?=
 =?us-ascii?Q?Dr7Sl9WRfV+B0ODL/Hi+KoB6GD8NLr43B26TXGT3EHeRde3iIAbEalXK3T0X?=
 =?us-ascii?Q?Xe8iUN8sdc5GQmtaIAQBv47m/6jbxaXouCx4F514?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad4629a-77b8-4993-5c9a-08dd40c5374d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 00:29:54.3351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XH++Rd7o6lilXzZQ60ikPKCWe8Yc3pfXxqjFZggz7zUZ4r3TwWQqTvr9F9uN66z2vnVs6Mo1Vke61VUTDirT4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8844
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

On Wed, Jan 29, 2025 at 12:57:59PM +0100, David Hildenbrand wrote:
> The caller now always passes a single page; let's simplify, and return
> "0" on success.

Thanks for cleaning that up.

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  lib/test_hmm.c | 33 ++++++++++-----------------------
>  1 file changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 9e1b07a227a3..1c0a58279db9 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -706,34 +706,23 @@ static int dmirror_check_atomic(struct dmirror *dmirror, unsigned long start,
>  	return 0;
>  }
>  
> -static int dmirror_atomic_map(unsigned long start, unsigned long end,
> -			      struct page **pages, struct dmirror *dmirror)
> +static int dmirror_atomic_map(unsigned long addr, struct page *page,
> +		struct dmirror *dmirror)
>  {
> -	unsigned long pfn, mapped = 0;
> -	int i;
> +	void *entry;
>  
>  	/* Map the migrated pages into the device's page tables. */
>  	mutex_lock(&dmirror->mutex);
>  
> -	for (i = 0, pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++, i++) {
> -		void *entry;
> -
> -		if (!pages[i])
> -			continue;
> -
> -		entry = pages[i];
> -		entry = xa_tag_pointer(entry, DPT_XA_TAG_ATOMIC);
> -		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
> -		if (xa_is_err(entry)) {
> -			mutex_unlock(&dmirror->mutex);
> -			return xa_err(entry);
> -		}
> -
> -		mapped++;
> +	entry = xa_tag_pointer(page, DPT_XA_TAG_ATOMIC);
> +	entry = xa_store(&dmirror->pt, addr >> PAGE_SHIFT, entry, GFP_ATOMIC);
> +	if (xa_is_err(entry)) {
> +		mutex_unlock(&dmirror->mutex);
> +		return xa_err(entry);
>  	}
>  
>  	mutex_unlock(&dmirror->mutex);
> -	return mapped;
> +	return 0;
>  }
>  
>  static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
> @@ -803,9 +792,7 @@ static int dmirror_exclusive(struct dmirror *dmirror,
>  			break;
>  		}
>  
> -		ret = dmirror_atomic_map(addr, addr + PAGE_SIZE, &page, dmirror);
> -		if (!ret)
> -			ret = -EBUSY;
> +		ret = dmirror_atomic_map(addr, page, dmirror);
>  		folio_unlock(folio);
>  		folio_put(folio);
>  
> -- 
> 2.48.1
> 
