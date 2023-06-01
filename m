Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3216C71A0D5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 16:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06A410E56C;
	Thu,  1 Jun 2023 14:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECD210E56C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685630931; x=1717166931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2FTXpZZUjF4O+XNBC7fuiImWeTKkrfWGkyKkf1TaJnM=;
 b=L/X5WJRmLFxkwCkMkXsDJy/3Ve7ZvRs6RJV8KrWquAAT6AC8UYrsLNJg
 wM8C/vDQI/mq4NPAuD267ld8LpFigy7wzwo/ygao7k2YBfyyB3UhC4HjQ
 xnGQ/92E5G9m91AWW7DVte9ud+xNvfbUjwxtWcT/ddrYnlOlhEJCMmp/m
 7txaUJjPQ4qjPPimTMsUhcmWZENgd8CMGnte3ZhLazTz2Xu5Wdo5cTnL0
 6N9M6wG/8tBPRNkBZwxtvfaa3Y02uGEecQ5Pmmthn4e9aEfPcXXH45XCJ
 qIibl6qs6OZiJYgVhNG4wVU47OmD2ydfzaABV2nbuSZjp/X+xGv7Do7SJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421382763"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="421382763"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="819828394"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="819828394"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 07:38:23 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q4jRW-0002NW-14;
 Thu, 01 Jun 2023 14:38:22 +0000
Date: Thu, 1 Jun 2023 22:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lu Hongfei <luhongfei@vivo.com>, Artur Weber <aweber.kernel@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: drm/panel: Optimize the workflow of s6d7aa0_lock
Message-ID: <202306012249.Sm2dlQLk-lkp@intel.com>
References: <20230531110717.36896-1-luhongfei@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531110717.36896-1-luhongfei@vivo.com>
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
Cc: opensource.kernel@vivo.com, luhongfei@vivo.com,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20230601]
[cannot apply to linus/master v6.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lu-Hongfei/gpu-drm-panel-Optimize-the-workflow-of-s6d7aa0_lock/20230531-190848
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230531110717.36896-1-luhongfei%40vivo.com
patch subject: [PATCH] gpu: drm/panel: Optimize the workflow of s6d7aa0_lock
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230601/202306012249.Sm2dlQLk-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e1ade7d20fb0efb9aa0b332d5ac5da2863f8e68e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lu-Hongfei/gpu-drm-panel-Optimize-the-workflow-of-s6d7aa0_lock/20230531-190848
        git checkout e1ade7d20fb0efb9aa0b332d5ac5da2863f8e68e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/gpu/drm/panel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306012249.Sm2dlQLk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:17:
   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c: In function 's6d7aa0_lock':
>> include/drm/drm_mipi_dsi.h:326:9: error: expected expression before 'do'
     326 |         do {                                                               \
         |         ^~
   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:72:23: note: in expansion of macro 'mipi_dsi_dcs_write_seq'
      72 |                 ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
>> include/drm/drm_mipi_dsi.h:326:9: error: expected expression before 'do'
     326 |         do {                                                               \
         |         ^~
   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:75:23: note: in expansion of macro 'mipi_dsi_dcs_write_seq'
      75 |                 ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
>> include/drm/drm_mipi_dsi.h:326:9: error: expected expression before 'do'
     326 |         do {                                                               \
         |         ^~
   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:79:31: note: in expansion of macro 'mipi_dsi_dcs_write_seq'
      79 |                         ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0x5a, 0x5a);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
>> include/drm/drm_mipi_dsi.h:326:9: error: expected expression before 'do'
     326 |         do {                                                               \
         |         ^~
   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:84:23: note: in expansion of macro 'mipi_dsi_dcs_write_seq'
      84 |                 ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
>> include/drm/drm_mipi_dsi.h:326:9: error: expected expression before 'do'
     326 |         do {                                                               \
         |         ^~
   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:87:23: note: in expansion of macro 'mipi_dsi_dcs_write_seq'
      87 |                 ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
>> include/drm/drm_mipi_dsi.h:326:9: error: expected expression before 'do'
     326 |         do {                                                               \
         |         ^~
   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:91:31: note: in expansion of macro 'mipi_dsi_dcs_write_seq'
      91 |                         ret = mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:68:33: warning: unused variable 'dsi' [-Wunused-variable]
      68 |         struct mipi_dsi_device *dsi = ctx->dsi;
         |                                 ^~~


vim +/do +326 include/drm/drm_mipi_dsi.h

3d9a8fcf1c6a90 Thierry Reding           2014-08-05  268  
960dd616f61c84 Thierry Reding           2014-07-21  269  ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
960dd616f61c84 Thierry Reding           2014-07-21  270  				  const void *data, size_t len);
960dd616f61c84 Thierry Reding           2014-07-21  271  ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
960dd616f61c84 Thierry Reding           2014-07-21  272  			   const void *data, size_t len);
3c523d7d38a17b Thierry Reding           2014-07-21  273  ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
3c523d7d38a17b Thierry Reding           2014-07-21  274  			  size_t len);
083d573fd013c9 Thierry Reding           2014-08-05  275  int mipi_dsi_dcs_nop(struct mipi_dsi_device *dsi);
2f16b89737e24b Thierry Reding           2014-08-05  276  int mipi_dsi_dcs_soft_reset(struct mipi_dsi_device *dsi);
3d9a8fcf1c6a90 Thierry Reding           2014-08-05  277  int mipi_dsi_dcs_get_power_mode(struct mipi_dsi_device *dsi, u8 *mode);
5cc0af16fc08cf Thierry Reding           2014-08-05  278  int mipi_dsi_dcs_get_pixel_format(struct mipi_dsi_device *dsi, u8 *format);
42fe1e755d08b8 YoungJun Cho             2014-08-05  279  int mipi_dsi_dcs_enter_sleep_mode(struct mipi_dsi_device *dsi);
42fe1e755d08b8 YoungJun Cho             2014-08-05  280  int mipi_dsi_dcs_exit_sleep_mode(struct mipi_dsi_device *dsi);
42fe1e755d08b8 YoungJun Cho             2014-08-05  281  int mipi_dsi_dcs_set_display_off(struct mipi_dsi_device *dsi);
42fe1e755d08b8 YoungJun Cho             2014-08-05  282  int mipi_dsi_dcs_set_display_on(struct mipi_dsi_device *dsi);
3b46d4a0def157 Thierry Reding           2014-08-05  283  int mipi_dsi_dcs_set_column_address(struct mipi_dsi_device *dsi, u16 start,
3b46d4a0def157 Thierry Reding           2014-08-05  284  				    u16 end);
3b46d4a0def157 Thierry Reding           2014-08-05  285  int mipi_dsi_dcs_set_page_address(struct mipi_dsi_device *dsi, u16 start,
3b46d4a0def157 Thierry Reding           2014-08-05  286  				  u16 end);
42fe1e755d08b8 YoungJun Cho             2014-08-05  287  int mipi_dsi_dcs_set_tear_off(struct mipi_dsi_device *dsi);
42fe1e755d08b8 YoungJun Cho             2014-08-05  288  int mipi_dsi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
42fe1e755d08b8 YoungJun Cho             2014-08-05  289  			     enum mipi_dsi_dcs_tear_mode mode);
5cc0af16fc08cf Thierry Reding           2014-08-05  290  int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format);
bbdcf516a6187d Thierry Reding           2016-08-24  291  int mipi_dsi_dcs_set_tear_scanline(struct mipi_dsi_device *dsi, u16 scanline);
1a9d759331b832 Vinay Simha BN           2016-07-31  292  int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
1a9d759331b832 Vinay Simha BN           2016-07-31  293  					u16 brightness);
1a9d759331b832 Vinay Simha BN           2016-07-31  294  int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
1a9d759331b832 Vinay Simha BN           2016-07-31  295  					u16 *brightness);
c9d27c6be518b4 Daniel Mentz             2023-01-16  296  int mipi_dsi_dcs_set_display_brightness_large(struct mipi_dsi_device *dsi,
c9d27c6be518b4 Daniel Mentz             2023-01-16  297  					     u16 brightness);
c9d27c6be518b4 Daniel Mentz             2023-01-16  298  int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
c9d27c6be518b4 Daniel Mentz             2023-01-16  299  					     u16 *brightness);
068a0023396983 Andrzej Hajda            2013-12-04  300  
a9015ce593204f Javier Martinez Canillas 2023-01-02  301  /**
a9015ce593204f Javier Martinez Canillas 2023-01-02  302   * mipi_dsi_generic_write_seq - transmit data using a generic write packet
a9015ce593204f Javier Martinez Canillas 2023-01-02  303   * @dsi: DSI peripheral device
a9015ce593204f Javier Martinez Canillas 2023-01-02  304   * @seq: buffer containing the payload
a9015ce593204f Javier Martinez Canillas 2023-01-02  305   */
a9015ce593204f Javier Martinez Canillas 2023-01-02  306  #define mipi_dsi_generic_write_seq(dsi, seq...)                                \
a9015ce593204f Javier Martinez Canillas 2023-01-02  307  	do {                                                                   \
a9015ce593204f Javier Martinez Canillas 2023-01-02  308  		static const u8 d[] = { seq };                                 \
a9015ce593204f Javier Martinez Canillas 2023-01-02  309  		struct device *dev = &dsi->dev;                                \
a9015ce593204f Javier Martinez Canillas 2023-01-02  310  		int ret;                                                       \
a9015ce593204f Javier Martinez Canillas 2023-01-02  311  		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));           \
a9015ce593204f Javier Martinez Canillas 2023-01-02  312  		if (ret < 0) {                                                 \
a9015ce593204f Javier Martinez Canillas 2023-01-02  313  			dev_err_ratelimited(dev, "transmit data failed: %d\n", \
a9015ce593204f Javier Martinez Canillas 2023-01-02  314  					    ret);                              \
a9015ce593204f Javier Martinez Canillas 2023-01-02  315  			return ret;                                            \
a9015ce593204f Javier Martinez Canillas 2023-01-02  316  		}                                                              \
a9015ce593204f Javier Martinez Canillas 2023-01-02  317  	} while (0)
a9015ce593204f Javier Martinez Canillas 2023-01-02  318  
2a9e9daf75231c Joel Selvaraj            2022-06-01  319  /**
2a9e9daf75231c Joel Selvaraj            2022-06-01  320   * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
2a9e9daf75231c Joel Selvaraj            2022-06-01  321   * @dsi: DSI peripheral device
2a9e9daf75231c Joel Selvaraj            2022-06-01  322   * @cmd: Command
2a9e9daf75231c Joel Selvaraj            2022-06-01  323   * @seq: buffer containing data to be transmitted
2a9e9daf75231c Joel Selvaraj            2022-06-01  324   */
51d3c0e7dc3cf1 Javier Martinez Canillas 2023-01-02  325  #define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                           \
51d3c0e7dc3cf1 Javier Martinez Canillas 2023-01-02 @326  	do {                                                               \
2a9e9daf75231c Joel Selvaraj            2022-06-01  327  		static const u8 d[] = { cmd, seq };                        \
2a9e9daf75231c Joel Selvaraj            2022-06-01  328  		struct device *dev = &dsi->dev;                            \
2a9e9daf75231c Joel Selvaraj            2022-06-01  329  		int ret;                                                   \
2a9e9daf75231c Joel Selvaraj            2022-06-01  330  		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
2a9e9daf75231c Joel Selvaraj            2022-06-01  331  		if (ret < 0) {                                             \
51d3c0e7dc3cf1 Javier Martinez Canillas 2023-01-02  332  			dev_err_ratelimited(                               \
51d3c0e7dc3cf1 Javier Martinez Canillas 2023-01-02  333  				dev, "sending command %#02x failed: %d\n", \
51d3c0e7dc3cf1 Javier Martinez Canillas 2023-01-02  334  				cmd, ret);                                 \
2a9e9daf75231c Joel Selvaraj            2022-06-01  335  			return ret;                                        \
2a9e9daf75231c Joel Selvaraj            2022-06-01  336  		}                                                          \
2a9e9daf75231c Joel Selvaraj            2022-06-01  337  	} while (0)
2a9e9daf75231c Joel Selvaraj            2022-06-01  338  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
