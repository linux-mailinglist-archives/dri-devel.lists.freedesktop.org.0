Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290A534D137
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEA089F41;
	Mon, 29 Mar 2021 13:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D9D89F41;
 Mon, 29 Mar 2021 13:36:27 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TDYJUd017514;
 Mon, 29 Mar 2021 13:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=+ax3LWAcPJv8HXwL+D6MVfobyCv05ioKkMwMhXABFFM=;
 b=Vtrjq9KBQW5gHwdzlZ092SpkbkzI/H7jnTZDjmma2dECkikNqkgqd9ZI0TsRVW63iNXv
 IP917HcCOHnkVxgIsV2Y7w/Pg3kjzFQvnHF/HVUfEH3/Ecsm3AZyHQuONRBLWCOr3Aw1
 s7pOaqVIhAuxy7/rebSbsxBtrhXGoWSgb8j0vdWN28dAf+VQcrUqiV32kCS+Ztnl4Ax4
 yhp6eneECNe46JVMvJw7CZDXLxhrxhgcStZppSWi1nI64dq+q12rDULs4uHwrom1j4+N
 7VZp9u+CKSDxe4eY0lmGAQt9UehmVjMTqehacQfEKjYEuJusz5mPO5kcUEWQ5GTGteI3 Iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 37hwbnbgt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 13:36:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TDVQbQ142519;
 Mon, 29 Mar 2021 13:36:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 37jemvqmep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 13:36:21 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12TDaGmC023235;
 Mon, 29 Mar 2021 13:36:16 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 29 Mar 2021 06:36:16 -0700
Date: Mon, 29 Mar 2021 16:36:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: mikita.lipski@amd.com
Subject: [bug report] drm/amd/display: Reuse parsing code of debugfs write
 buffer
Message-ID: <YGHXyY1QvoaZf4L9@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290103
X-Proofpoint-GUID: _solBIM-ZaQDdLCwrTkeMJFlUiWRyBQw
X-Proofpoint-ORIG-GUID: _solBIM-ZaQDdLCwrTkeMJFlUiWRyBQw
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1011
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290103
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Mikita Lipski,

The patch 04111850cf56: "drm/amd/display: Reuse parsing code of
debugfs write buffer" from Mar 26, 2020, leads to the following
static checker warning:

	drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:80 parse_write_buffer_into_params()
	error: 'copy_from_user()' 'wr_buf_ptr' too small (100 vs 1000000000)

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c
    64  static int parse_write_buffer_into_params(char *wr_buf, uint32_t wr_buf_size,
    65                                            long *param, const char __user *buf,
    66                                            int max_param_num,
    67                                            uint8_t *param_nums)
    68  {
    69          char *wr_buf_ptr = NULL;
    70          uint32_t wr_buf_count = 0;
    71          int r;
    72          char *sub_str = NULL;
    73          const char delimiter[3] = {' ', '\n', '\0'};
    74          uint8_t param_index = 0;
    75  
    76          *param_nums = 0;
    77  
    78          wr_buf_ptr = wr_buf;
    79  
    80          r = copy_from_user(wr_buf_ptr, buf, wr_buf_size);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The "wr_buf_ptr" is a fixed size buffer and the "wr_buf_size" comes from
the user so this would be a privalege escalation bug if it weren't
debugfs.

It's better to move the allocation into this function.  Remember to
free before returning.

		wr_buf = memdup_user(buf, wr_buf_size + 1);
		if (IS_ERR(wr_buf))
			return PTR_ERR(wr_buf);

(Written in email client.  Not compile tested.)

    81  
    82                  /* r is bytes not be copied */
    83          if (r >= wr_buf_size) {

This test is wrong.  It should have been zero instead of wr_buf_size
but that doesn't matter now that we've switched to memdup_user().


    84                  DRM_DEBUG_DRIVER("user data not be read\n");
    85                  return -EINVAL;

Don't print an error if copy_from_user() fails.  Return -EFAULT instead
of -EINVAL.

    86          }
    87  
    88          /* check number of parameters. isspace could not differ space and \n */
    89          while ((*wr_buf_ptr != 0xa) && (wr_buf_count < wr_buf_size)) {
    90                  /* skip space*/
    91                  while (isspace(*wr_buf_ptr) && (wr_buf_count < wr_buf_size)) {
    92                          wr_buf_ptr++;
    93                          wr_buf_count++;
    94                          }
    95  
    96                  if (wr_buf_count == wr_buf_size)
    97                          break;
    98  
    99                  /* skip non-space*/
   100                  while ((!isspace(*wr_buf_ptr)) && (wr_buf_count < wr_buf_size)) {
   101                          wr_buf_ptr++;
   102                          wr_buf_count++;
   103                  }
   104  
   105                  (*param_nums)++;
   106  
   107                  if (wr_buf_count == wr_buf_size)
   108                          break;
   109          }
   110  
   111          if (*param_nums > max_param_num)
   112                  *param_nums = max_param_num;
   113  
   114          wr_buf_ptr = wr_buf; /* reset buf pointer */
   115          wr_buf_count = 0; /* number of char already checked */
   116  
   117          while (isspace(*wr_buf_ptr) && (wr_buf_count < wr_buf_size)) {
   118                  wr_buf_ptr++;
   119                  wr_buf_count++;
   120          }
   121  
   122          while (param_index < *param_nums) {
   123                  /* after strsep, wr_buf_ptr will be moved to after space */
   124                  sub_str = strsep(&wr_buf_ptr, delimiter);

This code is not checking wr_buf_count.  I guess the thinking was that
the first look would find the number of words and the next loop would
use that pre-validated count.  There is not a one to one relationship
between your delimeters and ispace() (tabs) but I guess your delimeter
is a subset of isspace() so that works...

This code also assumes that "wr_buf_ptr" is NUL terminated but that's
not necessarily the case so it could lead to a buffer overflow.  For
example, imagine the whole buffer is full of tabs.  That's counted as
one word.  We're already off the end of the buffer before we call
strsep().  Or if the whole buffer is spaces except for the last
character.  That's again one word and the strsep will read beyond the
end and corrupt memory.

   125  
   126                  r = kstrtol(sub_str, 16, &(param[param_index]));


   127  
   128                  if (r)
   129                          DRM_DEBUG_DRIVER("string to int convert error code: %d\n", r);
   130  
   131                  param_index++;
   132          }
   133  
   134          return 0;
   135  }

This whole function could probably be written like (not compiled):

	wr_buf = memdup_user(buf, wr_buf_size + 1);
	if (IS_ERR(wr_buf))
		return PTR_ERR(wr_buf);
	wr_buf[wr_buf_size] = '\0';

	p = wr_buf;
	while (p && *p) {
		if (*param_nums >= max_param_num)
			goto done;
		while (*p && isspace(*p))
			p++;
		sub_str = strsep(&p, delimiter);
		ret = kstrtol(sub_str, 16, &(param[param_index]));
		if (ret)
			goto done;
		(*param_nums)++;
	}
done:
	kfree(wr_buf);
	return 0;

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
